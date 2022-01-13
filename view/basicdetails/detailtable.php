
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
                          $salarydetailsTable = new Table("salarydetails");
                          if(isset($_GET['salarydetailssearch'])){
                            $search = $_GET['salarydetailssearch'];
                            $salarydetailsTable->show("SELECT StaffName AS 'Staff Name', UserType AS 'Staff Type', BasicSalary as 'Basic Salary Percentage',Bonus as 'Bonus Percentage',ETF as 'ETF Percentage',EPF as 'EPF Percentage',Percentage as 'Service Charge Percentage', FROM plunk.salarydetails WHERE StaffName LIKE ('%$search%');", 'update');
    
                          }
                          else{
                            $salarydetailsTable->show("SELECT StaffName AS 'Staff Name', UserType AS 'Staff Type', BasicSalary as 'Basic Salary Percentage',Bonus as 'Bonus Percentage',ETF as 'ETF Percentage',EPF as 'EPF Percentage',Percentage as 'Service Charge Percentage', FROM plunk.salarydetails", 'update');
                            
                          }
                          
                       ?>

                    </div>

                </div>


  </body>
</html>