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
                          $billTable = new Table("bill");
                          if(isset($_GET['billsearch'])){
                            $search = $_GET['billsearch'];
                            $sql = "SELECT * FROM plunk.bill WHERE CustomerName LIKE ('%$search%')";
                            if(isset($_GET['OrderBy'])){
                              $sql .= " ORDER BY $_GET[OrderBy]";
                            }
                            $billTable->show($sql);
                          }
                          else{
                            $sql = "SELECT * FROM plunk.bill WHERE Paid=1";
                            if(isset($_GET['OrderBy'])){
                              $sql .= " ORDER BY $_GET[OrderBy]";
                            }
                            $billTable->show($sql, "../order/billdetails");
                          }
                          
                       ?>

                    </div>

                </div>


  </body>
</html>
