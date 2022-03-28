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
        if(isset($_GET['id'])){
            $sid = $_GET['id'];
            $DB = new DB;
            $query = "SELECT Date FROM plunk.salary WHERE SalaryId=$sid;";
            $month = $DB->runQuery($query)[0]['Date'];
            if(isset($_GET['data'])){
                $DB = new DB;
                $id = explode("=", $_GET['data'])[1];
                $query = "SELECT StaffID,StaffName,BasicSalary,Bonus,ETF,EPF FROM plunk.salarydetails WHERE No=$id;";
                $result = $DB->runQuery($query)[0];
            }
            else{
                $result['StaffID'] = "Not Selected";
                $result['StaffName'] = "Not Selected";
                $result['BasicSalary'] = "Not Selected";
                $result['Bonus'] = "Not Selected";  
                $result['ETF'] = "Not Selected";
                $result['EPF'] = "Not Selected";         
            }
        }

    ?>

    <div class="main">
    <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>Add Salary Details</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="add-usersalary" type="hidden" >
                <input type="hidden" name="SalaryID" value=<?php echo $sid;?>>
                <input type="hidden" name="StaffName" value=<?php echo $result['StaffName'];?>>
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
                        <td><label for="Basic">Basic Salary</label></td>
                        <td></td>
                        <td><input type="number" id="Basic" name="Basic" required class="form-control" min=0 oninput="validity.valid||(value='');" value= "<?php echo "$result[BasicSalary]";?>"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Bonus">Bonus Percentage</label></td>
                        <td></td>
                        <td><input type="number" id="Bonus" name="Bonus" required class="form-control" min=0 oninput="validity.valid||(value='');" value= "<?php echo "$result[Bonus]";?>"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                    <tr>
                    <div class="form-group">
                        <td><label for="ETF">ETF Percentage</label></td>
                        <td></td>
                        <td><input type="number" id="ETF" name="ETF" required class="form-control" min=0 oninput="validity.valid||(value='');" value= "<?php echo "$result[ETF]";?>"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                    <tr>
                    <div class="form-group">
                        <td><label for="EPF">EPF Percentage</label></td>
                        <td></td>
                        <td><input type="number" id="EPF" name="EPF" required class="form-control" min=0 oninput="validity.valid||(value='');" value= "<?php echo "$result[EPF]";?>"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Num">Leave days</label></td>
                        <td></td>
                        <td><input type="number" id="Num" name="Num" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the total leaves"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>

                <tr>
                <div class="form-group">
                    <td><label for="Type">Total Leaves</label></td>
                    <td></td>
                    <td><select id="Type" name="LeaveType" class="form-control" placeholder="Choose the leaves details" onchange="calculateTotal(this);">
                    <option selected>Choose correct detail...</option>
                        <option value="1">Total leaves less than 5</option>
                        <option value="2">All Medical leaves greater than 7</option>
                        <option value="3">Total leaves greater than 5</option>
                     </select></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                
                <tr>
                    <div class="form-group">
                        <td><label for="Total">Total Salary</label></td>
                        <td></td>
                        <td><input type="number" id="Total" name="Total" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Total salary"/></td>
                    </div>
                </tr>
               
                
            </table>
            <br>
            
            
                <br>
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit">Add</button>
                    <button type="reset" name="reset" value="Reset" class="button reset" >Reset</button>
                </div>
        </form> 
    </div> 
    </div>
    <div class= right>
      <div class = "righttop">
        <div class="itemtable">
            <h3>SALARY DETAILS TABLE</h3>
            <iframe src="detailtable2.php?sid=<?php echo $sid;?>" class="item"></iframe>
        </div>
        
       </div>
        <div class = "rightbottom">
            <div class="itemtable">
                <h3>LEAVE DETAILS TABLE</h3>
                <?php if($result['StaffID']!="Not Selected" and isset($month)){
                    $rsid = $result['StaffID'];
                    echo "<iframe src='../leave/allleave.php?StaffID=$rsid&month=$month' class='item'></iframe>";
                }else{
                    echo "<iframe src='../leave/allleave.php' class='item'></iframe>";
                }
                ?>
            </div>  
        </div>
    </div>
        
    </div>
     
  </body>

 
</html>
