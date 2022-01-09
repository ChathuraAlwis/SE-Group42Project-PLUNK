<?php session_start(); ?>
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
                          require_once "..\..\controller\showtable.php";
                          $bookingTable = new Table("booking");
                          if($_SESSION['UserType'] == 'Manager'){
                              $bookingTable->show("SELECT BookingID as 'Booking ID',CustomerName as Name,Reservation as 'Reserved Place',ReservedDate as 'Reserved Date',ReservedTime as 'Reserved Time',Total as 'Total Payment',Payment, ContactNo as 'Contact No' FROM plunk.booking WHERE BookingType in ('Club') ", 'clubupdate');
                          }

                            else {
                              $bookingTable->show("SELECT BookingID as 'Booking ID',CustomerName as Name, BookingType as 'Booking Type',ReservedDate as 'Reserved Date',Total as 'Total Payment',Payment, ContactNo as 'Contact No' FROM plunk.booking WHERE BookingType in ('Club') ", 'clubupdate');
                            }

                       ?>


                    </div>

                </div>


  </body>
</html>
