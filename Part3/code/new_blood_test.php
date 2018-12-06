<html>
	<body>
		<h1><a href = "http://web.tecnico.ulisboa.pt/ist181579/sibd/proj/HomePage.php" style="color:MediumSeaGreen;text-decoration: none;">Vetpital</a></h1>
<?php
	# Establishing the connection with the database
	$host = "db.tecnico.ulisboa.pt";
	$user = "ist181715";
	$pass = "xjja0952";
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
	$owner_vat = $_REQUEST['owner_vat'];
	$date_timestamp = $_REQUEST['date'];

	# Random num
	// $num = 42;

	# Find out what's the maximum num value of all procedures
	$sql ="CALL GetMaxProcedureNum();";
	$result = $connection->query($sql);
	if ($result == FALSE)
	{
		$info = $connection->errorInfo();
		echo("<p>Error: {$info[2]}</p>");
		exit();
	}
	foreach($result as $row)
	{
		echo("<p>max(num) = {$row['max(num)']}</p>");

		# Make the new procedure's num value bigger than all of the existing ones
		$num = $row['max(num)'] + 1;
		echo("<p>num = {$num}</p>");
	}

	# Indicating which animal was examined in the new blood test procedure
	echo("<h3>New blood test</h3>");
    echo("<p>Animal name: {$animal_name} </p>");
	echo("<p>Owner name: {$owner_name} </p>");
	echo("<p>Owner VAT: {$owner_vat} </p>");
	echo("<p>Date: {$date_timestamp} </p>");

	# Form to introduce new blood test data
	echo("<form action=\"\" method=\"post\">");
	echo("<h3>Please introduce the following informations</h3>");
	echo("<p>Assistant VAT: </p>");
	echo("<select name=\"assistant_vat\">");

	# Get the existent assistant's VAT
	$sql = "SELECT VAT FROM assistant ORDER BY VAT";
	$result = $connection->query($sql);
	if ($result == FALSE)
	{
		$info = $connection->errorInfo();
		echo("<p>Error: {$info[2]}</p>");
		exit();
	}
	foreach($result as $row)
	{
		$assistant_vat = $row['VAT'];
		echo("<option value=\"$assistant_vat\">$assistant_vat</option>");
	}

	echo("</select>");
	echo("<p>White blood cell count: </p>");
	echo("<input type=\"number\" name=\"white_blood_cell_count\"/>");
	echo("<p>Number of neutrophils: </p>");
	echo("<input type=\"number\" name=\"number_neutrophils\"/>");
	echo("<p>Number of monocytes: </p>");
	echo("<input type=\"number\" name=\"number_monocytes\"/>");
	echo("<input type='hidden' name='animal_name' value='{$animal_name}'/>\n");
	echo("<input type='hidden' name='owner_name' value='{$owner_name}'/>\n");
	echo("<input type='hidden' name='owner_vat' value='{$owner_vat}'/>\n");
	echo("<input type='hidden' name='date_timestamp' value='{$date_timestamp}'/>\n");
	echo("<p><input type=\"submit\" name=\"btnRegister\" value=\"Register\"/></p>");
	echo("</form>");

	# Blood test data from the current form
	$white_blood_cell_count = $_REQUEST['white_blood_cell_count'];
	$number_neutrophils = $_REQUEST['number_neutrophils'];
	$number_monocytes = $_REQUEST['number_monocytes'];

	$animal_name = $_REQUEST['animal_name'];
	$owner_name = $_REQUEST['owner_name'];
	$owner_vat = $_REQUEST['owner_vat'];
	$date_timestamp = $_REQUEST['date_timestamp'];
	$assistant_vat = $_REQUEST['assistant_vat'];

	if (isset($_REQUEST['btnRegister'])) {
		$connection->beginTransaction();

		# Call the procedure the inserts the blood test procedure in the database
		$sql = "CALL InsertBloodTest('$animal_name', '$owner_vat', '$date_timestamp', '$num', '$assistant_vat', '$white_blood_cell_count', '$number_neutrophils', '$number_monocytes');";
		$result = $connection->query($sql);

		if ($result) {
			echo "New blood test procedure created successfully";
			$connection->commit();
		} else {
			echo "Error: " . $sql . "<br>" . $connection->errorInfo;
			$connection->rollBack();
		}		
	}

	$connection = null;
?>
	</body>
</html>
