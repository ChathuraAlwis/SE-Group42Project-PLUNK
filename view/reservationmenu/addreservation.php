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
    <div class=main>
    <div class= left>
    <div class="form">
        <h2 class="center-text"><b>Add Place</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="add-reservation" type="hidden" >
            <table>
                <tr><div class="form-group">
                        <td><label for="ReservationName">Reservation Name</label></td>
                        <td><input type="text" id= "ReservationName" name="ReservationName" required class="form-control" placeholder="Enter the Reservation Name"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr><div class="form-group">
                    <td><label for="Type">Reservation Type</label></td>
                    <td><select id="Type" name="Type" class="form-control" placeholder="Enter the item type" onchange="changeType(this);">
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
                    <td><input type="number" id="Cost" name="Cost" required class="form-control" placeholder="Enter the Cost"/></td>
                    </div>
                </tr>
            </table>
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit">Add</button>
                    <button type="reset" name="reset" value="Reset" class="button reset">Reset</button>
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
