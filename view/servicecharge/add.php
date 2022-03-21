<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/crud.css">
        <script type="text/javascript" src="../script/addrow.js"></script>

        
  </head>
  <body>
  <?php
        require_once "../../model/database.php";
        //$DB = new DB;
        //$sql = "SELECT ItemID, ItemName, Quantity FROM plunk.item;";
        //$result = json_encode($DB->runQuery($sql));
        // setcookie("Items", json_encode($result));
        if(isset($_GET['data'])){
            $DB = new DB;
            $id = explode("=", $_GET['data'])[1];
            $query = "SELECT StaffID,StaffName,Percentage FROM plunk.salarydetails WHERE StaffID='$id';";
            $result = $DB->runQuery($query)[0];
        }
        else{
            $result['StaffID'] = "Not Selected";
            $result['StaffName'] = "Not Selected";
            $result['Percentage'] = "Not Selected";         
        }
    ?>
    <div class="main">
    <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>Add Service Charge Details</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="add-userservice" type="hidden" >
                <table>
                <tr>
                        <div class="form-group">
                            <td><label for="StaffID">Staff ID</label></td>
                            <td></td>
                            <td><input type="text" id= "StaffID" name="StaffID" required class="form-control" value= "<?php echo "$result[StaffID]";?>"/></td>
                        </div>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <div class="form-group">
                            <td><label for="StaffName">Staff Name</label></td>
                            <td></td>
                            <td><input type="text" id= "StaffName" name="StaffName" required class="form-control" value= "<?php echo "$result[StaffName]";?>"/></td>
                        </div>
                    </tr>
                    <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Percentage">Percentage</label></td>
                        <td></td>
                        <td><input type="number" id="Percentage" name="Percentage" required class="form-control" min=0 oninput="validity.valid||(value='');" value= "<?php echo "$result[Percentage]";?>"/></td>
                    </div>
                </tr>

                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Monthly">Monthly Profit</label></td>
                        <td></td>
                        <td><input type="number" id="Monthly" name="Monthly" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the Monthly Profit"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Amount">Total Amount</label></td>
                        <td></td>
                        <td><input type="number" id="Amount" name="Amount" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Total Amount"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
               
                
            </table>
            <br>
            
            
                <br>
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit"><a class="addpage" href="..\servicecharge\servicedetail.php">Add</a></button>
                    <button type="reset" name="reset" value="Reset" class="button reset" >Reset</button>
                </div>
        </form> 
    </div> 
    </div>
    <div class= right>
      <div class = "righttop">
        <div class="itemtable">
        <h3>SERVICE CHARGE DETAILS TABLE</h3>
            <iframe src="detailtable2.php" class="item"></iframe>
            <!-- <iframe src="detailtable2.php?id=<?php echo $_GET['id'];?>" class="item"></iframe> -->
        </div>
        
       </div>
        <div class = "rightbottom">
            <div class="itemtable">
            <h3>MONTHLY PROFIT DETAILS TABLE</h3>
                <iframe src="../report/MonthlySales.php" class="item"></iframe>
            </div>  
        </div>
    </div>
        
    </div>
     
  </body>

 
</html>