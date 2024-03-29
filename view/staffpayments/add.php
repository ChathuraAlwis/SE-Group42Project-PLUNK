<?php session_start() ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/crud.css">
        <script type="text/javascript" src="../script/additem.js"></script>
        <script type="text/javascript" src="../script/maxQuantity.js"></script>
        
        
  </head>
  <body>
  
    <?php
         if(isset($_GET['data'])){
            require_once "../../model/database.php";
            $DB = new DB;
            $type = explode("=", $_GET['data'])[1];
            $query = "SELECT * FROM plunk.usersalary WHERE detailID=$type";
            $result = $DB->runQuery($query)[0];
        }else{
            $type = -1;
        }
        // require_once "../../model/database.php";
        // if(isset($_GET['data'])){ //Select user type details
        //     $usertype = explode("=", $_GET['data'])[1];
        //     //$query = "SELECT * FROM plunk.company WHERE Company=$companyname";
        //     //$result2 = $DB2->runQuery($query)[0];
        //     //print_r($result2);
        // }
        // else{
        //     $companyname = "Select the Company";
        // }
    ?>
    <div class="main">
    <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>Add Staff Details</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="add-staffdetails" type="hidden" >
                <table class="formtable">
                <tr>
                    <div class="form-group">
                        <td><label for="Company">Staff Member Name</label></td>
                        <td><input type="text" id="Company" name="CompanyName"  required class="form-control"  placeholder="Select the company name from the company table" value = "<?php echo "$companyname";?>"/></td>
                    </div>
                </tr>
                <tr>
                <div class="form-group">
                    <td><label for="Type">Staff Type</label></td>
                    
                    <td><select id="Type" name="ItemType" class="form-control" placeholder="Enter the type" onchange="changeType(this);">
                    <option selected>Choose type...</option>
                        <option value="1">Admin</option>
                        <option value="2">General Manager</option>
                        <option value="3">Reasuturant Manager</option>
                        <option value="4">Accountant</option>
                        <option value="3">Cashier</option>
                        <option value="4">Staff Member</option>
                     </select></td>
                    </div>
                </tr>

                        <tr>
                            <td><label for="Total">Basic Total</label></td>
                            <td><input type="text" id= "Total" name="Total" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the value"/></td>
                        </tr>
                        <tr>
                            <td><label for="Bonus">Bonus Percentage</label></td>
                            <td><input type="text" id= "Bonus" name="Bonus" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the value"/></td>
                        </tr>
                        <tr>
                            <td><label for="ETF">ETF Percentage</label></td>
                            <td><input type="text" id= "" name="ETF" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the value"/></td>
                        </tr>
                        <tr>
                            <td><label for="EPF">EPF Percentage</label></td>
                            <td><input type="text" id= "" name="EPF" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the value"/></td>
                        </tr>
                        <tr>
                            <td><label for="Service">Service Charge Percentage</label></td>
                            <td><input type="text" id= "Service" name="Service" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the value"/></td>
                        </tr>
                    </table>
                        
            
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit" >Add</button>
                    <button type="reset" name="reset" value="Reset" class="button reset" >Reset</button>
                </div>
        </form> 
    </div> 
    </div>
        
    <div class= right>
      <div class = "righttop">
        <div class="itemtable">
            <h4>BASIC DETAILS TABLE</h4>
            <iframe src="detailtable2.php" class="item"></iframe>
        </div>
        
       </div>
        <div class = "rightbottom">
            <div class="itemtable">
                <h4>LEAVES DETAILS TABLE</h4>
                <iframe src="../leave/alldetails.php" class="item"></iframe>
            </div>  
        </div>
    </div>

</div>
     
  </body>

 
</html>