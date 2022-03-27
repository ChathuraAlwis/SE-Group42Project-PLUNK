<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/adduserforms.css">
        <script type="text/javascript" src="../script/maxQuantity.js"></script>

  </head>
  <body>
  <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $sql = "SELECT UserName, DisplayID, Email FROM plunk.user;";
        $result = json_encode($DB->runQuery($sql));
        date_default_timezone_set("Asia/Kolkata");
    ?>
        <div class="main" >
            <form class="adduser" action="..\..\controller\CRUD.php" method="post" autocomplete="on" target="_self">
              <input name ="add-staff" type="hidden" >
              <div class="submain">
                <div class="forminputs">
                    <label for="Name"> Name with initials</label><br>
                    <input type="text" id="Name" class="input" name="Name" required>
                </div><br>

                <div class="forminputs">
                    <label for="DisplayID"> Staff Id</label><br>
                    <input type="text"  class="input" id="DisplayID" name="DisplayID" maxlength="10" onchange='<?php echo 'checkDisplayID('. $result .')';?>' required>
                </div><br>

                <div class="radio">
                      <label for="UserType"> Position</label><br>
                      <select class="UserType" name="UserType" id="UserType" required>
                        <option selected>Select the position</option>
                        <option value="Admin">Admin</option>
                        <option value="Manager">Manager</option>
                        <option value="Accountant">Accountant</option>
                        <option value="Restaurant Manager">Restaurant Manager</option>
                        <option value="Cashier">Cashier</option>
                        <option value="Staff Member">Staff</option>
                      </select>

                </div><br>
                <div class="forminputs">
                    <label for="UserName"> User Name</label><br>
                    <input type="text" id="UserName" class="input" name="UserName" maxlength="50" onchange='<?php echo 'checkUserName('. $result .')';?>' required>
                </div><br>
                <div class="forminputs">
                    <label for="Password"> Password</label><br>
                    <input type="password" id="Password" class="input" name="Password"  required>
                </div><br>

                <div class="forminputs">
                    <label for="JoinedYear"> Joined date</label><br>
                    <input type="date" id="JoinedYear" name="JoinedYear" class="input" placeholder="mm/dd/yyyy" max="<?php echo date("Y-m-d") ?>" value="<?php echo date("Y-m-d") ?>" required>
                </div><br>

                <div class="forminputs">
                    <label for="Email"> E-mail</label><br>
                    <input type="email" id="Email" name="Email" class="input" placeholder="XXX@gmail.com" onchange='<?php echo 'checkEmail('. $result .')';?>' required>
                </div><br>

                <div class="forminputs">
                    <label for="ContactNo"> Contact No</label><br>
                    <input type=" tel" id="ContactNo" class="input" name="ContactNo" pattern="[0-9]{10}"  required>
                </div><br><br>

                <div class="forminputs">
                  <div class="submitbtn">
                  <button type="submit"  class="add" id="add" name="submit" value="submit" onclick='<?php echo 'checkUser('. $result .')';?>'><b>Add</b> </button>
                  <button type="reset" id="reset" class="add" name="reset" value="reset"><b>Reset</b></button>
                </div>
                </div>
              </div>
            </form>
        </div>
  </body>
</html>
