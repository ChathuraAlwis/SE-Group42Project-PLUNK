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
        $query = "SELECT * FROM plunk.user WHERE DisplayID='$id'";

        $result = $DB->runQuery($query)[0];

    ?>
        <div class="main" >
            <form class="adduser" action="..\..\controller\CRUD.php" method="post" autocomplete="on" >
              <input name ="update-user" type="hidden" >

              <div class="headerrow">
                <div class="bin">
                  <a href="delete.php?data=<?php echo $_GET['data'];?>" ><img src="..\images\bin.png" alt="Delete Icon" class="binicon"></a>
                </div>
              </div>
              <div class="submain">
                <div class="forminputs">
                    <label for="Name"> Name with initials</label><br>
                    <input type="text" id="Name" class="input" name="Name" value = "<?php echo "$result[Name]";?>" required>
                </div><br>

                <div class="newforminputs1">
                    <label for="DisplayID" class="staffid"> Staff Id :</label>
                    <input type="text" id="DisplayID" name="DisplayID" maxlength="10" value = "<?php echo "$result[DisplayID]";?>" required>
                </div>
                <div class="newforminputs">
                    <label for="UserID"> User Id :</label>
                    <input type="text" id="UserID" name="UserID" maxlength="10" value = "<?php echo "$result[UserID]";?>" readonly>
                </div><br><br>

                <div class="radio">
                      <label for="UserType"> Position</label><br>
                      <select class="UserType" name="UserType" id="UserType" required>

                        <option value="Admin" <?php if("$result[UserType]"=="Admin") echo 'selected="selected"'; ?>>Admin</option>
                        <option value="Manager" <?php if("$result[UserType]"=="Manager") echo 'selected="selected"'; ?>>Manager</option>
                        <option value="Accountant" <?php if("$result[UserType]"=="Accountant") echo 'selected="selected"'; ?>>Accountant</option>
                        <option value="Restaurant Manager" <?php if("$result[UserType]"=="Restaurant Manager") echo 'selected="selected"'; ?>>Restaurant Manager</option>
                        <option value="Cashier" <?php if("$result[UserType]"=="Cashier") echo 'selected="selected"'; ?>>Cashier</option>
                        <option value="Staff Member" <?php if("$result[UserType]"=="Staff Member") echo 'selected="selected"'; ?>>Staff</option>
                        <option value="Ordinary Member" <?php if("$result[UserType]"=="Ordinary Member") echo 'selected="selected"'; ?>>Ordinary Member</option>
                        <option value="Life Member" <?php if("$result[UserType]"=="Life Member") echo 'selected="selected"'; ?>>Life Member</option>
                        <option value="HL Member" <?php if("$result[UserType]"=="HL Member") echo 'selected="selected"'; ?>> HL Member</option>
                      </select>

                </div><br>

                <div class="forminputs">
                    <label for="JoinedYear"> Joined date</label><br>
                    <input type="date" id="JoinedYear" class="input" name="JoinedYear" placeholder="mm/dd/yyyy" value = "<?php echo "$result[JoinedYear]";?>" max="<?php echo date("Y-m-d") ?>" required>
                </div><br>

                <div class="forminputs">
                    <label for="Email"> E-mail</label><br>
                    <input type="email" id="Email" class="input" name="Email" placeholder="XXX@gmail.com"  value = "<?php echo "$result[Email]";?>" required>
                </div><br>

                <div class="forminputs">
                    <label for="ContactNo"> Contact No</label><br>
                    <input type=" tel" id="ContactNo" class="input" name="ContactNo" pattern="[0-9]{10}" value = "<?php echo "$result[ContactNo]";?>"  required>
                </div><br><br>

                <div class="forminputs">
                  <button type="submit"  class="add" name="submit" value="submit" formaction="..\..\controller\CRUD.php"><b>Update</b> </button>
                  <button type="reset" id="reset" class="add" name="reset" value="reset"><b>Reset</b></button>
                </div>
              </div>
            </form>
        </div>
  </body>
</html>
