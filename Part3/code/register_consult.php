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
    	$ownerVat = $_REQUEST['owner_vat'];
    	$clientVat = $_REQUEST['client_vat'];
    	# Check received data
    	echo("<p>Animal name: {$animal_name} </p>");
    	echo("<p>Owner VAT: {$ownerVat} </p>");
    	echo("<p>Client VAT: {$clientVat}</p>");
    
	echo("<h3>Select a type of consult</h3>");
	# Button to create a consult with the actual date
	echo("<form action=\"\" method=\"post\">");
	echo("<input type='hidden' name='animal' value='{$animal_name}'/>\n");
	echo("<input type='hidden' name='owner_vat' value='{$ownerVat}'/>\n");
	echo("<input type='hidden' name='client_vat' value='{$clientVat}'/>\n");
	echo("<p><input type=\"submit\" name=\"btnRegisterActual\" value=\"Current Consult\"/></p>");
	echo("</form>");
	# Button to create a consult with a previous date
	echo("<form action=\"\" method=\"post\">");
	echo("<input type='hidden' name='animal' value='{$animal_name}'/>\n");
	echo("<input type='hidden' name='owner_vat' value='{$ownerVat}'/>\n");
	echo("<input type='hidden' name='client_vat' value='{$clientVat}'/>\n");
	echo("<p><input type=\"submit\" name=\"btnRegisterPrevious\" value=\"Previous Consult\"/></p>");
	echo("</form>");
    
	$animal_name = $_REQUEST['animal'];
	$ownerVat = $_REQUEST['owner_vat'];
	$clientVat = $_REQUEST['client_vat'];
	$date = $_REQUEST['date_'];
	$time = $_REQUEST['hour_'];
	$date_timestamp = $_REQUEST['date_timestamp'];
	$s = $_REQUEST['s'];
	$o = $_REQUEST['o'];
	$a = $_REQUEST['a'];
	$p = $_REQUEST['p'];
	$vetVat = $_REQUEST['vet'];
	$weight = $_REQUEST['weight'];
	$d_code = $_REQUEST['d_code'];
    
    	# It is desired a new consult with the actual date
    	if (isset($_REQUEST['btnRegisterActual']))
    	{
        	$date = date("Y-m-d");
		$time = date("H:i:s");
    	}
    
    	# It is desired a new consult with a previous date - select date
    	if (isset($_REQUEST['btnRegisterPrevious']))
    	{
        	$date = date("Y-m-d");
		echo("<h3> Previous Consult</h3>");
		echo("<form action=\"\" method=\"post\">");
		echo("<p>Consult date and hour:</p>");
		echo("<input type='date' name='date_' max='{$date}'/>\n");
		echo("<input type='hidden' name='animal' value='{$animal_name}'/>\n");
		echo("<input type='hidden' name='owner_vat' value='{$ownerVat}'/>\n");
		echo("<input type='hidden' name='client_vat' value='{$clientVat}'/>\n");
		echo("<p><input type=\"submit\" name=\"btnRegisterPreviousHour\" value=\"Proceed\"/></p>");
		echo("</form>");
    	}
    
    	# It is desired a new consult with a previous date - select time
    	if (isset($_REQUEST['btnRegisterPreviousHour']))
    	{
		$CurrentDate = date("Y-m-d");
		$time = date("H:i:s");
		echo("<h3> Previous Consult</h3>");
		echo("<p>Selected date: $date</p>");
		echo("<form action=\"\" method=\"post\">");
		echo("<p>Consult hour:</p>");
        	if ($CurrentDate == $date){
            		echo("<input type='time' name='hour_' max='{$time}'/>\n");
        	}else{
            		echo("<input type='time' name='hour_' />\n");
        	}
		echo("<input type='hidden' name='date_' value='{$date}'/>");
		echo("<input type='hidden' name='animal' value='{$animal_name}'/>\n");
		echo("<input type='hidden' name='owner_vat' value='{$ownerVat}'/>\n");
		echo("<input type='hidden' name='client_vat' value='{$clientVat}'/>\n");
		echo("<p><input type=\"submit\" name=\"Proceed\" value=\"Proceed\"/></p>");
		echo("</form>");
    	}
    
    	# Collect data required to create a new consult
    	if (isset($_REQUEST['Proceed']) || isset($_REQUEST['btnRegisterActual']))
    	{   
		echo("<h3>New Consult</h3>");
		$date_timestamp = $date . " ";
		$date_timestamp = $date_timestamp . $time;
		echo("<p>$date_timestamp</p>");
		echo("<form action=\"\" method=\"post\">");
		echo("<p style='font-weight:bold'>Veterinary: <span style='margin-left:0.5em'>");
		echo("<select name='vet'>");
		$sql = "SELECT person.VAT AS VAT, name FROM veterinary INNER JOIN person ON veterinary.VAT = person.VAT ORDER BY person.VAT";
		$result = $connection->query($sql);
        	if ($result == FALSE)
        	{
            		$info = $connection->errorInfo();
            		echo("<p>Error: {$info[2]}</p>");
            		exit();
        	}
        	foreach($result as $row)
        	{
            		$vet_vat = $row['VAT'];
            		$option = $vet_vat . " - ";
            		$option = $option . $row['name'];
            		echo("<option value=\"$vet_vat\">$option</option>");
        	}
		echo("</select>");
		echo("</p>");       
		echo("<p style='font-weight:bold'> Weight: <span style='margin-left:2em'>");
		echo("<input type='number' step='0.01' name='weight'/>");
		echo("<p style='font-weight:bold'> SOAP Notes:</p>");
		echo("<table border=\"0\" cellspacing=\"5\">");
		echo("<tr align='center'>");
		echo("<tr align='center'><td style='font-weight:bold'> S</td><td><input type='text' name='s'/></td></tr>\n");
		echo("<tr align='center'><td style='font-weight:bold'> O</td><td><input type='text' name='o'/></td></tr>\n");
		echo("<tr align='center'><td style='font-weight:bold'> A</td><td><input type='text' name='a'/></td></tr>\n");
		echo("<tr align='center'><td style='font-weight:bold'> P</td><td><input type='text' name='p'/></td></tr>\n");
		echo("</table>");    
		echo("<input type='hidden' name='animal' value='{$animal_name}'/>\n");
		echo("<input type='hidden' name='owner_vat' value='{$ownerVat}'/>\n");
		echo("<input type='hidden' name='client_vat' value='{$clientVat}'/>\n");
		echo("<input type='hidden' name='date_timestamp' value='{$date_timestamp}'"); 
		echo("<p><input type=\"submit\" name=\"RegisterCons\" value=\"Register Consult\"/></p>");
		echo("</form>");
		$result = NULL;
    	}
    
    	# Register the new consult in the database
    	if (isset($_REQUEST['RegisterCons']))
    	{
        	$sql = "CALL InsertConsult('$animal_name','$ownerVat','$date_timestamp','$s','$o','$a','$p','$clientVat','$vetVat','$weight');";
    		if ($connection->query($sql) == TRUE){
            		echo("<p style='font-weight:bold'> Consult was successfully created!</p>");
        	}else{
		    	$info = $connection->errorInfo();
		    	echo("<p>Error: {$info[2]}</p>");
		    	exit();
        	}  
    	}

    	# Collect diagnosis codes for registration
    	if (isset($_REQUEST['RegisterCons']) | isset($_REQUEST['CollectDiag']))
    	{
		echo("<h3>Associate Diagnosis</h3>");
		echo("<form action=\"\" method=\"post\">");

		echo("<p style='font-weight:bold'>Diagnosis code: <span style='margin-left:0.5em'>");
		echo("<select name='d_code'>");
		$sql = "SELECT code, name FROM diagnosis_code ORDER BY code";
		$result = $connection->query($sql);
		if ($result == FALSE)
        	{
            		$info = $connection->errorInfo();
            		echo("<p>Error: {$info[2]}</p>");
            		exit();
        	}
        	foreach($result as $row)
        	{
            		$code = $row['code'];
            		$option = $code . " - ";
            		$option = $option . $row['name'];
            		echo("<option value=\"$code\">$option</option>");
        	}
		echo("</select>");
		echo("</p>");   
		echo("<input type='hidden' name='animal' value='{$animal_name}'/>\n");
		echo("<input type='hidden' name='owner_vat' value='{$ownerVat}'/>\n");
		echo("<input type='hidden' name='client_vat' value='{$clientVat}'/>\n");
		echo("<input type='hidden' name='date_timestamp' value='{$date_timestamp}'"); 
		echo("<p><input type=\"submit\" name=\"RegisterDiag\" value=\"Register Diagnosis\"/></p>");
		echo("</form>");
    	}

    	# Register new diagnosis code
    	if (isset($_REQUEST['RegisterDiag']))
    	{
        	echo("<h3>New Diagnosis</h3>");
        	$sql = "CALL InsertDiagnosis('$d_code','$animal_name','$ownerVat','$date_timestamp');";
    		if ($connection->query($sql) == TRUE){
            		echo("<p style='font-weight:bold'> Diagnosis was successfully added!</p>");
        	}else{
		    	$info = $connection->errorInfo();
		    	echo("<p>Error: {$info[2]}</p>");
		    	exit();
        	}
		echo("<form action=\"\" method=\"post\">");
		echo("<input type='hidden' name='animal' value='{$animal_name}'/>\n");
		echo("<input type='hidden' name='owner_vat' value='{$ownerVat}'/>\n");
		echo("<input type='hidden' name='client_vat' value='{$clientVat}'/>\n");
		echo("<input type='hidden' name='date_timestamp' value='{$date_timestamp}'"); 
		echo("<p><input type=\"submit\" name=\"CollectDiag\" value=\"New Diagnosis\"/></p>");
		echo("</form>");
    	}
	
	$connection = null;
?>
	</body>
</html>
