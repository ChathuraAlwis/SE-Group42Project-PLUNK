<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/adduserforms.css">


  </head>
  <body>
    <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $id = explode("=", $_GET['data'])[1];
        $query = "SELECT * FROM plunk.returngrn WHERE GRNID='$id'";

        $result = $DB->runQuery($query)[0];

    ?>
        <div class="main" >
            <form class="adduser" action="..\..\controller\CRUD.php" method="post" autocomplete="on" >
              <input name ="return-grn" type="hidden" >
              <div class="submain">
                <div class="forminputs">
                    <label for="GRNID"> GRN ID: </label><br>
                    <input type="text" id="GRNID" name="GRNID" value = "<?php echo "$result[GRNID]";?>" required>
                </div><br>

                <div class="forminputs">
                    <label for="CompanyName"> Company Name:</label><br>
                    <input type="text" id="CompanyName" name="CompanyName" value = "<?php echo "$result[CompanyName]";?>" required>
                </div><br>

                <div class="forminputs">
                    <label for="AddDate"> Add Date</label><br>
                    <input type="date" id="AddDate" name="AddDate" value = "<?php echo "$result[AddDate]";?>"  required>
                </div><br>

                <div class="forminputs">
                  <?php
                      require_once "..\..\controller\showtable.php";
                      $orderTable = new Table("grnitem");
                      $orderTable->show("SELECT * FROM plunk.grnitem WHERE GRNID in ('$result[GRNID]')", 'update');
                   ?>
                </div><br>

                <div class="forminputs">
                    <label for="ReturnDate"> Return Date</label><br>
                    <input type="date" id="ReturnDate" name="ReturnDate" value = "<?php echo date("Y-m-d");?>"  required>
                </div><br><br>
                <div class="forminputs">
                    <label for="Reason"> Reason :</label><br>
                    <input type="text" id="Reason" name="Reason" value = "<?php echo "$result[Reason]";?>" required>
                </div><br>
                <div class="forminputs">
                    <label for="UserID"> User ID :</label><br>
                    <input type="text" id="UserID" name="UserID" value = "<?php echo "$result[UserID]";?>" required>
                </div><br>

                <div class="forminputs">
                  <button type="submit"  class="add" name="submit" value="submit" formaction="..\..\controller\CRUD.php"><input type="hidden" name="Accepted" value="Yes"> <b>Accept</b> </button>
                  <button type="submit"  class="add" name="submit" value="submit" formaction="..\..\controller\CRUD.php"><input type="hidden" name="Accepted" value="No"> <b>Denied</b> </button>
                </div>
              </div>
            </form>
        </div>
  </body>
</html>
