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
  <script>
        var ans = getParameterByName('data', window.location.href);
        var id = ans.slice(-1);
        document.cookie = 'data='+id;
    </script>
    <?php 
        require_once "../../model/database.php";
        $DB = new DB;
        $name = $_COOKIE['data'];
        $query = "SELECT * FROM plunk.resevationmenu WHERE ReservationName=$name";
        $result = $DB->runQuery($query)[0];
        //print_r($result);
    ?>
    <div class=main>
    <div class= left>
    <div class="form">
        <h2 class="center-text"><b>Place Details</b><image src = "../images/bin.png" class="bin"></image></h2></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="update-reservation" type="hidden" >
            <table>
                <tr><div class="form-group">
                        <td><label for="ReservationName">Reservation Name</label></td>
                        <td><input type="text" id= "ReservationName" name="ReservationName" required class="form-control" value = "<?php echo "$result[ReservstionName]";?>"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr><div class="form-group">
                    <td><label for="Type">Reservation Type</label></td>
                    <td><select id="Type" name="Type" class="form-control" placeholder="Enter the item type" value = "<?php echo "$result[Type]";?>" onchange="changeType(this);">
                    <option selected> Choose type ...</option>
                        <option value="club">Club</option>
                        <option value="restaurant">Restaurant</option>
                     </select></td>
                </div>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                <div class="form-group">
                    <td><label for="Cost">Cost</label></td>
                    <td><input type="number" id="Cost" name="Cost" required class="form-control" value = "<?php echo "$result[Cost]";?>"/></td>
                    </div>
                </tr>
            </table>
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit">update</button>
                    <button type="submit" name="cancel" value="cancel" class="button submit"><a href="Reservationmenupage.php">Cancel</a></button>
                </div>
        </form> 
    </div>       
    </div>
    <div class= right>
    <div class="righttable">
        <div class="itemtable">
            <h3>RESERVATIONMENU TABLE</h3>
            <iframe src="Reservationmenutable.php" class="item"></iframe>
        </div>
    </div>
    </div>
</div>
  </body>

 
</html>
