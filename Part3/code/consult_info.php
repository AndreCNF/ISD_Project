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
	$ownerVat = $_REQUEST['owner_vat'];
    $date = $_REQUEST['date'];
    # Check received data
    echo("<p>Animal name: {$animal_name} </p>");
	echo("<p>Owner VAT: {$ownerVat} </p>");
	echo("<p>Consult date: {$date} </p>");
    
    echo("<h3>Animal Characteristics</h3>");
	# Get the animal information
	$sql = "CALL AnimalInfo('$animal_name','$ownerVat','$date');";
	$result = $connection->query($sql);
	if ($result == FALSE)
	{
		$info = $connection->errorInfo();
		echo("<p>Error: {$info[2]}</p>");
		exit();
	}
	# Display animal information
    echo("<table border=\"2\">");
    echo("<tr><td>Animal Name</td><td>Owner Name</td><td>Species name</td><td>Colour</td><td>Gender</td><td>Age</td><td>Weight</td></tr>");
	foreach($result as $row)
	{
		echo("<tr align='center'>");
		echo("<td>{$animal_name}</td>");
		echo("<td>{$row['name_owner']}</td>");
		echo("<td>{$row['species']}</td>");
		echo("<td>{$row['colour']}</td>");
		echo("<td>{$row['gender']}</td>");
		echo("<td>{$row['age']}</td>");
		echo("<td>{$row['weight']}</td>");
		echo("</tr>");
	}
	echo("</table>");
	$result = NULL;

	# Get the soap notes
	$sql = "CALL SoapInfo('$animal_name','$ownerVat','$date');";
	$result = $connection->query($sql);
	if ($result == FALSE)
	{
		$info = $connection->errorInfo();
		echo("<p>Error: {$info[2]}</p>");
		exit();
	}
	if ($result->rowCount() == 0)
	{
		echo("<h3>SOAP Notes</h3>");
		echo("<p>There are no SOAP notes</p>");
	}else
	{
		# Display soap notes
		echo("<h3>SOAP Notes</h3>");
		echo("<table border=\"0\" cellspacing=\"5\">");
		foreach($result as $row)
		{
			echo("<tr><td style='font-weight:bold'>S</td><td>{$row['s']}</td></tr>");
			echo("<tr><td style='font-weight:bold'>O</td><td>{$row['o']}</td></tr>");
			echo("<tr><td style='font-weight:bold'>A</td><td>{$row['a']}</td></tr>");
			echo("<tr><td style='font-weight:bold'>P</td><td>{$row['p']}</td></tr>");
		}
		echo("</table>");
	}
	$result = NULL;
	
	# Get the diagnosis information
	$sql = "CALL DiagnosisInfo('$animal_name','$ownerVat','$date');";
	$result = $connection->query($sql);
	if ($result == FALSE)
	{
		$info = $connection->errorInfo();
		echo("<p>Error: {$info[2]}</p>");
		exit();
	}
	# Display diagnosis information
	echo("<h3>Diagnosis</h3>");
    echo("<table border=\"2\">");
    echo("<tr><td>Diagnosis Code</td><td>Diagnosis Name</td></tr>");
	foreach($result as $row)
	{
		echo("<tr align='center'>");
		echo("<td>{$row['code']}</td>");
		echo("<td>{$row['name']}</td>");
		echo("</tr>");
	}
	echo("</table>");
	$result = NULL;

	# Get the prescriptions information
	$sql = "CALL PrescriptionsInfo('$animal_name','$ownerVat','$date');";
	$result = $connection->query($sql);
	if ($result == FALSE)
	{
		$info = $connection->errorInfo();
		echo("<p>Error: {$info[2]}</p>");
		exit();
	}
	# Display prescriptions information
	echo("<h3>Presciptions</h3>");
    echo("<table border=\"2\">");
    echo("<tr><td>Diagnosis Code</td><td>Medication Name</td><td>Medication Lab</td><td>Medication Dosage</td><td>Regime</td></td></tr>");
	foreach($result as $row)
	{
		echo("<tr align='center'>");
		echo("<td>{$row['code']}</td>");
		echo("<td>{$row['med_name']}</td>");
		echo("<td>{$row['lab']}</td>");
		echo("<td>{$row['dosage']}</td>");
		echo("<td>{$row['regime']}</td>");
		echo("</tr>");
	}
	echo("</table>");
	$result = NULL;	
	$connection = null;
?>
	</body>
</html>