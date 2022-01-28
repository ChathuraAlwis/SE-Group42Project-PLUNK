
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
                          $salarydetailsTable = new Table("usersalary");
                          if(isset($_GET['salarydetailssearch'])){
                            $search = $_GET['salarydetailssearch'];
                            $salarydetailsTable->show("SELECT * FROM plunk.usersalary WHERE userType LIKE ('%$search%');", 'update');
    
                          }
                          else{
                            $salarydetailsTable->show("SELECT * FROM plunk.usersalary", 'update');
                            
                          }
                          
                       ?>

                    </div>

                </div>


  </body>
</html>