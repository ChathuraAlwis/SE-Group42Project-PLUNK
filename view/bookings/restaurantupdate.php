<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="icon" href="../images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/updatebooking.css">

  </head>
  <body>
    <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $id = explode("=", $_GET['data'])[1];
        $query = "SELECT * FROM plunk.booking WHERE BookingID='$id'";

        $result = $DB->runQuery($query)[0];
        $DBTWO = new DB;
        error_reporting(E_ERROR | E_PARSE); // for hide warnings
        $id = explode("=", $_GET['data'])[1];
        $querytwo = "SELECT * FROM plunk.reservationmenu WHERE ReservationName='$id'";
        // $int_val=intval($id);
        $resulttwo = $DBTWO->runQuery($querytwo)[0];

    ?>
        <div class="main" >
            <div class="header">
              <div class="upperrow"></div>
              <h2>Restaurant Bookings</h2>

            </div><br>
            <form class="addbooking" action="..\..\controller\CRUD.php" method="post" autocomplete="on" >
              <input name ="update-booking" type="hidden" >
              <div class="headerrow">
                <div class="bin">
                  <a href="restaurantbookdelete.php?data=<?php echo $_GET['data'];?>" ><img src="..\images\bin.png" alt="Delete Icon" class="binicon"></a>
                </div>
              </div>

                <div class="submain">
                  <input type="hidden" name="UserID" value="<?php echo($result['UserID'])?>">
                  <div class="questions">

                          <label for="CreatedDate">Date :</label>
                          <input type="date" name="LastModifiedDate" id="today" class="bookingid" value="<?php echo date("Y-m-d") ?>" readonly>

                  </div><br>
                  <div class="bookingiddiv">
                      <label for="BookingID">Booking ID :</label>
                      <input type="text" name="BookingID" class="bookingid" value = "<?php echo "$result[BookingID]";?>" readonly>
                  </div>
                  <div class="questions">
                    <label for="type">Booking Type   :</label>
                    <input type="text" name="BookingType"  class="type" value="<?php echo "$result[BookingType]";?>" readonly>

                  </div><br>
                    <div class="questions">
                        <label for="name">Name :</label>
                        <input type="text" name="CustomerName" class="qtype1" value="<?php echo "$result[CustomerName]";?>"required>
                    </div><br>

                    <div class="questions">
                        <label for="reservation1">Reservation  :</label>
                        <input type="text" name="Reservation" class="qtype1" id="ReservationName" value="<?php echo "$result[Reservation]";?>" required>
                    </div><br>
                    <div class="questions">
                        <label for="reservation1">Price  :</label>
                        <input type="text" name="Total" class="qtype1" id="Cost" value="<?php echo "$result[Total]";?>" required>
                    </div><br>

                    <div class="questions">
                          <label for="NoOfPeaople">No of People:</label>
                          <input type="number" name="NoOfPeaople" min="1" value="1" class="qtype1" value="<?php echo "$result[NoOfPeople]";?>" required>
                    </div><br>
                    <div class="questions">
                          <label for="date">Reserved Date :</label>
                          <input type="date" name="ReservedDate" class="qtype1" min="<?php echo date("Y-m-d") ?>" value="<?php echo "$result[ReservedDate]";?>" required>
                    </div><br>
                    <div class="reservedtime">
                          <label for="time">Reserved Time:</label>
                          <input type="time" name="ReservedTime"  class="qtype3" value="<?php echo "$result[ReservedTime]";?>" required>

                    </div>
                    <div class="questions">
                          <label for="EndTime" class="end">End Time :</label>
                          <input type="time" name="EndTime" class="qtype2" value="<?php echo "$result[EndTime]";?>" required>

                    </div><br>
                    <div class="questions">
                          <label for="contactno">Contact No :</label>
                          <input type="tel" name="ContactNo" class="qtype1"  value="<?php echo "$result[ContactNo]";?>" required>
                    </div><br>

                  </div>
                <div class="line3">
                  <button type="submit" name="button" class="add" formaction="bookingupdatesuccess.html"><b>Update</b> </button>
                  <button type="reset" name="button" class="add"><b>Reset</b> </button><br>
                  <button type="submit" name="button" class="Payment" formaction="..\payment\paymentgm.php" ><b>Payment</b> </button>

                </div>


            </form>
            <div class="resevationtable">
              <h3 class="ReservationMenu">Reservation Menu</h3>
              <table id="table" >
                <tr>
                  <th>Reservation Name</th>
                  <th>Price</th>

                </tr>

              <?php
              require '..\..\model\bookingdatabaseconnection.php';
// C:\xampp\htdocs\project\SE-Group42Project-PLUNK\model\bookingdatabaseconnection.php
              $records = mysqli_query($conn,"SELECT * FROM plunk.reservationmenu WHERE Type ='Restaurant' and IsDeleted='No'");
              while($data = mysqli_fetch_array($records))
              {
              ?>
                <tr>
                  <td><?php echo $data['ReservationName']; ?></td>
                  <td><?php echo $data['Cost']; ?></td>

                </tr>
              <?php
              }
              ?>
              </table>

              <?php mysqli_close($conn); // Close connection ?>
              <script>

                              var table = document.getElementById('table');

                              for(var i = 1; i < table.rows.length; i++)
                              {
                                  table.rows[i].onclick = function()
                                  {
                                       //rIndex = this.rowIndex;
                                       document.getElementById("ReservationName").value = this.cells[0].innerHTML;
                                       document.getElementById("Cost").value = this.cells[1].innerHTML;

                                  };
                              }

                       </script>

            </div>
        </div>
  </body>
</html>
