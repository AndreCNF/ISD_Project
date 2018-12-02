<html>
	<body>
		<h1 style="color:MediumSeaGreen;">Vetpital</h1>
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
	$date = $_REQUEST['date'];

	# Random num
	$num = 42;

	# Indicating which animal was examined in the new blood test procedure
	echo("<h3>New blood test</h3>");
    echo("<p>Animal name: {$animal_name} </p>");
	echo("<p>Owner name: {$owner_name} </p>");
	echo("<p>Owner VAT: {$owner_vat} </p>");
	echo("<p>Date: {$date} </p>");

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
	echo("<input type='hidden' name='date' value='{$date}'/>\n");
	echo("<p><input type=\"submit\" name=\"btnRegister\" value=\"Register\"/></p>");
	echo("</form>");

	# Blood test data from the current form
	$white_blood_cell_count = $_REQUEST['white_blood_cell_count'];
	$number_neutrophils = $_REQUEST['number_neutrophils'];
	$number_monocytes = $_REQUEST['number_monocytes'];

	$animal_name = $_REQUEST['animal_name'];
	$owner_name = $_REQUEST['owner_name'];
	$owner_vat = $_REQUEST['owner_vat'];
	$date = $_REQUEST['date'];

    echo("<p>Animal name: {$animal_name} </p>");
	echo("<p>Owner name: {$owner_name} </p>");
	echo("<p>Owner VAT: {$owner_vat} </p>");
	echo("<p>Date: {$date} </p>");

    echo("<p>num: {$num} </p>");
    echo("<p>Assistant VAT: {$assistant_vat} </p>");
    echo("<p>White blood cell count: {$white_blood_cell_count} </p>");
	echo("<p>Number of neutrophils: {$number_neutrophils} </p>");
	echo("<p>Number monocytes: {$number_monocytes} </p>");

	// $all_filled = 1;
	// if (!empty($_REQUEST["animal_name"])) {
	// 	$animal_name = $_REQUEST['animal_name'];
	// } else {echo nl2br("An animal name is required\n");$all_filled = 0;}
	// if (!empty($_REQUEST["owner_vat"])) {
	// 	$owner_vat = $_REQUEST['owner_vat'];
	// } else {echo nl2br("An owner VAT is required\n");$all_filled = 0;}
	// if (!empty($_REQUEST["date"])) {
	// 	$date = $_REQUEST['date'];
	// } else {echo nl2br("A date is required\n");$all_filled = 0;}
	// if (!empty($_REQUEST["assistant_vat"])) {
	// 	$assistant_vat = $_REQUEST['assistant_vat'];
	// } else {echo nl2br("An assistant VAT is required\n");$all_filled = 0;}
	// if (!empty($_REQUEST["white_blood_cell_count"])) {
	// 	$white_blood_cell_count = $_REQUEST['white_blood_cell_count'];
	// } else {echo nl2br("A white blood cell count is required\n");$all_filled = 0;}
	// if (!empty($_REQUEST["number_neutrophils"])) {
	// 	$number_neutrophils = $_REQUEST['number_neutrophils'];
	// } else {echo nl2br("A number of neutrophils is required\n");$all_filled = 0;}
	// if (!empty($_REQUEST["number_monocytes"])) {
	// 	$number_monocytes = $_REQUEST['number_monocytes'];
	// } else {echo nl2br("A number of monocytes is required\n");$all_filled = 0;}
	// if (empty($num)) {
	// 	echo nl2br("A num is required\n");
	// 	$all_filled = 0;
	// }

	// if($all_filled == 1){
	if (isset($_POST['btnRegister'])) {
		# Call the procedure the inserts the blood test procedure in the database
		$sql = "CALL InsertBloodTest('$animal_name', '$owner_vat', '$date_timestamp', '$num', '$assistant_vat', '$white_blood_cell_count', '$number_neutrophils', '$number_monocytes');";
		$result = $connection->exec($sql);
		echo("<p>Rows inserted: $result</p>");

		// $sql = "CALL InsertBloodTest(?, ?, ?, ?, ?, ?, ?, ?);";
		// $sth = $connection->prepare($sql);

		// if ($sth == FALSE) {
		// 	$info = $connection->errorInfo();
		// 	echo("<p>Error: {$info[2]}</p>");
		// 	exit();
		// } else {
		// 	$sth->execute(array($animal_name, $owner_vat, $date_timestamp, $num, $assistant_vat, $white_blood_cell_count, $number_neutrophils, $number_monocytes));
		// 	$result = $sth->num_rows;
		// 	echo("<p>Rows inserted: $result</p>");
		// }
	}

	$connection = null;
?>
	</body>
</html>