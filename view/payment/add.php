<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/crud.css">

  </head>
  <body>
  <?php
        if(isset($_GET['data'])){
            require_once "../../model/database.php";
            $DB = new DB;
            $id = explode("=", $_GET['data'])[1];
            $query = "SELECT * FROM plunk.booking WHERE BookingID=$id";
            $result = $DB->runQuery($query)[0];
        }else{
            $id = -1;
        }
        date_default_timezone_set("Asia/Kolkata");



    ?>

    <div class="main">
    <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>Add Payment</b></h2>
        <form>
          <div class="submain">
            <input type="hidden" name="UserID" >
            <div class="questions">

                    <label for="CreatedDate">Date :</label>
                    <input type="date" name="LastModifiedDate" id="today" class="bookingid" value="<?php echo date("Y-m-d") ?>" readonly>

            </div><br>
            <div class="bookingiddiv">
                <label for="BookingID">Booking ID :</label>
                <input type="text" name="BookingID" class="bookingid"  readonly>
            </div>
            <div class="questions">
              <label for="type">Booking Type   :</label>
              <input type="text" name="BookingType"  class="type"  readonly>

            </div><br>
              <div class="questions">
                  <label for="name">Name :</label>
                  <input type="text" name="CustomerName" class="qtype1" readonly>
              </div><br>

              <div class="questions">
                  <label for="reservation">Reservation  :</label>
                  <input type="text" name="Reservation" class="qtype1" id="ReservationName"  readonly>
              </div><br>
              <div class="questions">
                  <label for="Total">Price  :</label>
                  <input type="number" name="Total" class="qtype1" id="Cost" readonly>
              </div><br>

              <div class="questions">
                    <label for="date">Reserved Date :</label>
                    <input type="date" name="ReservedDate" class="qtype1" min="<?php echo date("Y-m-d") ?>"  readonly>
              </div><br>
              <div class="reservedtime">
                    <label for="time">Reserved Time:</label>
                    <input type="time" name="ReservedTime"  class="qtype3"  readonly>

              </div>
            <br>
              <div class="questions">
                    <label for="contactno">Contact No :</label>
                    <input type="tel" name="ContactNo" class="qtype1"   readonly>
              </div><br>

            </div>
          <div class="line3">
            <button type="submit" name="button" class="add" formaction="cashgm.php?data=<?php echo $_GET['data'];?>">  <b>Cash</b>  </button>

            <button type="submit" name="button" class="Payment" formaction="..\bookings\payhere.php?data=<?php echo $_GET['data'];?>" ><b>Visa</b> </button>
<!-- ..\payment\paymentgm.php -->
          </div>
        </form>
    </div>
</div>



                <div class="holidaytable">
                  <h3 class="ReservationMenu">CRICKET CLUB BOOKING TABLE</h3>
                  <table id="table1" >
                    <tr>
                      <th>Booking ID</th>
                      <th>Name</th>
                      <th>Type</th>
                      <th>Reservation</th>
                      <th>Price</th>
                      <th>Reserved Date</th>
                      <th>Reserved Time</th>
                      <th>Contact No</th>


                    </tr>

                  <?php
                  require '..\..\model\bookingdatabaseconnection.php';

                  $days = mysqli_query($conn,"SELECT Holiday,Reason FROM plunk.booking WHERE Type ='Club' AND Payment='No'");
                  while($data = mysqli_fetch_array($days))
                  {
                  ?>
                    <tr>
                      <td><?php echo $data['Holiday']; ?></td>
                      <td><?php echo $data['Reason']; ?></td>
                      <td><?php echo $data['Reason']; ?></td>
                      <td><?php echo $data['Reason']; ?></td>
                      <td><?php echo $data['Reason']; ?></td>
                      <td><?php echo $data['Reason']; ?></td>
                      <td><?php echo $data['Reason']; ?></td>

                    </tr>
                  <?php
                  }
                  ?>
                  </table>

                  <?php mysqli_close($conn); // Close connection ?>
                  <script>

                                  var table = document.getElementById('table1');

                                  for(var i = 1; i < table.rows.length; i++)
                                  {
                                      table.rows[i].onclick = function()
                                      {
                                           //rIndex = this.rowIndex;
                                           document.getElementById("Holiday").value = this.cells[0].innerHTML;
                                           document.getElementById("Reason").value = this.cells[1].innerHTML;
                                      };
                                  }

                           </script>


                </div> <br>



    <div class= right>
            <div class="rightbottom">
            <div class="itemtable">
                <h3>PAYMENT DETAILS TABLE</h3>
                <iframe src="paymenttable.php" class="item"></iframe>
            </div>
    </div>
    </div>
    </div>

  </body>


</html>
