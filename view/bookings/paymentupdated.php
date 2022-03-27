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
        session_start();
        require_once "../../model/database.php";
        $DB = new DB;
        $id = explode("=", $_GET['data'])[1];
        $query = "SELECT * FROM plunk.booking WHERE BookingID='$id'";
        $result = $DB->runQuery($query)[0];

        $query2 = "SELECT * FROM plunk.user";
        $result2 = $DB->runQuery($query2)[0];

    ?>
        <div class="main" >

                    <div class="detailtable">

                    <h1><b>Success..!</b> </h1><br>

                    <div class="btn">
                      <form  class="" action="http://localhost/project/SE-Group42Project-PLUNK/controller/CRUD.php" method="post">
                        <input type="hidden" name="changepayment">
                        <input type="hidden" class="qtype11" name="order_id" value = "<?php echo "$result[BookingID]";?>" readonly>
                        <input type="hidden" name="UserID" value="<?php echo($result['UserID'])?>">
                        <input type="hidden" name="CustomerName" value="<?php echo "$result[CustomerName]";?>">
                        <input type="hidden" name="UserType" value="<?php echo "$result2[UserType]";?>">

                      <button type="submit" name="button"><b>OK</b> </button>
                      </form>
                      <!-- <a href="..\controller\CRUD.php"><button type="button" name="button"><b>OK</b> </button></a> -->
                    </div>


                    </div>

                </div>


  </body>
</html>
