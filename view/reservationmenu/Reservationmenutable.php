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
                        
                      
                        if(isset($_GET['name'])){                    
                          $name = $_GET['name'];

                          if ($_GET['type']=='0'){
                            $type = '1 OR Type=2';
                          }
                          else{
                            $type = $_GET['type'];
                          }
                            
                          $itemTable->show("SELECT ReservationName AS 'Place Name',Type AS 'Place Type',Cost AS 'Place Cost',Availability AS 'Availability' FROM plunk.reservationmenu WHERE IsDeleted = 'No' AND ReservationName LIKE ('%$name%') AND Type = $type; ", 'update');
                          
                        }
                        
                        else{

                          $itemTable->show("SELECT ReservationName AS 'Place Name',Type AS 'Place Type',Cost AS 'Place Cost',Availability AS 'Availability' FROM plunk.reservationmenu WHERE IsDeleted = 'No'", 'update');
                        }
                        
                   
                      ?> 
                    </div>

                </div>


  </body>
</html>
