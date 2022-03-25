<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/success.css">

  </head>
  <body>
    <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $id = explode("=", $_GET['data'])[1];
        $query = "SELECT * FROM plunk.booking WHERE BookingID='$id'";

        $result = $DB->runQuery($query)[0];

    ?>
        <div class="main" >

                    <div class="detailtable">

                    <h1><b>Success..!</b> </h1><br>

                    <div class="btn">
                      <form  class="" action="http://localhost/project/SE-Group42Project-PLUNK/controller/CRUD.php" method="post">
                        <input type="hidden" name="changeclubpayment">
                        <input type="hidden" class="qtype11" name="order_id" value = "<?php echo "$result[BookingID]";?>" readonly><br>
                      <button type="submit" name="button"><b>OK</b> </button>
                      </form>
                      <!-- <a href="..\controller\CRUD.php"><button type="button" name="button"><b>OK</b> </button></a> -->
                    </div>


                    </div>

                </div>


  </body>
</html>
