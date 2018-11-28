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
	$owner_name = $_REQUEST['owner'];
    $date = $_REQUEST['date'];
    # Check received data
    echo("<p>Animal name: {$animal_name} </p>");
	echo("<p>Owner name: {$owner_name} </p>");
    echo("<p>Owner VAT: {$ownerVat} </p>");
    
    # Display animal information
    echo("<h3>Animal Characteristics</h3>");
    #Perform the query
    echo("<table border=\"2\">");
    echo("<tr><td>Animal Name</td><td>VAT owner</td><td>Species name</td><td>Colour</td><td>Gender</td><td>Age</td><td>Weight</td></tr>");
    echo(""); # print query result info for this criteria

    # Display soap notes
    echo("<h3>Animal Characteristics</h3>");
    echo("<table border=\"2\">");
    echo("<tr><td>S</td><td>{$result['s']}</td></tr>");
    echo("<tr><td>O</td><td>{$result['o']}</td></tr>");
    echo("<tr><td>A</td><td>{$result['a']}</td></tr>");
    echo("<tr><td>P</td><td>{$result['p']}</td></tr>");

	
	
	$connection = null;
?>
	</body>
</html>