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
                require_once "../../controller/showreport.php";
                $MonthlySales = new Report("MonthlySales");
                if(isset($_GET['ser'])){
                  $MonthlySales->DailySalesReport($_GET['today'], 1, TRUE);
                }else{
                  $MonthlySales->DailySalesReport($_GET['today'], 1);
                }
            ?>
            </div>

        </div>


  </body>
</html>
