<html>
	<body>
		<h1><a href = "http://web.tecnico.ulisboa.pt/ist181579/sibd/proj/HomePage.php" style="color:MediumSeaGreen;text-decoration: none;">Vetpital</a></h1>
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
	$animal_name = $_REQUEST['animal_name'];
    $owner_name = $_REQUEST['owner_name'];
	$clientVat = $_REQUEST['client_vat'];
	echo("<p>Animal name: {$animal_name} </p>");
    echo("<p>Owner name: {$owner_name} </p>");
    echo("<p>Client VAT: {$clientVat} </p>");
	echo("<h3>Search results: </h3>");
	
	# Check for animals that match the search keys
	$sql = "CALL SearchConsultName('$animal_name','$owner_name','$clientVat');";
	$result = $connection->query($sql);
	if ($result == FALSE)
	{
		$info = $connection->errorInfo();
		echo("<p>Error: {$info[2]}</p>");
		exit();
    }
	if ($result->rowCount() == 0)
	{
		echo("<h4>There was no animal found <form action='new_animal.php' method='post'>\n<p><input type='submit' value='Register New Animal'/></p>\n</form></h4>");

	}else{
		# Print the results from the search 
		echo("<table border=\"2\">");
		echo("<tr><td>Animal Name</td><td>Owner VAT</td><td>Owner Name</td><td>Consults with this Client</td></tr>");
		foreach($result as $row)
		{
			echo("<tr align='center'>");
			echo("<td align='center'><form action='display_consults.php' method='post'>\n");
			echo("<input type='hidden' name='animal' value='{$row['animal']}'/>\n");
			echo("<input type='hidden' name='owner' value='{$row['owner']}'/>\n");
			echo("<input type='hidden' name='ownerVat' value='{$row['vat']}'/>\n");
			echo("<input type='hidden' name='clientVat' value='{$clientVat}'/>\n");
			echo("<input type='submit' value='{$row['animal']}'/>\n</form></td>"); 
			echo("<td>{$row['vat']}</td>");
			echo("<td>{$row['owner']}</td>");

			# Establishing the connection with the database
			$host = "db.tecnico.ulisboa.pt";
			$user = "ist181579";
			$pass = "utfv5127";
			$dsn = "mysql:host=$host;dbname=$user";
			try
			{
				$connection_2 = new PDO($dsn, $user, $pass);
			}
			catch(PDOException $exception)
			{
				echo("<p>Error: ");
				echo($exception->getMessage());
				echo("</p>");
				exit();
			}

			$sql_2 = "CALL consult_with_client('$animal_name','{$row['vat']}','$clientVat');";
			$this_result = $connection_2->query($sql_2);
			if ($this_result == FALSE)
			{
				$info = $connection->errorInfo();
				echo("<p>Error: {$info[2]}</p>");
				exit();
			}
			if ($this_result->rowCount() == 0)
			{
				$consults_with_client = 0;
			} else {
				$consults_with_client = 1;
			}
			
			$this_result = NULL;
			if($consults_with_client == 1){echo("<td>Yes</td>");}
			else{echo("<td>No</td>");}
			echo("</tr>");
			$connection_2=NULL;
		}
		echo("</table>");
		echo("<h4>Select the animal that you are looking for</h4>");
		$result = NULL;
	}
	
	$connection = null;
?>
	</body>
</html>
