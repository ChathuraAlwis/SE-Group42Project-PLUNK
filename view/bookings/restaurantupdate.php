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
        date_default_timezone_set("Asia/Colombo");
        require_once "../../model/database.php";
        $DB = new DB;
        $id = explode("=", $_GET['data'])[1];
        $query = "SELECT * FROM plunk.booking WHERE BookingID='$id'";

        $result = $DB->runQuery($query)[0];


    ?>
        <div class="main" >
            <div class="header">
              <div class="upperrow"></div>
              <h2>Restaurant Bookings</h2>

            </div><br>
            <form class="addbookingtwo" action=""  method="post" autocomplete="on" >


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
                        <input type="text" name="CustomerName" class="qtype1" value="<?php echo "$result[CustomerName]";?>"readonly>
                    </div><br>

                    <div class="questions">
                        <label for="reservation">Reservation  :</label>
                        <input type="text" name="Reservation" class="qtype1" id="ReservationName" value="<?php echo "$result[Reservation]";?>" readonly>
                    </div><br>
                    <div class="questions">
                        <label for="Total">Price  :</label>
                        <input type="number" name="Total" class="qtype1" id="Cost" value="<?php echo "$result[Total]";?>" readonly>
                    </div><br>
                    <div class="questions">
                        <label for="Payment">Payment  :</label>
                        <input type="text" name="Payment" class="qtype1" id="Cost" value="<?php echo "$result[Payment]";?>" readonly>
                    </div><br>
                    <div class="questions">
                          <label for="NoOfPeaople">No of People:</label>
                          <input type="number" name="NoOfPeaople" min="1"  class="qtype1" value="<?php echo "$result[NoOfPeople]";?>" readonly>
                    </div><br>
                    <div class="questions">
                          <label for="date">Reserved Date :</label>
                          <input type="date" name="ReservedDate" class="qtype1" min="<?php echo date("Y-m-d") ?>" value="<?php echo "$result[ReservedDate]";?>" readonly>
                    </div><br>
                    <div class="reservedtime">
                          <label for="time">Reserved Time:</label>
                          <input type="time" name="ReservedTime"  class="qtype3" value="<?php echo "$result[ReservedTime]";?>" readonly>

                    </div>
                    <div class="questions">
                          <label for="EndTime" class="end">End Time :</label>
                          <input type="time" name="EndTime" class="qtype2" value="<?php echo "$result[EndTime]";?>" readonly>

                    </div><br>
                    <div class="questions">
                          <label for="contactno">Contact No :</label>
                          <input type="tel" name="ContactNo" class="qtype1"  value="<?php echo "$result[ContactNo]";?>" readonly>
                    </div><br>

                  </div>
                <div class="line3">
                  <button type="submit" name="button" class="add" formaction="restaurentupdatetwo.php?data=<?php echo $_GET['data'];?>">  <b>Edit</b>  </button>

                  <button type="submit" name="button" class="Payment" formaction="..\bookings\payhere.php?data=<?php echo $_GET['data'];?>" ><b>Payment</b> </button>

                </div>
                <div class="line4">
                  <button type="submit" name="confirmbook" class="decisionbtn" formaction="..\..\controller\CRUD.php">  <b>Confirm</b>  </button>

                <button type="submit" name="denybook" class="decisionbtn2" formaction="..\..\controller\CRUD.php">  <b>Deny</b>  </button>
              </div>


            </form>

        </div>
  </body>
</html>
