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
	$animal_name = $_REQUEST['animal'];
	$owner_vat = $_REQUEST['ownerVat'];
	$assistant_vat = $_REQUEST['assistant_vat'];
	$white_blood_cell_count = $_REQUEST['white_blood_cell_count'];
	$number_neutrophils = $_REQUEST['number_neutrophils'];
	$number_monocytes = $_REQUEST['number_monocytes'];

	# Call the procedure the inserts the blood test procedure in the database
	$sql = "CALL InsertBloodTest('$animal_name', '$owner_vat', '$date_timestamp', '$num', '$assistant_vat', 
								 '$white_blood_cell_count', '$number_neutrophils', '$number_monocytes');";
	$result = $connection->execute($sql);
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
