<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/companymgs.css">

  </head>
  <body>
    <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $id = explode("=", $_GET['data'])[1];
        $query = "SELECT * FROM plunk.company WHERE Company='$id'";

        $result = $DB->runQuery($query)[0];

    ?>
        <div class="main" >

                    <div class="detailtable">
                      <form class="deleteform" action="..\..\controller\CRUD.php" method="post">
                      <input type="hidden" id="Name" class="input" name="Company" value = "<?php echo "$result[Company]";?>"  readonly>
                    <h1 id="Error"><b> Do you want to remove this company</b> </h1><br>

                    <div class="btn">
                      <button type="submit" name="remove"><b>Yes</b> </button></a>
                    </div>
                    <div class="btn2">
                      <a href="..\company\companydash.html"><button type="button" name="button"><b>No</b> </button></a>
                    </div>

                    </form>
                    </div>

                </div>


  </body>
</html>
