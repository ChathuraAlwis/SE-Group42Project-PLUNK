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
                          $salarystaffTable = new Table("servicestaff");
                          $salarystaffTable->show("SELECT ServiceChargeID as 'Service Charge ID', StaffID as 'Staff ID',StaffName as 'Staff Name', Percentage, Amount FROM plunk.servicechargestaff WHERE ServiceChargeID=$_GET[id]", 'update',$_GET['id']);
                       ?>

                    </div>

                </div>


  </body>
</html>