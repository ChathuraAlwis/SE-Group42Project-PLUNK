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
                        $itemTable = new Table("item");
                        if($_SESSION['UserType'] == 'Life Member' || $_SESSION['UserType'] == 'Ordinary Member' || $_SESSION['UserType'] == 'Hon.Life Member'){
                          $itemTable->show("SELECT ItemID, ItemName as Name, ItemType as Type, Price, Discount FROM plunk.item WHERE Availability=1", '../order/add');
                        }
                        elseif ($_SESSION['UserType'] == 'Cashier') {
                          $itemTable->show("SELECT * FROM plunk.item", '../order/add');
                        }
                        elseif ($_SESSION['UserType'] == 'Accountant') {
                          $itemTable->show("SELECT ItemID as 'Item ID',ItemType as 'Item Type',ItemName as 'Item Name',ItemCost as 'Item Cost',Quantity as 'Quantity', ReorderQuantity as 'Reorder Quantity' FROM plunk.item where ReorderQuantity NOT LIKE '0' " );
                        }
                        elseif ($_SESSION['UserType'] == 'Restaurant Manager'){
                          $itemTable->show("SELECT * FROM plunk.item", 'update');;
                        }



                        // $itemTable->show("SELECT * FROM plunk.item", 'update');

                    ?>

                          
                    

                    </div>

                </div>


  </body>
</html>
