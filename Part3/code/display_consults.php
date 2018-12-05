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
	$owner_name = $_REQUEST['owner'];
	$ownerVat = $_REQUEST['ownerVat'];
	$clientVat = $_REQUEST['clientVat'];
    echo("<p>Animal name: {$animal_name} </p>");
	echo("<p>Owner name: {$owner_name} </p>");
	echo("<p>Owner VAT: {$ownerVat} </p>");
	echo("<p>Client VAT: {$clientVat} </p>");
	echo("<h3>Consults </h3>");
	
	# Check for animals that match the search keys
	$sql = "CALL AnimalConsultsInfo('$animal_name','$ownerVat');";
	$result = $connection->query($sql);
	if ($result == FALSE)
	{
		$info = $connection->errorInfo();
		echo("<p>Error: {$info[2]}</p>");
		exit();
	}
	# Print list of consults involving that animal
	echo("<table border=\"2\">");
	echo("<tr><td>Date</td><td>Veterinary VAT</td><td>Veterinary Name</td><td>Add blood test</td></tr>");
	foreach($result as $row)
	{
		echo("<tr align='center'>");
		echo("<td align='center'><form action='consult_info.php' method='post'>\n");
		echo("<input type='hidden' name='animal' value='{$animal_name}'/>\n");
		echo("<input type='hidden' name='owner_vat' value='{$ownerVat}'/>\n");
		echo("<input type='hidden' name='date' value='{$row['date']}'/>\n");
		echo("<input type='submit' value='{$row['date']}'/>\n</form></td>"); 
		echo("<td>{$row['vatVet']}</td>");
		echo("<td>{$row['nameVet']}</td>");
		echo("<td align='center'><form action='new_blood_test.php' method='post'>\n");
		echo("<input type='hidden' name='animal_name' value='{$animal_name}'/>\n");
		echo("<input type='hidden' name='owner_name' value='{$owner_name}'/>\n");
		echo("<input type='hidden' name='owner_vat' value='{$ownerVat}'/>\n");
		echo("<input type='hidden' name='date' value='{$row['date']}'/>\n");
		echo("<input type='submit' value=New>\n</form></td>"); 
		echo("</tr>");
	}
	echo("</table>");

	# New consult button
	echo("<p></p>");
	echo("<form action='register_consult.php' method='post'>\n");
	echo("<input type='hidden' name='animal' value='{$animal_name}'/>\n");
	echo("<input type='hidden' name='owner' value='{$owner_name}'/>\n");
	echo("<input type='hidden' name='owner_vat' value='{$ownerVat}'/>\n");
	echo("<input type='hidden' name='client_vat' value='{$clientVat}'/>\n");
	echo("<input type='submit' value='Register new Consult'/>\n</form></td>");

	$result = NULL;
	$connection = null;
?>
	</body>
</html>
