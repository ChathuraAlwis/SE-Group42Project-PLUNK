<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/leavepermission.css">


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
        <h2 class="center-text"><b>Permission for Leave</b></h2>
        <form action="../../controller/CRUD.php" method="POST">


          <div class="form-group">
              <td><label for="UserID">User ID</label></td>
              <td><input type="text" id= "LeaveDate" name="UserID"  class="form-control" value="<?php echo ($result['UserID']); ?>" readonly></td>
          </div><br>
                <div class="form-group">
                    <td><label for="RequestedDate">Requested Date</label></td>
                    <td><input type="date" id= "LeaveDate" name="RequestedDate"  class="form-control" value="<?php echo ($result['RequestedDate']); ?>" readonly ></td>
                </div><br>
                <div class="form-group">
                    <td><label for="LeaveDate">Leave Date</label></td>
                    <td><input type="date" id= "LeaveDate" name="LeaveDate"   class="form-control" value="<?php echo ($result['LeaveDate']); ?>" readonly></td>
                </div><br>


                <div class="form-group">
                    <td><label for="Reason">Reason</label></td>
                    <td><textarea id= "Reason" name="Reason"   class="form-control2" placeholder="Enter the Reason" readonly><?php echo ($result['Reason']); ?></textarea></td>
                </div><br>

                <div class="form-group">
                    <button type="submit" name="accept"  class="button submit" >Accept </button>
                    <button type="submit" name="deny"  class="button submit">Deny</button>
                </div>
        </form>
      </div>
    </div>

    </div>
  </body>


</html>
