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
        $personid = explode("=", $_GET['data'])[1];
        echo $personid;
        // $personid=$_GET['getdata'];
        $query = "SELECT * FROM plunk.salarystaff WHERE SalaryID=$personid";
        $result = $DB->runQuery($query)[0];

    ?>

    <div class=main>
    <div class= left>
    <div class="form">
			<h2 class="center-text"><b>Salary Details</b></h2>
            <!-- <a href="deletesalarysuccess.html"><image src = "../images/bin.png" class="bin"></image></a> -->
			
        
        <form action="../../controller/CRUD.php" method="POST">
            <input name ="update-usersalary" type="hidden" >
            <table class="formtable">
            <tr>
                <div class="form-group">
                   <td><label for="SalaryID">Salary ID</label></td> 
                    <td><input type="text" id= "SalaryID" name="SalaryID" required class="form-control" value = "<?php echo "$result[SalaryID]";?>"/></td>
                </div>
              </tr>
              <tr>
                <div class="form-group">
                   <td><label for="StaffID">Staff ID</label></td> 
                    <td><input type="text" id= "StaffID" name="StaffID" required class="form-control" value = "<?php echo "$result[StaffID]";?>"/></td>
                </div>
              </tr>
              <tr>
                    <div class="form-group">
                        <td><label for="Basic">Basic Value</label></td>
                        <td><input type="text" id= "Basic" name="Basic" required class="form-control" min=0 oninput="validity.valid||(value='');" value = "<?php echo "$result[Basic]";?>"/></td>
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
                   <td><label for="Total">Total Salary</label></td> 
                    <td><input type="number" id= "Total" name="Total" required class="form-control" min=0 oninput="validity.valid||(value='');" value = "<?php echo "$result[Total]";?>"/></td>
                </div>
              </tr>
            </table>
            
                <br>
                <div class="form-group">
                <button type="submit" name="submit" value="Submit" class="button submit" >Update</button>
                <button type="submit" name="cancel" value="cancel" class="button submit"><a class="cancel" href="salarytable.php">Cancel</a></button>
            </div>
    </form>                
    </div>
</div>
<div class= right>
   <div class = "righttop">
        <div class="itemtable">
            <h4>SALARY DETAILS TABLE</h4>
            <iframe src="allsalary.php?id=<?php echo $personid;?>" class="item"></iframe>
        </div>
        
    </div>
    <div class = "rightbottom">
            <div class="itemtable">
            <h3>LEAVE DETAILS TABLE</h3>
            <form action="add.php" method="post">
                    <input type = "text" name= "name" placeholder="Search by Name" value="<?php if(isset($_POST['name'])) {echo $_POST['name'];}?>" />
                    <input title="Month" name = "month" type = date value="<?php if(isset($_POST['month'])) {echo $_POST['month'];} else {echo date("Y-m-d");}?>"><button type = "submit"><b>Search</b></button>
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