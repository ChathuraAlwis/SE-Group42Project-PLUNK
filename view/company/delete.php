<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/deletemsg.css">

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
                      <form class="deleteform" action="..\..\controller\CRUD.php" method="post">a
                      <input type="hidden" id="Name" class="input" name="Company" value = "<?php echo "$result[Company]";?>"  readonly>
                      <div class="detailtable">
                    <h3><b> Do you want to remove this company</b> </h3><br>

                    <div class="btn">
                      <button type="Submit" name="Submit"><b>Yes</b> </button></a>
                      <button type="button" name="cancel" value="cancel"><a class="cancel" href="..\company\companydash.php"><b>No</b></a></button>
                    </div>
                    </div>
                    </form>
                    </div>

                


  </body>
</html>
