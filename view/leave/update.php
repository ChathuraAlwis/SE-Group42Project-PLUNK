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
        $query = "SELECT * FROM plunk.leave WHERE LeaveDate= '$id' || UserID = '$id' ";
        $result = $DB->runQuery($query)[0];
        //print_r($query);
    ?>
    <div class="main">
      <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>Leave Details</b>
        <image src = "../images/bin.png" class="bin"></image></h2>
        <form action="../../controller/CRUD.php" method="POST">
          <input name ="delete-leave" type="hidden" >
          <table class="formtable">
            <tr>
                <div class="form-group">
                    <td><label for="LeaveDate">Date</label></td>
                    <td><input type="date" id= "LeaveDate" name="LeaveDate" required class="form-control" min="<?php echo date("Y-m-d") ?>" value = "<?php echo "$result[LeaveDate]";?>" readonly/></td>
                </div>
            </tr>
            <tr>
                <div class="form-group">
                    <td><label for="Reason">Reason</label></td>
                    <td><textarea id= "Reason" name="Reason" required class="form-control" readonly><?php echo "$result[Reason]";?></textarea></td>
                </div>
            </tr>
          </table>
                <div class="form-group">
                   
                    <button type="back" name="cancel" value="cancel" class="button submit"><a class="cancel" href="leavepage.php">Cancel</a></button>
                </div>
        </form>        
      </div>
    </div>
        <div class= right>
            <div class="righttable">
            <div class="itemtable">
                <h3>LEAVE TABLE</h3>
                <iframe src="leavetable.php" class="item"></iframe>
            </div>
    </div>
    </div>
    </div> 
  </body>

 
</html>
