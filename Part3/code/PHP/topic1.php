<html>
	<body>
		<!--action= page invoked when the form is submitted -->
		<h1 style="color:MediumSeaGreen;">Welcome to Vetpital</h1>
		<form action="insert.php" method="post">
			<h3>Please introduce the following informations</h3>
			<p>Animal name: </p>
			<input type="text" name="animal_name"/>
			<p>Owner name: </p> 
			<input type="text" name="owner_name"/>
			<p>Client VAT: </p> 
			<input type="number" name="client_vat"/>
			<p><input type="submit" value="Get"/></p>
		</form>
	</body>
</html>