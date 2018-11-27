<?php
	session_start();
	# $_SESSION['var']="sada";
	$animal_name = $_REQUEST['animal_name'];
    $owner_name = $_REQUEST['owner_name'];
	$clientVAT = $_REQUEST['client_vat'];
	$_SESSION['animal_name'] = $animal_name;
	$_SESSION['owner_name'] = $owner_name;
	$_SESSION['clientVAT'] = $clientVAT;
?>
<html>
	<body>
		<h1 style="color:MediumSeaGreen;">Vetpital</h1>
<?php
	# Establishing the connection with the database
	$host = "db.tecnico.ulisboa.pt";
	$user = "ist181579";
	$pass = "utfv5127";
	$dsn = "mysql:host=$host;dbname=$user";
	try
	{
		$connection = new PDO($dsn, $user, $pass);
	}
	catch(PDOException $exception)
	{
		echo("<p>Error: ");
		echo($exception->getMessage());
		echo("</p>");
		exit();
    }
	
	# Data received
    echo("<p>Animal name: {$animal_name} </p>");
    echo("<p>Owner name: {$owner_name} </p>");
    echo("<p>Client VAT: {$clientVAT} </p>");
	echo("<h3>Search results: </h3>");
	
	# Check for animals that match the search keys
	$sql = "CALL SearchConsultName('$animal_name','$owner_name',$clientVAT);";
	$result = $connection->query($sql);
	if ($result == FALSE)
	{
		$info = $connection->errorInfo();
		echo("<p>Error: {$info[2]}</p>");
		exit();
    }
	if ($result->rowCount() == 0)
	{
		#echo("<h4>There was no animal found:    <a href=\"new_animal.php?animal={$animal_name}&");
		#echo("owner={$owner_name}\"> Register new animal </a> </h4>");
		echo("<h4>There was no animal found <form action='new_animal.php' method='post'>\n<p><input type='submit' value='Register New Animal'/></p>\n</form></h4>");

	}else{
		# Print the results from the search 
		echo("<table border=\"2\">");
		echo("<tr><td>Animal Name</td><td>Owner VAT</td><td>Owner Name</td><td>Consults with this Client</td></tr>");
		foreach($result as $row)
		{
			echo("<tr align='center'>");
			#echo("<td><a href=\"display_consults.php?animal={$row['animal']}&owner={$row['owner']}\"> {$row['animal']} </a></td>");
			echo("<td align='center'><form action='display_consults.php' method='post'>\n");
			echo("<input type='hidden' name='animal' value='{$row['animal']}'/>\n");
			echo("<input type='hidden' name='owner' value='{$row['owner']}'/>\n");
			echo("<input type='submit' value='{$row['animal']}'/>\n</form></td>"); 
			echo("<td>{$row['vat']}</td>");
			echo("<td>{$row['owner']}</td>");
			if($row['thisClient'] == 1){echo("<td>Yes</td>");}
			else{echo("<td>No</td>");}
			echo("</tr>");
		}
		echo("</table>");
		$result = NULL;

		# Check if the client is registered in the database
		$sql = "SELECT * FROM client WHERE VAT = :v";
		$st = $connection->prepare($sql);
		$st->bindParam(':v',$clientVAT);
		if ($st == FALSE){
			$info = $connection->errorInfo();
			echo("<p>Error: {$info[2]}</p>");
			exit();
		}else{
			$res = $st->execute();
			if ($res == FALSE){
				$info = $connection->errorInfo();
				echo("<p>Error: {$info[2]}</p>");
				exit();
			}
			$r = $st->fetch();
			if ($st->rowCount() == 0)
			{	
				# Present the option to create new client
				#echo("<h4>This client is not registered:    <a href=\"new_client.php?\"> Register new client </a> </h4>");
				echo("<h4>This client is not registered please  <form action='NewClient.php' method='post'>\n<p><input type='submit' value='Register new Client'/></p>\n</form></h4>");
			}else{
				echo("<h4>Select the animal that you are looking for</h4>");
			}
		}
		
	}
	
	$connection = null;
?>
	</body>
</html>