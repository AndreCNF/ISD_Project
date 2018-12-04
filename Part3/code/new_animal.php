<html>
	<body>
		<h1 style="color:MediumSeaGreen;">Vetpital</h1>
		<form action="" method="post">
            <h3>New Animal</h3>
            <table style="width:35%">
                <tr>
                    <td><p>Animal Name</p></td>
<?php
                    $animal_name = $_REQUEST['animal_name'];
                    if(!empty($_POST['animal_name'])){$animal_name = $_POST['animal_name'];}
                    echo("<td><input type='text' value='{$animal_name}' name='animal_name'/></td>");
?>
                <td></td>
                </tr>
                <tr>
                    <td><p>Owner Name</p></td>
<?php
                    $owner_name = $_REQUEST['owner_name'];
                    if(!empty($_POST['client_name'])){$owner_name = $_POST['client_name'];}
                    echo("<td><input type='text' value='{$owner_name}' name='client_name'/></td>");
?>
                    <td><input type='submit' value="Get VAT's"/></td>
                </tr>
            </table>
        </form>
        <table style="width:35%">
            <td><p>VAT - Full Name</p></td>
            <td>
        <form action="" method="post">
        <select name='client_vat_option'>
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
        
        # Get the existent client's VAT
        $client_name = $_POST['client_name'];
        $animal_name = $_POST['animal_name'];
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
        } else {
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
        $connection = null;
?>

                </select>
            </td>
            <td></td>
        </tr>
        <tr>
            <td><p>Species</p></td>
            <td><select name="species_name">
<?php
if(!isset($_POST['specialization_request'])){
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
    
    # Get the existent client's VAT
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
    $connection = null;
} else {
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
    
    # Get the existent client's VAT
    $sql ="CALL more_specific('{$_POST['species_name']}');";
    $result = $connection->query($sql);
    if ($result == FALSE)
    {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
    }
    if($result->rowCount()== 0){
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
    $connection = null;
}
?>
                </select>    
            </td>
            <td><input type='submit' value="Specialize" name="specialization_request"/></td>
<?php
    echo("<input type='hidden' value='{$_POST['animal_name']}' name='animal_name'/>");
    echo("<input type='hidden' value='{$_POST['client_name']}' name='client_name'/>");
?>                  
                </tr>
            </form>
        </table>
<?php 
    if($_POST['final_specialization'] == 'yes'){
        echo("<p>There is no more possible specialization</p>");
    }
?>

        <table style="width:35%">
            <form action="" method="post">
                <tr>
                    <td><p>Colour</p></td>
                    <td><input type='text' name='colour'/></td>
                </tr>
                <tr>
                    <td><p>Gender</p></td>
                    <td><input type="radio" value="Male" name="gender">Male
                    <input type="radio" name="gender" value="Female"/>Female</td>
                </tr>
                <tr>
                    <td><p>Birth Year</p></td>
                    <td><input type='text' name='birth_year'/></td>
                </tr>
            </table>
            <p><input type="submit" value="Register new Animal"/></p>
<?php
    echo("<input type='hidden' value='{$_POST['animal_name']}' name='animal_name'/>");
    echo("<input type='hidden' name='client_name_procedure' value='{$_POST['client_name_procedure']}'/>");
    echo("<input type='hidden' value='{$_POST['species_name']}' name='species_name'/>");
    echo("<input type='hidden' value='{$_POST['client_vat_option']}' name='client_vat_option'/>");
?>
        </form>
<?php

    $all_filled=1;

    if(empty($_POST['animal_name'])) $all_filled=0;
    if(empty($_POST['species_name'])) $all_filled=0;
    if(empty($_POST['client_vat_option'])) $all_filled=0;
    if(empty($_POST['colour'])) $all_filled=0;
    if(empty($_POST['gender'])) $all_filled=0;
    if(empty($_POST['birth_year'])) $all_filled=0;

    if($all_filled){
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
        $connection = null;
        
        
        #Sends the person to register a new consult
        echo("<form id='jsform' action='register_consult.php' method='post'>");
        echo("<input type='hidden' value='{$_POST['animal_name']}' name='animal'/>");
        echo("<input type='hidden' value='{$_POST['client_vat_option']}' name='owner_vat'/>");
        echo("<input type='hidden' value='{$_POST['client_vat_option']}' name='client_vat'/>");
        echo("</form>");
        echo("<script type='text/javascript'>");
            echo("document.getElementById('jsform').submit();");
        echo("</script>");
    }  

?>
    </body>
</html>