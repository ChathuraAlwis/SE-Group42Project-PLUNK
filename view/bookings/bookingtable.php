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
                          $itemTable = new Table("booking");
                          if($_SESSION['UserType'] == 'Accountant'){
                            $itemTable->show("SELECT BookingID as 'Booking ID',CustomerName as 'Customer Name', ContactNo as 'Contact No',Reservation1 as 'Reservation 1',Reservation2 as 'Reservation 2', Total as 'Total Payment' FROM plunk.booking");
                          }
                          else{
                            $itemTable->show("SELECT BookingID as 'Booking ID',CustomerName as Name, BookingType as 'Booking Type',ReservedDate as 'Reserved Date',Total as 'Total Payment',Payment, ContactNo as 'Contact No' FROM plunk.booking", 'update');
                          }
                       ?>


                    </div>

                </div>


  </body>
</html>
