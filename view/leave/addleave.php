<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/crud.css">
        <script type="text/javascript" src="../script/additem.js"></script>

  </head>
  <body>
  <?php
        if(isset($_GET['data'])){
            require_once "../../model/database.php";
            $DB = new DB;
            $id = explode("=", $_GET['data'])[1];
            $query = "SELECT * FROM plunk.leave WHERE RequestDate=$id";
            $result = $DB->runQuery($query)[0];
        }else{
            $id = -1;
        }
        date_default_timezone_set("Asia/Kolkata");



    ?>
    <div class="main">
      <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>Add Leave</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
          <input name ="add-leave" type="hidden" >
          <table class="formtable">
            <tr>
                <div class="form-group">
                            
                                <td><label for="Date">Date</label></td>
                                
                                <td><input name ="Date" id="Date" type="date" value="<?php echo date("Y-m-d") ?>" readonly></td>
                            </tr>
                        </div>
              </tr>
                
            <tr>
                <div class="form-group">
                    <td><label for="LeaveDate"> Request Date</label></td>
                    <td><input type="date" id= "LeaveDate" name="LeaveDate" required class="form-control" min="<?php echo date("Y-m-d") ?>" placeholder="Enter the Date"/></td>
                </div>
            </tr>
            <tr>
                <div class="form-group">
                    <td><label for="Type">Leave Type</label></td>
                    
                    <td><select id="Type" name="Type" class="form-control" placeholder="Enter the type" onchange="changeType(this);">
                    <option selected>Choose type...</option>
                    <!-- <option value="Annual">Annual Leaves</option> -->
                    <option value="Casual">Casual Leaves</option>
                    <option value="Medical">Medical Leaves</option>
                     </select></td>
                    </div>
            </tr>
                <tr>
                      <td><label for="NoOfdays">No Of Days</label></td>
                      <td><input type="number" id= "NoOfdays" name="NoOfdays" required class="form-control" min=1 oninput="validity.valid||(value='');" max=3 oninput="validity.valid||(value='');" placeholder="Enter the no of days"/></td>
                </tr>
                <div class="form-group">
                    <td><label for="Reason">Reason</label></td>
                    <td><textarea id= "Reason" name="Reason" required class="form-control" placeholder="Enter the Reason"></textarea></td>
                </div>
          </table>
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit">Request</button>
                    <button type="submit" name="cancel" value="cancel" class="button submit"><a class="cancel" href="leavepage.php">Cancel</a></button>
                </div>
        </form>        
      </div>
    </div>
        <div class= right>
            <div class="righttable">
            <div class="itemtable">
                <h3>LEAVE TABLE</h3>
                <iframe src="leavetable.php" class="item"></iframe>
                <!-- <?php if(isset($month)){
                    echo "<iframe src='../report/leave.php?today=$month&ser' class='item'></iframe>";
                }else{
                    echo "<iframe src='../report/leave.php' class='item'></iframe>";
                }
                ?> -->
            </div>
    </div>
    </div>
    </div> 
  </body>

 
</html>
