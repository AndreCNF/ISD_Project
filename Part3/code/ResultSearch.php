<html>
	<body>
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
    
    $animal_name = $_REQUEST['animal_name'];
    $owner_name = $_REQUEST['owner_name'];
    $clientVAT = $_REQUEST['client_vat'];
    echo("<p>Animal name: $animal_name </p>");
    echo("<p>Owner name: $owner_name </p>");
    echo("<p>Client VAT: $clientVAT </p>");
    echo("<h3>Search results: </h3>");

    # Call the procedure the performs the required query
	$sql = "CALL SearchConsultName('$animal_name','$owner_name',$clientVAT);";
	$result = $connection->query($sql);
	if ($result == FALSE)
	{
		$info = $connection->errorInfo();
		echo("<p>Error: {$info[2]}</p>");
		exit();
    }
    
	echo("<table border=\"2\">");
	echo("<tr><td>Animal Name</td><td>Owner VAT</td><td>Owner Name</td><td>Consuls with this Client</td></tr>");
	foreach($result as $row)
	{
		echo("<tr>");
		echo("<td>{$row['animal']}</td>");
		echo("<td>{$row['vat']}</td>");
		echo("<td>{$row['owner']}</td>");
		if($row['thisClient'] == 1){echo("<td>Yes</td>");}
		else{echo("<td>No</td>");}
		echo("</tr>");
	}
	echo("</table>");

	# Search if the Client exists
	/*$newsql = "SELECT VAT FROM client WHERE VAT=$clientVAT";
	$nrows = $connection->exec($newsql);
	echo("<p>Rows deleted: $nrows</p>");
	if(($nrows == 0) &&($result != 0)){ #This means that the client doesn't exist
		echo("<h3>Client Not Found</h3>");
		<form action="NewClient.php" method="get"> #So there's the need to create a new one
			<p><input type="submit" value="Register new Client"/></p>
		</form>
	}*/

	$connection = null;
?>
	</body>
</html>