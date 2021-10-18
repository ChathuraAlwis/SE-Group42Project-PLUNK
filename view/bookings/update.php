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

    ?>
        <div class="main" >
            <div class="header">
              <div class="upperrow"></div>
              <h2>Bookings</h2>

            </div><br>
            <form class="addbooking" action="..\..\controller\CRUD.php" method="post" autocomplete="on" >
              <input name ="update-booking" type="hidden" >
              <div class="headerrow">
                <div class="bin">
                  <a href="delete.php?data=<?php echo $_GET['data'];?>" ><img src="..\images\bin.png" alt="Delete Icon" class="binicon"></a>
                </div>
              </div>
              <div class="submain">
                <div class="bookingiddiv">
                    <label for="BookingID">Booking ID :</label>
                    <input type="text" name="BookingID" class="bookingid" value = "<?php echo "$result[BookingID]";?>" readonly>
                </div>
                <div class="questions">
                      <label for="LastModifiedDate">Date :</label>
                      <input type="date" name="LastModifiedDate" class="bookingid" value="<?php echo date("Y-m-d") ?>" readonly>
                </div><br>
                  <div class="questions">
                      <label for="CustomerName">Name :</label>
                      <input type="text" name="CustomerName"class="qtype1" value = "<?php echo "$result[CustomerName]";?>" required>
                  </div><br>
                  <div class="questions">
                    <label for="type">Booking Type   :</label>
                    <select class="type" name="BookingType"  required>
                            <?php echo "$result[BookingType]";?>
                            <option value="Club">Club</option>
                            <option value="Restaurant">Restaurant</option>
                    </select>

                  </div><br>
                  <div class="questions">
                      <label for="reservation1">Reservation 1 :</label>
                      <select class="reservation1" name="reservation1" id="reservation1" required>

                        <option >Lotus lounge</option>
                        <option >Board Room</option>
                        <option >Center Wicket</option>
                        <option >Practice wicket 1</option>

                      </select>


                  </div><br>
                  <div class="questions">
                        <label for="reservation2">Reservation 2 :</label>
                        <select class="reservation1" name="reservation1" id="reservation1" required>


                          <option >Board Room</option>
                          <option >Center Wicket</option>
                          <option >Practice wicket 1</option>

                        </select>
                  </div><br>
                  <div class="questions">
                        <label for="NoOfPeople">No of People:</label>
                        <input type="number" name="NoOfPeople" class="qtype1" min="1" value = "<?php echo "$result[NoOfPeople]";?>" required>
                  </div><br>
                  <div class="questions">
                        <label for="date">Reserved Date :</label>
                        <input type="date" name="ReservedDate" class="qtype1" min="<?php echo date("Y-m-d") ?>" value = "<?php echo "$result[ReservedDate]";?>" required>
                  </div><br>
                  <div class="reservedtime">
                        <label for="time">Reserved Time:</label>
                        <input type="time" name="ReservedTime" class="qtype3" value = "<?php echo "$result[ReservedTime]";?>" required>
                  </div>
                  <div class="questions">
                        <label for="EndTime">End Time :</label>
                        <input type="time" name="EndTime" class="qtype2" value="<?php echo "$result[EndTime]";?>" required>

                  </div><br>
                  <div class="questions">
                        <label for="contactno">Contact No :</label>
                        <input type="tel" name="ContactNo" class="qtype1" value = "<?php echo "$result[ContactNo]";?>" required>
                  </div><br>

                </div>
                <div class="line3">
                  <button type="submit" name="button" class="add" formaction="bookingupdatesuccess.html"><b>Update</b> </button>
                  <button type="reset" name="button" class="add"><b>Reset</b> </button><br>
                  <button type="submit" name="button" class="Payment" formaction="..\payment\paymentgm.php"><b>Payment</b> </button>

                </div>


            </form>
        </div>
  </body>
</html>
