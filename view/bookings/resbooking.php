<?php session_start();
date_default_timezone_set("Asia/Kolkata");
 ?>
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
                          $today= date("Y-m-d");
                          require_once "..\..\controller\showtable.php";
                          $orderTable = new Table("booking");
                          $orderTable->show("SELECT BookingID as 'Booking ID',ReservedDate as 'Reserved Date',Reservation as 'Reserved Place',ReservedTime as 'Reserved Time',Total as 'Total Payment',Payment as Paid FROM plunk.booking WHERE BookingType= 'Restaurant' AND UserID=$_SESSION[UserID] AND ReservedDate>='$today'",'restaurantupdate');
                       ?>


                    </div>

                </div>


  </body>
</html>
