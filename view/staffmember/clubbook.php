<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/itemtable.css">

  </head>
  <body>
        <div class="main" >

                    <div class="detailtable">
                    
                    <?php
                        require_once "../../controller/showtable.php";
                        $reorderTable = new Table("booking");
                        $day =  date("Y-m-d");
                        $reorderTable->show("SELECT CustomerName AS 'Customer Name',Reservation AS 'Reservation Name',NoOfPeople AS 'No of People',ReservedDate AS 'Reserved Date',ReservedTime AS 'Reserved Time',EndTime AS 'End Time' from plunk.booking WHERE BookingType ='Club' and ReservedDate >= '$day'; ", false);
                      ?> 
                    </div>

                </div>


  </body>
</html>