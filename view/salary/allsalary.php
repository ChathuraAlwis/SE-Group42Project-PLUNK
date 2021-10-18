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
                          $salarystaffTable = new Table("salarystaff");
                          $salarystaffTable->show("SELECT StaffID as 'Staff ID', Basic as 'Basic Salary', Bonus as 'Bonus Value', EPF as 'EPF Value', ETF as 'ETF Value', Total as 'Total Salary' FROM plunk.salarystaff WHERE SalaryID=$_GET[id]", 'update');
                       ?>

                    </div>

                </div>

  </body>
</html>