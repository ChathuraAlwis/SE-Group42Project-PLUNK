<?php session_start(); 
  if (isset($_SESSION['UserType'])){
    if ($_SESSION['UserType'] != 'Restaurant Manager'){
      require_once "../../controller/pages.php";
      $page = new Page('../login.php');
      $page->show();
    }
  }
  else{
    require_once "../../controller/pages.php";
    $page = new Page('../login.php');
    $page->show();
  }
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,height=device-height, initial-scale=1">
        <link rel="icon" type="icon" href="../images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/user.css">
        <script type="text/javascript" src="../script/user.js">  </script>
        <script type="text/javascript" src="../script/usernavbtn.js"> </script>
       

  </head>
  <body>
    <div class="main">

          <div class="header" id="myheader">
                  <div class="leftheader">
                      <img class="plunk" src="../images/projectlogo.png" alt="plunk logo"><br>
                      <div class="menudiv">
                         <a href="rmnavbtn.html" class="menubtn" target="navigation"><button type="button" name="Menu" class="Menu" onclick=myFunction() >&#9776;</button></a>
                     </div>
                     
                      
                  </div>
                 

                  <div class="middleheader">
                    <img class="Logo" src="../images/bloomfieldlogo.png" alt="Bloomfield Logo"><br>
                      <h2>Bloomfield C. & A.C.</h2>
                      
                      <?php 
                        // if(isset($_COOKIE["msgid"])){
                        //   require_once "../../model/database.php";
                        //   $DB = new DB;
                        //   $sql = "Select message from plunk.restaurantmessage where No = $_COOKIE[msgid]";
                        //   $msg = $DB->runQuery($sql)[0]["message"] ;
                        // }
                        // else{
                        //   $msg = "Bloomfield Restaurant";
                        // }
                        
                     ?> 
                         
            
                        <marquee class="msg" ><h4 class="classmsg" id ="idmsg" name="dismsg">The restaurant is closed now.</h4></marquee>
                  
                  </div>

                  <div class="rightheader">
                    <div class="subrightheader">
                    <div class="dropdown">
                        <button class="dropbtn"><img class="profileicon"src="../images/profile.png" alt="profile icon"></button>
                        <div class="dropdown-content">
                        <a href="../profile/prfileui.php" class="headerdrop" target="Pages"><b>Profile</b></a>
                         <a type="button"  id="open" name="open" onclick="colorchange()" >Open</a>
                        <a href="../logout.php" class="headerdrop"><b>Logout</b></a>
                        </div>
                    </div>
                            <h3>Restaurant Manager</h3>
                    </div>

                  </div>

          </div>
              <div class="middle">
                            <div id="panel" class=" panel">
                                <iframe id="navv"class="nav" name="navigation" title="iframe for nav"></iframe>
                            </div>

                            <div class="mainpages" id="mainpages">
                                    <iframe  src="..\Dashboards\rmDashboard.php"class="page" name="Pages"  title="Iframe for pages"></iframe>

                            </div>
                  </div>
            </div>
      </body>
</html>
