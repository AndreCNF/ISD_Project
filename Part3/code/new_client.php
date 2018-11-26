<?php
    session_start();
?>
<html>
	<body>
		<h1 style="color:MediumSeaGreen;">Vetpital</h1>
		<form action="Select_page_new_client.php" method="post">
            <h3>New Client</h3>

            <table style="width:35%">
                <tr>
                    <td><p>Client Name</p></td>
                    <td><input type="text" name="client_name"/></td>
                </tr>
<?php
                $vat=$_SESSION['clientVAT'];
                echo("<tr>");
                    echo("<td><p>Client VAT</p></td>");
                    echo("<td><input type='text' value='{$vat}' name='client_vat'/></td>");
                    $_SESSION['clientVAT'] = $vat;
                echo("</tr>");
?>
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
            </table>
            <p><input type="hidden" name=/></p>
            <p><input type="submit" value="Create"/></p>
		</form>
	</body>
</html>