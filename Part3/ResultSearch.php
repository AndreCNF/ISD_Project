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

    # Call the function the performs the required query
	$sql = "select SearchConsultName($animal_name,$owner_name,$clientVAT)";
	$result = $connection->query($sql);
	if ($result == FALSE)
	{
		$info = $connection->errorInfo();
		echo("<p>Error: {$info[2]}</p>");
		exit();
    }
    
	echo("<table border=\"2\">");
	echo("<tr><td>Animal_name</td><td>Animal_name</td></tr>");
	foreach($result as $row)
	{
		echo("<tr><td>");
		echo($row['name']);
		echo("</td></tr>");
	}
	echo("</table>");
	$connection = null;
?>
	</body>
</html>