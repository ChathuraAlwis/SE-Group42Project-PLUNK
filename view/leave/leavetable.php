<?php
session_start();?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/tablehome.css">

  </head>
  <body>
        <div class="main" >

                    <div class="detailtable">
                    
                    <?php
                        require_once "../../controller/showtable.php";
                        $itemTable = new Table("leave");
                        if($_SESSION['UserType'] == 'Accountant'){
                          $itemTable->show("SELECT UserID as 'User ID',	RequestedDate as 'Requested Date',	LeaveDate as 'Leave Date', Accepted,	ManagerID as 'Manager ID' FROM plunk.leave ;", 'update');
                        }
                        else if($_SESSION['UserType'] == 'Manager'){
                          $itemTable->show("SELECT * FROM plunk.leave ;", 'update');
                        }
                        else{
                          $itemTable->show("SELECT LeaveDate,Reason,Accepted FROM plunk.leave where UserID = '$_SESSION[UserID]';", 'update');
                        }
                        
                      ?> 
                    </div>

                </div>


  </body>
</html>
