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

	# While the user doesn't specify the animal's name and its owner, ask for that information
	if(!isset($_REQUEST['saveNameAndVAT'])) {
		# Form that asks the user for the animal's name and the owner's name
		echo("<form action=\"\" method=\"post\">");
		echo("<h3>New Animal</h3>");
		echo("<table style=\"width:35%\">");
		echo("<tr>");
		echo("<td><p>Animal Name</p></td>");
		echo("<td><input type='text' value='{$animal_name}' name='animal_name'/></td>");
		echo("<td></td>");
		echo("</tr>");
		echo("<tr>");
		echo("<td><p>Owner Name</p></td>");
		echo("<td><input type='text' value='{$owner_name}' name='owner_name'/></td>");
		echo("<td><input type='submit' name=\"saveNameAndVAT\" value=\"Save & Get VAT's\"/></td>");
		echo("</tr>");
		echo("</table>");
		echo("</form>");

		$animal_name = $_REQUEST['animal_name'];
		$owner_name = $_REQUEST['owner_name'];

		# Get the animal's name
		if(!empty($_POST['animal_name']))
		{
			$animal_name = $_POST['animal_name'];
		}

		# Get the client's name
		if(!empty($_POST['owner_name']))
		{
			$owner_name = $_POST['owner_name'];
		}

		# Multiple choice form to select the owner of the animal
		echo("<table style=\"width:35%\">");
		echo("<td><p>VAT - Owner Full Name</p></td>");
		echo("<td>");
		echo("<form action=\"\" method=\"post\">");
		echo("<select name='client_vat_option'>");

		# Search for the name associated to the specified VAT
		if(!empty($_POST['client_vat_option'])){
			$sql="SELECT name as NAME FROM person WHERE VAT='{$_POST['client_vat_option']}';";
			$result = $connection->query($sql);
			if ($result == FALSE)
			{
				$info = $connection->errorInfo();
				echo("<p>Error: {$info[2]}</p>");
				exit();
			}
			foreach($result as $row)
			{
				$client_name_procedure = $row['NAME'];
				echo("<option value=\"{$_POST['client_vat_option']}\">{$_POST['client_vat_option']} - $client_name_procedure</option>");
				echo("<input type='hidden' name='client_name_procedure' value='{$client_name_procedure}' />");
			}
		} 

		# Search for the VAT associated to the specified owner name
		else {
			$sql ="CALL get_vat_from_name('$client_name');";
			$result = $connection->query($sql);
			if ($result == FALSE)
			{
				$info = $connection->errorInfo();
				echo("<p>Error: {$info[2]}</p>");
				exit();
			}
			foreach($result as $row)
			{
				$client_vat_procedure = $row['VAT'];
				$client_name_procedure = $row['NAME'];
				echo("<option value=\"$client_vat_procedure\">$client_vat_procedure - $client_name_procedure</option>");
			}
		}

		# Free the result variable for the next queries
		$result = null;

		echo("</select>");
		echo("</td>");
		echo("<td></td>");
		echo("</tr>");
	}

	# Open the form to write species, color, gender and birth year, after selecting the animal's name and owner
	if(isset($_REQUEST['saveNameAndVAT'])) {
		echo("<p>Animal name: {$animal_name}</p>");
		echo("<p>Owner VAT and name: {$client_name_procedure}</p>");

		# Selecting the species name
		echo("<tr>");
		echo("<td><p>Species</p></td>");
		echo("<td><select name=\"species_name\">");

		if(!isset($_POST['specialization_request'])){
			# Get the most generic species names
			$sql ="CALL more_general();";
			$result = $connection->query($sql);
			if ($result == FALSE)
			{
				$info = $connection->errorInfo();
				echo("<p>Error: {$info[2]}</p>");
				exit();
			}
			foreach($result as $row)
			{
				$species_name_ = $row['species_name'];
				echo("<option value=\"$species_name_\">$species_name_</option>");
			}
			
			# Free the result variable for the next queries
			$result = null;
		} else {
			# Get a subspecies name from the previous generic species
			$sql ="CALL more_specific('{$_POST['species_name']}');";
			$result = $connection->query($sql);
			if ($result == FALSE)
			{
				$info = $connection->errorInfo();
				echo("<p>Error: {$info[2]}</p>");
				exit();
			}
			if($result->rowCount() == 0){
				echo("<option value=\"{$_POST['species_name']}\">{$_POST['species_name']}</option>");
				echo("<input type='hidden' value='yes' name='final_specialization'/>");
				echo("<input type='hidden' value='{$_POST['client_vat_option']}' name='client_vat_option'/>");
			} else { 
				foreach($result as $row)
				{
					$species_name_ = $row['species_name'];
					echo("<option value=\"$species_name_\">$species_name_</option>");
				}
			}
			
			# Free the result variable for the next queries
			$result = null;
		}

		echo("</select>");  
		echo("</td>");
		echo("<td><input type='submit' value=\"Save & Specialize\" name=\"specialization_request\"/></td>");

		echo("<input type='hidden' value='{$_POST['animal_name']}' name='animal_name'/>");
		echo("<input type='hidden' value='{$_POST['client_name']}' name='client_name'/>");
		echo("</tr>");
		echo("</form>");
		echo("</table>");

		if($_POST['final_specialization'] == 'yes'){
			echo("<p>There is no more possible specialization</p>");
		}

		echo("<table style=\"width:35%\">");

		# Form to get the animal's colour, gender and birth year, with a final button to register the animal
		echo("<form action=\"\" method=\"post\">");
		echo("<tr>");
		echo("<td><p>Colour</p></td>");
		echo("<td><input type='text' name='colour'/></td>");
		echo("</tr>");
		echo("<tr>");
		echo("<td><p>Gender</p></td>");
		echo("<td><input type=\"radio\" value=\"Male\" name=\"gender\">Male");
		echo("<input type=\"radio\" name=\"gender\" value=\"Female\"/>Female</td>");
		echo("</tr>");
		echo("<tr>");
		echo("<td><p>Birth Year</p></td>");
		echo("<td><input type='text' name='birth_year'/></td>");
		echo("</tr>");
		echo("</table>");
		echo("<p><input type=\"submit\" value=\"Register new Animal\"/></p>");
		echo("<input type='hidden' value='{$_POST['animal_name']}' name='animal_name'/>");
		echo("<input type='hidden' name='client_name_procedure' value='{$_POST['client_name_procedure']}'/>");
		echo("<input type='hidden' value='{$_POST['species_name']}' name='species_name'/>");
		echo("<input type='hidden' value='{$_POST['client_vat_option']}' name='client_vat_option'/>");
		echo("</form>");

		$all_filled=1;

		# Confirm if all the required inputs are filled
		if(empty($_POST['animal_name'])) $all_filled=0;
		if(empty($_POST['species_name'])) $all_filled=0;
		if(empty($_POST['client_vat_option'])) $all_filled=0;
		if(empty($_POST['colour'])) $all_filled=0;
		if(empty($_POST['gender'])) $all_filled=0;
		if(empty($_POST['birth_year'])) $all_filled=0;

		# Only run the prepared animal creation statement if all the required inputs are filled
		if($all_filled){
			$sql = "INSERT INTO animal(name,VAT,species_name,colour,gender,birth_year) VALUES(?,?,?,?,?,?);";
			$sth = $connection->prepare($sql);

			if ($sth == FALSE) {
				$info = $connection->errorInfo();
				echo("<p>Error: {$info[2]}</p>");
				exit();
			} else {
				$sth->execute(array($_POST['animal_name'],$_POST['client_vat_option'],$_POST['species_name'],$_POST['colour'],$_POST['gender'],$_POST['birth_year']));
				$result = $sth->num_rows;
			}

			# Terminate the connection to the database
			$connection = null;
			
			# Send the user to the new consult registration page
			echo("<form id='jsform' action='register_consult.php' method='post'>");
			echo("<input type='hidden' value='{$_POST['animal_name']}' name='animal'/>");
			echo("<input type='hidden' value='{$_POST['client_vat_option']}' name='owner_vat'/>");
			echo("<input type='hidden' value='{$_POST['client_vat_option']}' name='client_vat'/>");
			echo("</form>");
			echo("<script type='text/javascript'>");
			echo("document.getElementById('jsform').submit();");
			echo("</script>");
		}
	}
?>
	</body>
</html>