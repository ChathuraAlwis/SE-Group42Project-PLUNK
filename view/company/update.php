<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/company.css">


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
            <form class="addcompany" action="..\..\controller\CRUD.php" method="post" autocomplete="on" >
              <input name ="update-company" type="hidden" >
              
              <div class="submain">
                <div class="forminputs">
                    <label for="Name"> Company Name:</label><br>
                    <input type="text" id="Name" class="input" name="Company" value = "<?php echo "$result[Company]";?>"  readonly>
                </div><br>

                <div class="forminputs">
                    <label for="DisplayID"> Distributors' Name:</label><br>
                    <input type="text"  class="input" id="DistributorName" name="DistributorName" value = "<?php echo "$result[DistributorName]";?>"   required>
                </div><br>

                <div class="forminputs">
                    <label for="Email"> E-mail </label><br>
                    <input type="email" id="Email" class="input" name="Email" placeholder="xxxx@gmail.com" value = "<?php echo "$result[Email]";?>" required>
                </div><br>
                <div class="forminputs">
                    <label for="ContactNo"> Contact No</label><br>
                    <input type=" tel" id="ContactNo" class="input" name="PhoneNo" pattern="[0-9]{10}" value = "<?php echo "$result[PhoneNo]";?>" required>
                </div><br><br>

                <div class="forminputs">
                  <button type="submit"  id="add" class="add" name="button" >Update</button>
                  <button type="reset" id="reset" class="add" name="button">Reset</button>
                </div>
              </div>
            </form>
        </div>

  </body>
</html>
