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
                          require_once "../../controller/showtable.php";
                          $orderTable = new Table("order");
                          if($_SESSION['UserType']=="Cashier"){
                            $sql = "SELECT * FROM plunk.order";
                            if(isset($_GET['OrderBy'])){
                              $sql .= " ORDER BY $_GET[OrderBy]";
                            }
                            $orderTable->show($sql);
                          }
                          else{
                            $sql = "SELECT OrderID, OrderDate as Date, OrderTime as Time, OrderPlace as Place, Total FROM plunk.order WHERE UserID=$_SESSION[UserID]";
                            if(isset($_GET['OrderBy'])){
                              $sql .= " ORDER BY $_GET[OrderBy]";
                            }
                            $orderTable->show($sql, "billdetails");
                          }     
                       ?>

                    </div>

                </div>


  </body>
</html>
