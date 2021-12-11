<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/notificationsbar.css">

  </head>
  <body>
        <div class="main" >

             <div class="detailtable">
                    
                    
              <?php
                    require_once "../../controller/showtable.php";
                    $notificationTable = new Table("notification");
                    $day = date('Y-m-d');
                    $notificationTable->show("SELECT EventType as 'Event Type', Message FROM plunk.notification where FromDate <= '$day' AND ToDate >= '$day'; ");
            ?>
                
             </div>

      </div>


  </body>
</html>
