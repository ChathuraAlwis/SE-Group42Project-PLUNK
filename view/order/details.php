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
                            if(isset($_GET['ordersearch'])){
                              $search = $_GET['ordersearch'];
                              $sql = "SELECT * FROM plunk.order WHERE OrderDate='$search'";
                              if(isset($_GET['OrderBy'])){
                                $orderBy = str_replace("-", " ", $_GET['OrderBy']);
                                $sql .= " ORDER BY $orderBy";
                              }
                              $orderTable->show($sql, "none", "none", "ordersearch");
                            }
                            else{
                              $sql = "SELECT * FROM plunk.order";
                              if(isset($_GET['OrderBy'])){
                                $orderBy = str_replace("-", " ", $_GET['OrderBy']);
                                $sql .= " ORDER BY $orderBy";
                              }
                              $orderTable->show($sql, "../order/billdetails");
                            }
                          }
                          else{
                            if(isset($_GET['ordersearch'])){
                              $search = $_GET['ordersearch'];
                              $sql = "SELECT OrderID, OrderDate as Date, OrderTime as Time, OrderPlace as Place, Total FROM plunk.order WHERE UserID=$_SESSION[UserID] AND OrderDate='$search'";
                              if(isset($_GET['OrderBy'])){
                                $orderBy = str_replace("-", " ", $_GET['OrderBy']);
                                $sql .= " ORDER BY $orderBy";
                              }
                              $orderTable->show($sql, "none", "none", "ordersearch");
                            }
                            else{
                              $sql = "SELECT OrderID, OrderDate as Date, OrderTime as Time, OrderPlace as Place, Total FROM plunk.order WHERE UserID=$_SESSION[UserID]";
                              if(isset($_GET['OrderBy'])){
                                $orderBy = str_replace("-", " ", $_GET['OrderBy']);
                                $sql .= " ORDER BY $orderBy";
                              }
                              $orderTable->show($sql, "../order/billdetails");
                            }
                            // $sql = "SELECT OrderID, OrderDate as Date, OrderTime as Time, OrderPlace as Place, Total FROM plunk.order WHERE UserID=$_SESSION[UserID]";
                            // if(isset($_GET['OrderBy'])){
                              //   $orderBy = str_replace("-", " ", $_GET['OrderBy']);
                            //   $sql .= " ORDER BY $orderBy";
                            // }
                            // $orderTable->show($sql, "billdetails");
                          }     
                       ?>

                    </div>

                </div>


  </body>
</html>
