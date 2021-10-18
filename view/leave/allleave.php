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
                          $itemTable->show("SELECT UserID,	RequestedDate,	LeaveDate, ManagerID FROM plunk.leave where Accepted = 'Yes';", 'update');
                        }
                        else{
                          $itemTable->show("SELECT LeaveDate,Reason,Accepted FROM plunk.leave where UserID = '$_SESSION[UserID]';", 'update');
                        }
                        
                      ?> 
                    </div>

                </div>


  </body>
</html>
