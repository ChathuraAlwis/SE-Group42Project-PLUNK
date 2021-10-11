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
        $query = "SELECT * FROM plunk.notification WHERE NotificationID=$id";
        $result = $DB->runQuery($query)[0];
    ?>

    <div class="main">
    <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>Notifications details</b><image src = "../images/bin.png" class="bin"></image></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="update-notifications" type="hidden" >
               <div class="t"> <table class="formtable">
               <tr>
                    <div class="form-group">
                        <td> <label for="NotificationID">Date</label></td>
                        <td><input type="number" id= "NotificationID" name="NotificationID" required class="form-control" value = "<?php echo "$result[NotificationID]";?>"/></td>
                    </div>
                </tr>
               <tr>
                    <div class="form-group">
                        <td> <label for="Date">Date</label></td>
                        <td><input type="date" id= "Date" name="Date" required class="form-control" value = "<?php echo "$result[Date]";?>"/></td>
                    </div>
                </tr>
                <tr>
                    <div class="form-group">
                        <td><label for="EventType">Event Type</label></td>
                        <td><select id="EventType" name="EventType" class="form-control"  value = "<?php echo "$result[EventType]";?>" onchange="changeType(this);">
                            <option selected>Choose type...</option>
                            <option value="Club">Club Event</option>
                            <option value="Restaurant">Restaurant Event</option>
                            </select>
                        </td>
                    </div>
                </tr>
                <tr>
                <div class="form-group">
                    <td><label for="Message">Message</label></td>
                    <td><textarea  id= "Message" name="Message" required class="form-control" value = "<?php echo "$result[Message]";?>"></textarea></td>
                </div>
                </tr>
            </table>
        </div>
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit">Update</button>
                    <button type="submit" name="cancel" value="cancel" class="button submit"><a href="notificationpage.php">Cancel</a></button>
                </div>
        </form>        
    </div>
    </div>
    <div class= "right">
        <div class = "righttable">
            <div class="itemtable">
            <h3>NOTIFICATIONS TABLE</h3>
            <iframe src="notificationtable.php" class="item"></iframe>
            </div>
        </div>
    </div>

</div> 
  </body>

 
</html>
