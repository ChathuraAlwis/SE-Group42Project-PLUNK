<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/tabledesign.css">

  </head>
  <body>
        <div class="main" >

                    <div class="detailtable">
                    <?php
                          require_once "..\..\controller\showtable.php";
                          $orderTable = new Table("salarydetails");
                          $orderTable->show("SELECT StaffID, StaffName AS 'Staff Name', UserType AS 'Staff Type', BasicSalary as 'Basic Salary Percentage',Bonus as 'Bonus Percentage',ETF as 'ETF Percentage',EPF as 'EPF Percentage' FROM plunk.salarydetails");
                       ?>

                    </div>

                </div>


  </body>
</html>
