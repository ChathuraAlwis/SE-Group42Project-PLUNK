<?php session_start(); ?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
    <link rel="stylesheet" href="../style/crud.css">
    <title>Bloomfield</title>
</head>
<body>
    <?php 
        require_once "../../model/database.php";
        $DB = new DB;
        $id = explode("=", $_GET['data'])[1];
        $query = "SELECT * FROM plunk.order WHERE OrderID=$id";
        $result = $DB->runQuery($query)[0];
    ?>

    <div class="form">
        <h2 class="center-text"><b>Update Order</b></h2>
        <form action="../../controller/CRUD.php" method="post">
            <input name ="update-order" type="hidden" >
            <input name ="OrderID" id="OrderID" type="hidden" value = "<?php echo "$result[OrderID]";?>" >
            <input name ="UserID" id="UserID" type="hidden" value = "<?php echo "$_SESSION[UserID]";?>" >
            <div class="form-group">
                <label for="OrderDate">Order Date</label>
                <input name ="OrderDate" id="OrderDate" type="date" value = "<?php echo "$result[OrderDate]";?>" >
            </div>
            <div class="form-group">
                <label for="OrderTime">Order Time</label>
                <input name ="OrderTime" id="OrderTime" type="time" value = "<?php echo "$result[OrderTime]"; ?>" >
            </div>
            <div class="form-group">
                <label for="OrderPlace">Order Place</label>
                <input name ="OrderPlace" id="OrderPlace" type="text" value = "<?php echo "$result[OrderPlace]"; ?>" >
            </div>
            <div class="form-group">
                <label for="Total">Total</label>
                <input name ="Total" id="Total" type="number" value = "<?php echo "$result[Total]"; ?>" >
            </div>
            <button type="submit" class="button">Update</button>
        </form>
    </div>
    
</body>
</html>