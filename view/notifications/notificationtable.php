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
                        $itemTable = new Table("notification");
                        //$itemTable->show("SELECT `NotificationID`AS 'Notification ID', `FromDate` As 'Message Display From', `ToDate` AS 'Message Display To', `EventType` AS 'Event Type', `Message` AS 'Message' FROM plunk.notification", 'update');
                      
                        if(isset($_GET['msg'])){                    
                          $msg = $_GET['msg'];

                          if ($_GET['Type']=='0'){
                            $Type = '1 OR EventType= 2';
                          }
                          else{
                            $Type = $_GET['Type'];
                          }
                            
                          $itemTable->show("SELECT `NotificationID`AS 'Notification ID', `FromDate` As 'Message Display From', `ToDate` AS 'Message Display To', `EventType` AS 'Event Type', `Message` AS 'Message' FROM plunk.notification WHERE `Message` like ('%$msg%') AND `EventType` = $Type ",'update');
                          
                        
                        }
                        
                        else{

                          $itemTable->show("SELECT `NotificationID`AS 'Notification ID', `FromDate` As 'Message Display From', `ToDate` AS 'Message Display To', `EventType` AS 'Event Type', `Message` AS 'Message' FROM plunk.notification", 'update');
                        }
                        
                      ?> 
                    </div>

                </div>


  </body>
</html>
