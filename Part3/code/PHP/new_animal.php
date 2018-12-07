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

	# Form that asks the user for the animal's name and the owner's name
	echo("<form action=\"\" method=\"post\">");
	echo("<h3>New Animal</h3>");
	echo("<table style=\"width:35%\">");
	echo("<tr>");

	if(isset($_REQUEST['saveNameAndVAT']) or isset($_REQUEST['specialization_request']) or isset($_REQUEST['save_species']) or isset($_REQUEST['registerAnimal'])) {
		# Get the animal's name
		$animal_name = $_REQUEST['animal_name'];
		echo("<td><input type='hidden' value='{$animal_name}' name='animal_name'/></td>");
		echo("<p>Animal name: {$animal_name}</p>");
	} else {
		# While the user doesn't specify the animal's name, ask for that information
		echo("<td><p>Animal Name</p></td>");
		echo("<td><input type='text' value='{$animal_name}' name='animal_name'/></td>");
	}

	echo("<td></td>");
	echo("</tr>");
	echo("<tr>");
	echo("<td><p>Owner Name</p></td>");
	echo("<td><input type='text' value='{$owner_name}' name='owner_name'/></td>");
	echo("<td><input type='submit' name=\"saveNameAndVAT\" value=\"Save & Get VAT's\"/></td>");
	echo("</tr>");
	echo("</table>");
	echo("</form>");

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
			$owner_name = $row['NAME'];
			echo("<option value=\"{$_POST['client_vat_option']}\">{$_POST['client_vat_option']} - $owner_name</option>");
			echo("<input type='hidden' name='owner_name' value='{$owner_name}' />");
		}
	} 

	# Search for the VAT associated to the specified owner name
	else {
		$sql ="CALL get_vat_from_name('$owner_name');";
		$result = $connection->query($sql);
		if ($result == FALSE)
		{
			$info = $connection->errorInfo();
			echo("<p>Error: {$info[2]}</p>");
			exit();
		}
		foreach($result as $row)
		{
			$client_vat = $row['VAT'];
			$owner_name = $row['NAME'];
			echo("<option value=\"$client_vat\">$client_vat - $owner_name</option>");
		}
	}

	# Free the result variable for the next queries
	$result = null;

	echo("</select>");
	echo("</td>");
	echo("<td></td>");
	echo("</tr>");

	# Open the form to write species, color, gender and birth year, after selecting the animal's name and owner
	if(isset($_REQUEST['saveNameAndVAT']) or isset($_REQUEST['specialization_request']) or isset($_REQUEST['save_species']) or isset($_REQUEST['registerAnimal'])) {
		$animal_name = $_REQUEST['animal_name'];

		# Selecting the species name
		echo("<tr>");

		$animal_name = $_REQUEST['animal_name'];
		$species_name = $_REQUEST['species_name'];
		$client_vat_option = $_REQUEST['client_vat_option'];
		$colour = $_REQUEST['colour'];
		$gender = $_REQUEST['gender'];
		$birth_year = $_REQUEST['birth_year'];

		if((!isset($_REQUEST['specialization_request']) and (!isset($_REQUEST['save_species'])))){
			echo("<td><p>Species</p></td>");
			echo("<td><select name=\"species_name\">");

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

			echo("</select>");
			echo("</td>");
			echo("<td><input type='submit' value=\"Specialize\" name=\"specialization_request\"/></td>");
			echo("<td><input type='submit' value=\"Save\" name=\"save_species\"/></td>");
			
			# Free the result variable for the next queries
			$result = null;
		} elseif (!isset($_REQUEST['save_species'])) {
			echo("<td><p>Species</p></td>");
			echo("<td><select name=\"species_name\">");

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

			echo("</select>");
			echo("</td>");
			echo("<td><input type='submit' value=\"Specialize\" name=\"specialization_request\"/></td>");
			echo("<td><input type='submit' value=\"Save\" name=\"save_species\"/></td>");
			
			# Free the result variable for the next queries
			$result = null;
		}
		elseif (isset($_REQUEST['save_species'])) {
			# Print the species name after the user saved the specified species
			echo("<p>Species: {$species_name}</p>");
		}

		echo("<input type='hidden' value='{$animal_name}' name='animal_name'/>");
		echo("<input type='hidden' value='{$owner_name}' name='owner_name'/>");
		echo("<input type='hidden' value='{$colour}' name='colour'/>");
		echo("<input type='hidden' value='{$gender}' name='gender'/>");
		echo("<input type='hidden' value='{$birth_year}' name='birth_year'/>");
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
		echo("<td><input type='text' name='colour' default={$colour}/></td>");
		echo("</tr>");
		echo("<tr>");
		echo("<td><p>Gender</p></td>");
		echo("<td><input type=\"radio\" value=\"Male\" name=\"gender\">Male");
		echo("<input type=\"radio\" name=\"gender\" value=\"Female\"/>Female</td>");
		echo("</tr>");
		echo("<tr>");
		echo("<td><p>Birth Year</p></td>");
		echo("<td><input type='number' name='birth_year' default={$birth_year}/></td>");
		echo("</tr>");
		echo("</table>");
		echo("<input type='hidden' value='{$animal_name}' name='animal_name'/>");
		echo("<input type='hidden' value='{$species_name}' name='species_name'/>");
		echo("<input type='hidden' value='{$client_vat_option}' name='client_vat_option'/>");
		echo("<p><input type=\"submit\" value=\"Register new Animal\" name=\"registerAnimal\"/></p>");
		echo("</form>");

		$all_filled=1;

		# Confirm if all the required inputs are filled
		if(empty($animal_name)) $all_filled=0;
		if(empty($species_name)) $all_filled=0;
		if(empty($client_vat_option)) $all_filled=0;
		if(empty($colour)) $all_filled=0;
		if(empty($gender)) $all_filled=0;
		if(empty($birth_year)) $all_filled=0;

		# Only run the prepared animal creation statement if all the required inputs are filled
		if($all_filled){
			$sql = "INSERT INTO animal(name,VAT,species_name,colour,gender,birth_year) VALUES(?,?,?,?,?,?);";
			$sth = $connection->prepare($sql);

			if ($sth == FALSE) {
				$info = $connection->errorInfo();
				echo("<p>Error: {$info[2]}</p>");
				exit();
			} else {
				$sth->execute(array($animal_name, $client_vat_option, $species_name, $colour, $gender, $birth_year));
				$result = $sth->num_rows;
			}

			# Terminate the connection to the database
			$connection = null;
			
			# Send the user to the new consult registration page
			echo("<form id='jsform' action='register_consult.php' method='post'>");
			echo("<input type='hidden' value='{$animal_name}' name='animal'/>");
			echo("<input type='hidden' value='{$client_vat_option}' name='owner_vat'/>");
			echo("<input type='hidden' value='{$client_vat_option}' name='client_vat'/>");
			echo("</form>");
			echo("<script type='text/javascript'>");
			echo("document.getElementById('jsform').submit();");
			echo("</script>");
		}
	}
?>
	</body>
</html>