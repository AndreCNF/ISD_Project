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
	
	$assistant_vat = $_REQUEST['assistant_vat'];
	$white_blood_cell_count = $_REQUEST['white_blood_cell_count'];
	$number_neutrophils = $_REQUEST['number_neutrophils'];
	$number_monocytes = $_REQUEST['number_monocytes'];

	// TODO: Access the variables animal_name, VAT_owner and date_timestamp from the select consult
	// to which the new blood test will be associated.

	# Call the procedure the inserts the blood test procedure in the database
	$sql = "CALL InsertBloodTest('$animal_name', '$VAT_owner', '$date_timestamp', '$num');";
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