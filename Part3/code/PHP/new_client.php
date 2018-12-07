<html>
	<body>
		<h1><a href = "http://web.tecnico.ulisboa.pt/ist181579/sibd/proj/HomePage.php" style="color:MediumSeaGreen;text-decoration: none;">Vetpital</a></h1>
		<form action="" method="post">
			<h3>New Client</h3>
			<table style="width:35%">
				<tr>
					<td><p>Client Name</p></td>
					<td><input type="text" name="client_name"/></td>
				</tr>
				<tr>
					<td><p>Client VAT</p></td>
					<td><input type='text' name='client_vat'/></td>
				</tr>
				<tr>
					<td><p>Address Street</p></td>
					<td><input type="text" name="client_street"/></td>
				</tr>
				<tr>
					<td><p>Address City</p></td>
					<td><input type="text" name="client_city"/></td>
				</tr>
				<tr>
					<td><p>Address ZIP</p></td>
					<td><input type="text" name="client_zip"/></td>
				</tr>
				<tr>
					<td><p>Phone Number</p></td>
					<td><input type="text" name="client_phone_nb"/></td>
				</tr>
<?php               echo("<input type='hidden' value='{$_REQUEST['from']}' name='from'/>"); ?>
			</table>
			<p><input type="submit" value="Create"/></p>
		</form>

<?php   
		$return2 = $_POST['from'];

		$all_filled = 1;
		if (!empty($_POST["client_name"])) {
			$client_name = $_POST["client_name"];
		} else {echo nl2br("A name is required\n");$all_filled = 0;}
		if (!empty($_POST["client_vat"])) {
			$client_vat = $_POST["client_vat"];
		} else {echo nl2br("A vat is required\n");$all_filled = 0;}
		if (!empty($_POST["client_street"])) {
			$client_street = $_POST["client_street"];
		} else {echo nl2br("A street is required\n");$all_filled = 0;}
		if (!empty($_POST["client_city"])) {
			$client_city = $_POST["client_city"];
		} else {echo nl2br("A city is required\n");$all_filled = 0;}
		if (!empty($_POST["client_zip"])) {
			$client_zip = $_POST["client_zip"];
		} else {echo nl2br("A zip is required\n");$all_filled = 0;}
		if (!empty($_POST["client_phone_nb"])) {
			$client_phone_nb = $_POST["client_phone_nb"];
		} else {echo nl2br("A phone number is required\n");$all_filled = 0;}

		if($all_filled == 1){
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

			$sql = "INSERT INTO person VALUES(?,?,?,?,?);INSERT INTO client VALUES(?);INSERT INTO phone_number VALUES(?,?);";
			$sth = $connection->prepare($sql);

			if ($sth == FALSE) {
				$info = $connection->errorInfo();
				echo("<p>Error: {$info[2]}</p>");
				exit();
			} else {
				$sth->execute(array($client_vat,$client_name,$client_street,$client_city,$client_zip,$client_vat,$client_vat,$client_phone_nb));
				$result = $sth->num_rows;
			}
			$connection = null;
			
			
			#Sends the person back to the page where it has
			header("Location: Search.php");
		}
?>
	
	</body>
</html>
