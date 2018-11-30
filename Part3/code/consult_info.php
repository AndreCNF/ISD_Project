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
	$animal_name = $_REQUEST['animal'];
	$ownerVat = $_REQUEST['owner_vat'];
    $date = $_REQUEST['date'];
    # Check received data
    echo("<p>Animal name: {$animal_name} </p>");
	echo("<p>Owner VAT: {$ownerVat} </p>");
	echo("<p>Consult date: {$date} </p>");
    
    echo("<h3>Animal Characteristics</h3>");
	# Get the animal information
	$sql = "CALL AnimalInfo('$animal_name','$ownerVat');";
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
		echo("</tr>");
	}
	echo("</table>");
	$result = NULL;

	# Get the animal information
	$sql = "CALL SoapInfo('$animal_name','$ownerVat','$date');";
	$result = $connection->query($sql);
	if ($result == FALSE)
	{
		$info = $connection->errorInfo();
		echo("<p>Error: {$info[2]}</p>");
		exit();
	}
	# Display soap notes
    echo("<h3>SOAP Notes</h3>");
    echo("<table border=\"0\" cellspacing=\"5\">");
    echo("<tr><td>S</td><td>{$result['s']}</td></tr>");
    echo("<tr><td>O</td><td>{$result['o']}</td></tr>");
    echo("<tr><td>A</td><td>{$result['a']}</td></tr>");
	echo("<tr><td>P</td><td>{$result['p']}</td></tr>");
	echo("</table>");
	
	$connection = null;
?>
	</body>
</html>