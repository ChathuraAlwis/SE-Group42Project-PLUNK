<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/crud.css">
        <script type="text/javascript" src="../script/additem.js"></script>
        <script type="text/javascript" src="../script/updatedata.js"></script>

  </head>
  <body>
  <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $id = explode("=", $_GET['data'])[1];
        $query = "SELECT * FROM plunk.salarydetails WHERE StaffID='$id'";

        $result = $DB->runQuery($query)[0];

    ?>


    <div class=main>
    <div class= left>
    <div class="form">
			  <h2 class="center-text"><b>Staff Member Salary Details</b></h2>
        <a href="deletemsg.php"><image src = "../images/bin.png" class="bin"></image></a> 
			
        
        <form action="../../controller/CRUD.php" method="POST">
            <input name ="update-basicdetail" type="hidden" >
            <table class="formtable">
              <tr>
                <div class="form-group">
                   <td><label for="StaffID">Staff ID</label></td> 
                    <td><input type="number" id= "StaffID" name="StaffID" required class="form-control" value = "<?php echo "$result[StaffID]";?>"/></td>
                </div>
              </tr>
              <tr>
                <div class="form-group">
                   <td><label for="StaffName">Staff Member Name</label></td> 
                    <td><input type="text" id= "StaffName" name="StaffName" required class="form-control" value = "<?php echo "$result[StaffName]";?>"/></td>
                </div>
              </tr>
              <tr>
                <div class="form-group">
                   <td><label for="UserType">Staff Type</label></td> 
                    <td><input type="text" id= "UserType" name="UserType" required class="form-control" value = "<?php echo "$result[UserType]";?>"/></td>
                </div>
              </tr>
              <tr>
                    <div class="form-group">
                        <td><label for="BasicSalary">Basic Value</label></td>
                        <td><input type="text" id= "BasicSalary" name="BasicSalary" required class="form-control" min=0 oninput="validity.valid||(value='');" value = "<?php echo "$result[BasicSalary]";?>"/></td>
                    </div>
                </tr>
              <tr>
                    <div class="form-group">
                        <td><label for="Bonus">Bonus Value</label></td>
                        <td><input type="text" id= "Bonus" name="Bonus" required class="form-control" min=0 oninput="validity.valid||(value='');" value = "<?php echo "$result[Bonus]";?>"/></td>
                    </div>
                </tr>
                <tr>
                    <div class="form-group">
                        <td><label for="ETF">ETF Value</label></td>
                        <td><input type="text" id= "ETF" name="ETF" class="form-control" min=0 oninput="validity.valid||(value='');" value = "<?php echo "$result[ETF]";?>"/></td>
                    </div>
                </tr>
                <tr>
                <div class="form-group">
                   <td><label for="EPF">EPF Value</label></td> 
                    <td><input type="text" id= "EPF" name="EPF" class="form-control" min=0 oninput="validity.valid||(value='');" value = "<?php echo "$result[EPF]";?>"/></td>
                </div>
              </tr>
              <tr>
                <div class="form-group">
                   <td><label for="Percentage">Service Charge Percentage</label></td> 
                    <td><input type="text" id= "Percentage" name="Total" required class="form-control" min=0 oninput="validity.valid||(value='');" value = "<?php echo "$result[Percentage]";?>"/></td>
                </div>
              </tr>
            </table>
            
                <br>
                <div class="form-group">
                <button type="submit" name="submit" value="Submit" class="button submit" ><a class="cancel" href="updatesalarysuccess.html">Update</a></button>
                <button type="submit" name="cancel" value="cancel" class="button submit"><a class="cancel" href="salarytable.php">Cancel</a></button>
            </div>
    </form>                
</div>
</div>
<div class= right>
    <div class = "righttop">
        <div class="itemtable">
            <h4>STAFF MEMBERS DETAILS TABLE</h4>
            <iframe src="staff.php" class="item"></iframe>
        </div>
        
       </div>
        <div class = "rightbottom">
            <div class="itemtable">
                <h4>STAFF CATEGORY PAYMENTS DETAILS TABLE</h4>
                <iframe src="detailtable2.php" class="item"></iframe>
            </div>  
        </div>
    </div>
</div>
     
  </body>

 
</html>