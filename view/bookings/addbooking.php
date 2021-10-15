<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="icon" href="../images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/addbooking.css">

  </head>
  <body>
        <div class="main" >
            <div class="header">
              <div class="upperrow"></div>
              <h2>Bookings</h2>

            </div><br>
            <form class="addbooking" action="index.html" method="post" autocomplete="on" >
              <div class="submain">
                <div class="questions">

                        <label for="CreatedDate">Date :</label>
                        <input type="date" name="CreatedDate" id="today" value="<?php echo date("Y-m-d") ?>" readonly>

                </div><br>
                  <div class="questions">
                      <label for="name">Name :</label>
                      <input type="text" name="CustomerName" required>
                  </div><br>
                  <div class="questions">
                    <label for="type">Booking Type   :</label>
                    <select class="type" name="BookingType" required>
                            <option value="Club">Club</option>
                            <option value="Restaurant">Restaurant</option>
                    </select>

                  </div><br>
                  <div class="questions">
                      <label for="reservation1">Reservation 1 :</label>
                      <select class="" name="" required>

                      </select>
                  </div><br>
                  <div class="questions">
                        <label for="reservation2">Reservation 2 :</label>
                        <select class="" name="">

                        </select>
                  </div><br>
                  <div class="questions">
                        <label for="NoOfPeaople">No of People:</label>
                        <input type="number" name="NoOfPeaople" min="1" value="1" required>
                  </div><br>
                  <div class="questions">
                        <label for="date">Reserved Date :</label>
                        <input type="date" name="ReservedDate" min="<?php echo date("Y-m-d") ?>" value="<?php echo date("Y-m-d") ?>" required>
                  </div><br>
                  <div class="questions">
                        <label for="time">Reserved Time:</label>
                        <input type="time" name="ReservedTime" value="<?php echo date("H:i") ?>" required>

                  </div><br>
                  <div class="questions">
                        <label for="EndTime">End Time :</label>
                        <input type="time" name="EndTime" value="<?php echo date("H:i") ?>" required>

                  </div><br>
                  <div class="questions">
                        <label for="contactno">Contact No :</label>
                        <input type="tel" name="ContactNo" required>
                  </div><br>

                </div>
                <div class="line3">
                  <button type="submit" name="button" class="add"><b>Add</b> </button>
                  <button type="reset" name="button" class="add"><b>Reset</b> </button>

                </div>


            </form>
        </div>
  </body>
</html>
