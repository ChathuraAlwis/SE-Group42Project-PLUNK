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
                          $orderTable = new Table("orderitem");
                          $orderTable->show("SELECT item.ItemName as 'Item Name', orderitem.Quantity FROM plunk.orderitem INNER JOIN plunk.item ON orderitem.ItemID=item.ItemID WHERE orderitem.OrderID=$_GET[OrderID];");  
                       ?>

                    </div>

                </div>


  </body>
</html>
