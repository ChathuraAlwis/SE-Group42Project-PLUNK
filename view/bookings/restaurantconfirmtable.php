<?php session_start();
date_default_timezone_set("Asia/Kolkata");?>
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
                          $bookingTable = new Table("booking");
                          if(isset($_GET['CustomerName'])){
                            $search = $_GET['CustomerName'];
                            $sql = "SELECT BookingID as 'Booking ID',CustomerName as Name,Reservation as 'Reserved Place',ReservedDate as 'Reserved Date',ReservedTime as 'Reserved Time',Total as 'Total Payment',Payment, ContactNo as 'Contact No' FROM plunk.booking WHERE BookingType in ('Restaurant') AND permission in ('Confirmed') AND CustomerName LIKE ('$search')";

                            if(isset($_GET['OrderBy'])){
                              $sql .= " ORDER BY $_GET[OrderBy]";
                            }
                                $bookingTable->show($sql, 'restaurantupdate');
                          }

                          else {


                                  $bookingTable->show("SELECT BookingID as 'Booking ID',CustomerName as Name,Reservation as 'Reserved Place',ReservedDate as 'Reserved Date',ReservedTime as 'Reserved Time',Total as 'Total Payment',Payment, ContactNo as 'Contact No' FROM plunk.booking WHERE BookingType in ('Restaurant') AND permission='Confirmed' AND ReservedDate>='$today'", 'restaurantupdate');

                          }
                       ?>


                    </div>

                </div>


  </body>
</html>
