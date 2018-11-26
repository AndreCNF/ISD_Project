<?php
	session_start();
	# $_SESSION['var']="sada";
	$animal_name = $_SESSION['animal_name'];
    $owner_name = $_SESSION['owner_name'];
	session_destroy();
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
	echo("<h3>Consults </h3>");
	
	# Check for animals that match the search keys
	$sql = "CALL AnimalConsultInfo('$animal_name','$owner_name');";
	$result = $connection->query($sql);
	if ($result == FALSE)
	{
		$info = $connection->errorInfo();
		echo("<p>Error: {$info[2]}</p>");
		exit();
    }
	$connection = null;
?>
	</body>
</html>