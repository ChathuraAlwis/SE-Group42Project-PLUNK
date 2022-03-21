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
            $query = "SELECT StaffID,BasicSalary,Bonus,ETF,EPF FROM plunk.salarydetails WHERE No=$id;";
            $result = $DB->runQuery($query)[0];
            print_r($_GET);
        }
        else{
            $result['StaffID'] = "Not Selected";
            $result['BasicSalary'] = "Not Selected";
            $result['Bonus'] = "Not Selected";  
            $result['ETF'] = "Not Selected";
            $result['EPF'] = "Not Selected";         
        }
    ?>

    <div class="main">
    <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>Add Salary Details</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="add-usersalary" type="hidden" >
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
                        <td><label for="Basic">Basic Salary</label></td>
                        <td></td>
                        <td><input type="number" id="Basic" name="Basic" required class="form-control" min=0 oninput="validity.valid||(value='');" value= "<?php echo "$result[BasicSalary]";?>"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Bonus">Bonus Value</label></td>
                        <td></td>
                        <td><input type="number" id="Bonus" name="Bonus" required class="form-control" min=0 oninput="validity.valid||(value='');" value= "<?php echo "$result[Bonus]";?>"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                    <tr>
                    <div class="form-group">
                        <td><label for="ETF">ETF Value</label></td>
                        <td></td>
                        <td><input type="number" id="ETF" name="ETF" required class="form-control" min=0 oninput="validity.valid||(value='');" value= "<?php echo "$result[ETF]";?>"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                    <tr>
                    <div class="form-group">
                        <td><label for="EPF">EPF Value</label></td>
                        <td></td>
                        <td><input type="number" id="EPF" name="EPF" required class="form-control" min=0 oninput="validity.valid||(value='');" value= "<?php echo "$result[EPF]";?>"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>

                <tr>
                <div class="form-group">
                    <td><label for="Type">Total Leaves</label></td>
                    <td></td>
                    <td><select id="Type" name="LeaveType" class="form-control" placeholder="Choose the leaves details" onchange="changeType(this);">
                    <option selected>Choose correct detail...</option>
                        <option value="1">Total leaves less than 5</option>
                        <option value="2">All Medical leaves less than 7</option>
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
                    <button type="submit" name="submit" value="Submit" class="button submit"><a class="addpage" href="..\salary\saldetail.php">Add</a></button>
                    <button type="reset" name="reset" value="Reset" class="button reset" >Reset</button>
                </div>
        </form> 
    </div> 
    </div>
    <div class= right>
      <div class = "righttop">
        <div class="itemtable">
            <h3>SALARY DETAILS TABLE</h3>
            <iframe src="detailtable2.php" class="item"></iframe>
            <!-- <iframe src="detailtable2.php?id=<?php echo $_GET['id'];?>" class="item"></iframe> -->
        </div>
        
       </div>
        <div class = "rightbottom">
            <div class="itemtable">
                <h3>LEAVE DETAILS TABLE</h3>
                <form action="add.php" method="post">
                    <input type = "text" name= "name" class = "search" placeholder="Search by Name" value="<?php if(isset($_POST['name'])) {echo $_POST['name'];}?>" />
                    <input title="Month" name = "month" type = date class = "search" value="<?php if(isset($_POST['month'])) {echo $_POST['month'];} else {echo date("Y-m-d");}?>">
                    <?php if(isset($_POST['name']) and isset($_POST['month'])){
                        echo "<iframe src='../leave/allleave.php?name=$_POST[name]&month=$_POST[month]' class='item'></iframe>";
                    }else{
                        echo "<iframe src='../leave/allleave.php' class='item'></iframe>";
                    }
                    ?>
                </form>
            </div>  
        </div>
    </div>
        
    </div>
     
  </body>

 
</html>
