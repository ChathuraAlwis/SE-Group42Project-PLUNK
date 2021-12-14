<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
          <meta charset="utf-8">
          <title>Bloomfield</title>
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
          <link rel="stylesheet" href="style/login.css">
  </head>
  <body>
    <?php
      if(isset($_GET['result'])){
        if(!isset($_SESSION['UserName'])){
          echo '<script>alert("Invail Username or Password")</script>';
        }else{
          session_unset();;
        }
      }
    ?>

    <header>
          <img class="plunk" src="images/projectlogo.png" alt="plunk logo">
          <img class="Logo" src="images/bloomfieldlogo.png" alt="Bloomfield Logo">
    </header>

    <form id="form" class="form" method="POST" action="../controller/checkLogin.php">

      <img class="Logo2" src="../view/images/bloomfieldlogo.png" alt="Bloomfield Logo">

      <p><br></p>

          <div class="form-control">
                <label for="UserName"><b>User Name</b></label>
                <input name ="UserName" id="UserName" type="text" placeholder="Enter Your username" <?php if(isset($_SESSION['UserName'])){echo "value=$_SESSION[UserName]";}?>>
                <hr>
                <small>Error message</small>
          </div>

          <div class="form-control">
                <label for="password"><b>Password</b></label>
                <input name="Password" id="Password" type="password" placeholder="Enter Your password" >
                <hr>
            		<small>Error message</small>
          </div>

        <button class = "button login">Login</button>
        <button class = "buttonforgot"><a href="forgotpassword.html">Forgot Password</a></button><br>
        <a class="signup" href="..\view\user\signup.php"> <b>Want to join with Bloomfield?</b></a>

    </form>

  </body>
</html>
