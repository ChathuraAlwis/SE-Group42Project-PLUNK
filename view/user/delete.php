<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/deleteuser.css">


  </head>
  <body>
    <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $id = explode("=", $_GET['data'])[1];
        $query = "SELECT * FROM plunk.user WHERE DisplayID='$id'";

        $result = $DB->runQuery($query)[0];


    ?>
        <div class="main" >
            <form class="adduser" action="..\..\controller\CRUD.php" method="post" autocomplete="on" >
              <input name ="delete-user" type="hidden" >

              <div class="submain">
                <div class="forminputs">
                    <label for="Name"> Name with Initials :</label><br>
                    <input type="text" id="Name" class="input" name="Name" value = "<?php echo "$result[Name]";?>" readonly>
                </div><br><br>

                <div class="newforminputs1">
                    <label for="DisplayID" class="staffid"> Staff Id :</label>
                    <input type="text" id="DisplayID" name="DisplayID" maxlength="10" value = "<?php echo "$result[DisplayID]";?>" readonly>
                </div>
                <div class="newforminputs">
                    <label for="UserID"> User Id :</label>
                    <input type="text" id="UserID" name="UserID" maxlength="10" value = "<?php echo "$result[UserID]";?>" readonly>
                </div><br><br>

                <div class="forminputs">
                      <label for="UserType"> Position :</label>
                        <input type="text" id="UserType" class="input" name="UserType" value = "<?php echo "$result[UserType]";?>"  readonly>

                </div><br><br>

                <div class="forminputs">
                    <label for="JoinedYear"> Joined Date :</label>
                    <input type="date" id="JoinedYear" class="input" name="JoinedYear" value = "<?php echo "$result[JoinedYear]";?>" readonly>
                </div><br><br>

                <div class="forminputs">
                   <label for="Email"> E-mail :</label>
                    <input type="email" id="Email" class="input" name="Email"  value = "<?php echo "$result[Email]";?>"  readonly>
                </div><br><br>

                <div class="forminputs">
                    <label for="ContactNo"> Contact No :</label>
                    <input type=" tel" id="ContactNo" class="input" name="ContactNo" pattern="[0-9]{10}" value = "<?php echo "$result[ContactNo]";?>" readonly>
                </div><br><br>
                <div class="forminputs">
                    <label for="Reason"> Reason :</label><br>
                    <input type="text" id="Reason" class="input" name="Reason">
                </div><br><br>

                <div class="formbtn">
                  <br> <button type="submit"  class="add" name="submit" value="submit" formaction="..\..\controller\CRUD.php"><b>Delete</b> </button>
                  <button type="button" id="reset" class="add" ><a href="..\Dashboards\admindash.html"><b>Cancel</b></a> </button>
                </div>
              </div>
            </form>
        </div>
  </body>
</html>
