<?php 
session_start();
require_once "../../model/database.php";
$DB = new DB;
$query = "SELECT * FROM plunk.user WHERE UserID=$_SESSION[UserID]";
$result = $DB->runQuery($query)[0];
// print_r($result);
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,height=device-height, initial-scale=1">
        <link rel="icon" type="icon" href="../images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/profile.css">



  </head>
  <body>
    <div class="main">
        <div class="profformbox">
          <form class="profform" method="post">
          <div class="imagebox">
            <input type="file"  accept="image/*" name="image" id="file"  onchange="loadFile(event)" style="display: none;">
            
            <?php 
            if($result['ProfilePic'] != NULL){
              echo '<img id="output" alt="No Profile Picture" src="data:image/jpeg;base64,'.base64_encode($result['ProfilePic']).'"/>';
            }else{
              echo '<img id="output" src="../images/profile.png" alt="profile icon">';
            }
            ?>

          </div><br>
          <div class="forminputs">
            <label for="">Name with initials :</label>
            <input type="text" name="" value="<?php print_r($result['Name'])?>" readonly>
          </div><br>
          <div class="forminputs">
            <label for="">User ID :</label>
            <input type="text" name="" value="<?php print_r($result['UserID'])?>" readonly>
          </div><br>
          <div class="forminputs">
            <label for="">User Type :</label>
            <input type="text" name="" value="<?php print_r($result['UserType'])?>" readonly>
          </div><br>
          <div class="forminputs">
            <label for="">Joined Date :</label>
            <input type="date" name="" value="<?php print_r($result['JoinedYear'])?>" readonly>
          </div><br>
          <div class="forminputs">
            <label for="">Contact No :</label>
            <input type="tel" name="" value="<?php print_r($result['ContactNo'])?>" readonly>
          </div><br>
          <div class="forminputs">
            <label for="">E-mail :</label>
            <input type="email" name="" value="<?php print_r($result['Email'])?>" readonly>
          </div><br>
          <div class="forminputs">
              <label for="UserName"> User Name :</label>
              <input type="text" id="UserName" name="UserName" maxlength="50" value="<?php print_r($result['UserName'])?>" readonly>
          </div><br>
          <div class="forminputbtn">
            <a href="profileuiedit.php"><button type="button" name="button" class="edit"><b>Edit</b></button></a>
            <a href="change_password.php"><button type="button" name="button" class="change-pw"><b>Change Password</b></button></a>
          </div>
          </form>

        </div>

        </div>
    </body>
</html>
