<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="icon" href="../images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="..\style\holidays.css">

  </head>
  <body>
    <?php

    session_start();
    require "../../model/database.php";
    $DB = new DB;
    $query = "SELECT * FROM plunk.user WHERE UserID=$_SESSION[UserID]";
    $result = $DB->runQuery($query)[0];


      date_default_timezone_set("Asia/Kolkata");
     ?>

        <div class="main" >
            <div class="header">
              <div class="upperrow"></div>
              <h2>Holidays</h2>

            </div><br>
            <form class="addholiday" action="..\..\controller\CRUD.php" method="post" autocomplete="on" >
              <!-- <input type="hidden" name="holidays"> -->

              <div class="submain">
                <div class="questions">

                        <label for="HolidayID">Holiday ID :</label>
                        <input type="number" name="HolidayID" id="ID"  readonly>

                </div><br>

                <div class="questions">

                        <label for="DecidedDate">Today :</label>
                        <input type="date" name="DecidedDate" id="today" value="<?php echo date("Y-m-d") ?>" readonly>

                </div><br>
                <div class="questions">
                      <label for="holiday">Holiday :</label>
                      <input type="date" name="Holiday" id="Holiday" min="<?php echo date("Y-m-d") ?>" value="<?php echo date("Y-m-d") ?>" required>
                </div><br>
                <?php if($_SESSION['UserType']== 'Manager'){?>
                <div class="questions">
                  <label for="type">Booking Type   :</label>
                  <select class=" type" id="Type" name="Type">
                    <option value="Restaurant">Restaurant</option>
                    <option value="Club">Club</option>
                    <option value="Restaurant and Club">Restaurant and Club</option>

                  </select>

                </div><br> <?php }else{ ?>
                  <div class="questions">
                      <label for="type">Booking Type   :</label>
                      <select class=" type" id="Type" name="Type">
                        <option value="Restaurant">Restaurant</option>

                      </select>
                  </div><br><?php } ?>

                  <div class="questions">
                      <label for="reason">Reason :</label>
                      <input type="text" name="Reason" id="Reason" required>
                  </div><br>

                </div><br>
                <div class="line3">
                  <button type="submit" name="addholiday" class="add" ><b>Add</b> </button>
                  <button type="submit" name="updateholiday" class="add" ><b>Update</b> </button>
                  <button type="submit" name="deleteholiday" id="delete" class="add" ><b>Delete</b> </button>


                </div>


            </form>
            <div class="holidaytable">
              <h3 class="ReservationMenu">Restaurant Holidays</h3>
              <table id="table1" >
                <tr>
                  <th>Holiday ID</th>
                  <th>Date</th>
                  <th>Type</th>
                  <th>Reason</th>

                </tr>

              <?php
              require '..\..\model\bookingdatabaseconnection.php';
              $today= date("Y-m-d");
              $days = mysqli_query($conn,"SELECT * FROM plunk.holidays WHERE Type ='Restaurant'or Type ='Restaurant and Club' AND Holiday>=$today ");
              while($data = mysqli_fetch_array($days))
              {
              ?>
                <tr>
                  <td><?php echo $data['HolidayID']; ?></td>
                  <td><?php echo $data['Holiday']; ?></td>
                  <td><?php echo $data['Type']; ?></td>
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
                                       document.getElementById("ID").value = this.cells[0].innerHTML;
                                       document.getElementById("Holiday").value = this.cells[1].innerHTML;
                                       document.getElementById("Type").value = this.cells[2].innerHTML;
                                       document.getElementById("Reason").value = this.cells[3].innerHTML;
                                  };
                              }

                       </script>


            </div>
            <br>
            <?php if ($_SESSION['UserType']== 'Manager') { ?>


            <div class="holidaytable">
              <h3 class="ReservationMenu">Cricket Club Holidays</h3>
              <table id="table2" >
                <tr>
                  <th>Holiday ID</th>
                  <th>Date</th>
                  <th>Type</th>
                  <th>Reason</th>

                </tr>

              <?php

              require '..\..\model\bookingdatabaseconnection.php';
              $today= date("Y-m-d");
              $days = mysqli_query($conn,"SELECT * FROM plunk.holidays WHERE Type ='Club' or Type ='Restaurant and Club'  AND Holiday>=$today ");
              while($data = mysqli_fetch_array($days))
              {
              ?>
                <tr>
                  <td><?php echo $data['HolidayID']; ?></td>
                  <td><?php echo $data['Holiday']; ?></td>
                  <td><?php echo $data['Type']; ?></td>
                  <td><?php echo $data['Reason']; ?></td>

                </tr>
              <?php
              }
              ?>
              </table>

              <?php mysqli_close($conn); // Close connection ?>
              <script>

                              var table = document.getElementById('table2');

                              for(var i = 1; i < table.rows.length; i++)
                              {
                                  table.rows[i].onclick = function()
                                  {
                                       //rIndex = this.rowIndex;
                                       document.getElementById("ID").value = this.cells[0].innerHTML;
                                       document.getElementById("Holiday").value = this.cells[1].innerHTML;
                                       document.getElementById("Type").value = this.cells[2].innerHTML;
                                       document.getElementById("Reason").value = this.cells[3].innerHTML;
                                  };
                              }

                       </script>


            </div> <?php } ?>

        </div>


  </body>
</html>
