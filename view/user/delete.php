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
    <!-- <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $id = explode("=", $_GET['data'])[1];
        $query = "SELECT * FROM plunk.user WHERE DisplayID='$id'";

        $result = $DB->runQuery($query)[0];

    ?> -->
        <div class="main" >
            <form class="adduser" action="..\..\controller\CRUD.php" method="post" autocomplete="on" >
              <input name ="update-user" type="hidden" >

              <div class="submain">
                <div class="forminputs">
                    <label for="Name"> Name with initials</label><br>
                    <input type="text" id="Name" name="Name"  readonly>
                </div><br>

                <div class="forminputs">
                    <label for="DisplayID"> Staff Id</label><br>
                    <input type="text" id="DisplayID" name="DisplayID" maxlength="10"  readonly>
                </div><br>

                <div class="radio">
                      <label for="UserType"> Position</label><br>
                        <input type="text" id="UserType" name="UserType"  readonly>

                </div><br>

                <div class="forminputs">
                    <label for="JoinedYear"> Joined date</label><br>
                    <input type="date" id="JoinedYear" name="JoinedYear"  readonly>
                </div><br>

                <div class="forminputs">
                    <label for="Email"> E-mail</label><br>
                    <input type="email" id="Email" name="Email"   readonly>
                </div><br>

                <div class="forminputs">
                    <label for="ContactNo"> Contact No</label><br>
                    <input type=" tel" id="ContactNo" name="ContactNo" pattern="[0-9]{10}"  readonly>
                </div><br>
                <div class="forminputs">
                    <label for="Reason"> Reason</label><br>
                    <input type="text" id="Reason" name="Reason">
                </div><br><br>

                <div class="forminputs">
                  <button type="submit"  class="add" name="submit" value="submit" formaction="..\..\controller\CRUD.php"><b>Delete</b> </button>
                  <button type="button" id="reset" class="add" ><a href="..\Dashboards\admindash.html"><b>Cancel</b></a> </button>
                </div>
              </div>
            </form>
        </div>
  </body>
</html>
