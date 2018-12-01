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
	$animal_name = $_REQUEST['animal'];
	$owner_name = $_REQUEST['owner'];
	$ownerVat = $_REQUEST['ownerVat'];

	# Indicating which animal was examined in the new blood test procedure
	echo("<h3>New blood test</h3>");
    echo("<p>Animal name: {$animal_name} </p>");
	echo("<p>Owner name: {$owner_name} </p>");
	echo("<p>Owner VAT: {$ownerVat} </p>");

	# Form to introduce new blood test data
	echo("<form action=\"insert_blood_test.php\" method=\"post\">");
	echo("<h3>Please introduce the following informations</h3>");
	echo("<p>Assistant VAT: </p>");
	echo("<input type=\"number\" name=\"assistant_vat\"/>");
	echo("<p>White blood cell count: </p>");
	echo("<input type=\"number\" name=\"white_blood_cell_count\"/>");
	echo("<p>Number of neutrophils: </p>");
	echo("<input type=\"number\" name=\"number_neutrophils\"/>");
	echo("<p>Number of monocytes: </p>");
	echo("<input type=\"number\" name=\"number_monocytes\"/>");
	echo("<input type='hidden' name='animal' value='{$animal_name}'/>\n");
	echo("<input type='hidden' name='owner_vat' value='{$ownerVat}'/>\n");
	echo("<input type='hidden' name='date' value='{$row['date']}'/>\n");
	echo("<p><input type=\"submit\" value=\"Register\"/></p>");
	echo("</form>");

	$connection = null;
?>
	</body>
</html>