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
        <h2 class="center-text"><b>Leave</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
          <input name ="add-leave" type="hidden" >
          <div class="form-group">
              <td><label for="LeaveDate">User ID</label></td>
              <td><input type="date" id= "LeaveDate" name="LeaveDate"  class="form-control" readonly></td>
          </div><br>
                <div class="form-group">
                    <td><label for="LeaveDate">Requested Date</label></td>
                    <td><input type="date" id= "LeaveDate" name="LeaveDate"  class="form-control" readonly ></td>
                </div><br>
                <div class="form-group">
                    <td><label for="LeaveDate">Leave Date</label></td>
                    <td><input type="date" id= "LeaveDate" name="LeaveDate"   class="form-control" readonly></td>
                </div><br>


                <div class="form-group">
                    <td><label for="Reason">Reason</label></td>
                    <td><textarea id= "Reason" name="Reason"   class="form-control" placeholder="Enter the Reason" readonly></textarea></td>
                </div><br>

                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit" ><a href="..\leave\accepted.html">Accept</a> </button>
                    <button type="submit" name="cancel" value="cancel" class="button submit"><a href="..\leave\denied.html">Deny</a></button>
                </div>
        </form>
      </div>
    </div>

    </div>
  </body>


</html>
