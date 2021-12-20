<?php
session_start();
require_once "../../model/database.php";
$DB = new DB;
$query = "SELECT * FROM plunk.user WHERE UserID=$_SESSION[UserID]";
$result = $DB->runQuery($query)[0];

if (count($_POST) > 0) {
    $verify = password_verify($_POST["currentPassword"], $result["Password"]);
    $confirm = ($_POST["newPassword"] == $_POST["confirmPassword"]);

    if (!$verify)
        $message = "Current Password is not correct";
    if (!$confirm){
        $message = "Password confirmation doesn't match the password";
    }
    if ($verify and $confirm) {
        $hashedpassword = Password_hash("$_POST[newPassword]", PASSWORD_BCRYPT);
        $result = $DB->runQuery("UPDATE plunk.user set password='" . $hashedpassword . "' WHERE userId=$_SESSION[UserID]");
        print_r($_POST['newPassword']);
        $message = "Password Changed";
    }
}
?>
<html>
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
            <h1>Change Password</h2>
            <hr>
            <form class="profform" name="frmChange" method="post" action="../../controller/CRUD.php">
                <input type="hidden" name="update-password"/>
                <input type="hidden" name="UserID" value="<?php echo $_SESSION['UserID']?>"/>
                <div class="message"><?php if(isset($_GET['msg'])) { echo $_GET['msg']; } ?></div>
                <div class="forminputs">
                    <label for="">Current Password: </label>
                    <input type="password" name="currentPassword" class="txtField" required/>
                </div><br>
                <div class="forminputs">
                    <label for="">New Password: </label>
                    <input type="password" name="newPassword" class="txtField" required/>
                </div><br>
                <div class="forminputs">
                    <label for="">Confirm Password: </label>
                    <input type="password" name="confirmPassword" class="txtField" required/>
                </div><br>
                <div class="forminputbtn">
                    <button type="submit" name="button" class="save"><b>Update Password</b></button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>