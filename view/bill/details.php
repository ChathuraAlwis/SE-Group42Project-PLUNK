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
                          if(isset($_POST['billsearch'])){
                            $search = $_POST['billsearch'];
                            $billTable->show("SELECT * FROM plunk.bill WHERE CustomerName LIKE ('%$search%') ORDER BY BillID DESC;", "../order/billdetails");
                            // $orderTable->show("SEARCH Cus");
                          }
                          else{
                            $billTable->show("SELECT * FROM plunk.bill WHERE Paid=1 ORDER BY BillID DESC", "../order/billdetails");
                          }
                          
                       ?>

                    </div>

                </div>


  </body>
</html>
