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
                        $itemTable = new Table("reservationmenu");
                        $itemTable->show("SELECT ReservationName AS 'Place Name',Type AS 'Place Type',Cost AS 'Place Cost',Availability AS 'Availability' FROM plunk.reservationmenu WHERE IsDeleted = 'No'", 'update');
                      ?> 
                    </div>

                </div>


  </body>
</html>
