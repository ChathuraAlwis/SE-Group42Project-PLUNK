<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/stafftable.css">

  </head>
  <body>
        <div class="main" >
            <div class="coverheader">

              <div class="tableheader">
                    <div class="innerdiv">
                    </div>
                    <h2>Booking Menu</h2>
              </div>
            </div>
            <div class="covertable">
                <div class="table">
                  <div clss="upperbar">
                  <form method="POST" action="reservationmenupage.php">
                  <input type = "hidden" class = "search" name="reservationsearch"/>
                    <div >
                              <input type = text class = "search" id="ReservationName" name="ReservationName" placeholder="Enter the reservation name" value="<?php if(isset($_POST['reservationsearch'])) {echo $_POST['ReservationName'];}?>"/>
                  </div>
                  <div >
                        <select id="Type" name="Type" class="search" placeholder="Enter the Place type" onchange="changeType(this);">
                              <?php 
                                    if(isset($_POST['reservationsearch'])){
                                          if ($_POST['Type']=='0'){
                                                echo '<option value="0" selected>Item Type: All</option>
                                                <option value="1">Place Type: Club</option>
                                                <option value="2">Place Type: Restaurant</option>';
                                          }elseif ($_POST['Type']=='1') {
                                                echo '<option value="0">Place Type: All</option>
                                                <option value="1" selected>Place Type: Club</option>
                                                <option value="2">Place Type: Restaurant</option>';
                                          }else{
                                                echo '<option value="0">Place Type: All</option>
                                                <option value="1">Place Type: Club</option>
                                                <option value="2" selected>Place Type: Restaurant</option>';
                                          }
                                    }
                                    else{
                                          echo '<option value="0" selected>Place Type: All</option>
                                          <option value="1">Place Type: Club</option>
                                          <option value="2">Place Type: Restaurant</option>';
                                    }
                                    ?>
                        </select>
                  </div>
                  <div >
                              <button type = "submit" class = "search" ><b>Search</b></button>
                   </div>  
                  </form>              
                        <div class="addicon">
                              <a href="addreservation.php" class="add"><button type="button" name="button" class="addbtn"><b>+</b></button></a>
                        </div>
                    </div>
                    <div class="detailtable">
                    <?php
                              if(isset($_POST['reservationsearch'])){
                                    echo '<iframe src="Reservationmenutable.php?name=' . $_POST['ReservationName'] . '&type='. $_POST['Type'] .'" class="staff"></iframe>';
                              }
                              else{
                                    echo '<iframe src="Reservationmenutable.php" class="staff"></iframe>';
                              }
                        
                        ?>

                        <!-- <iframe src="Reservationmenutable.php" class="staff"></iframe> -->
                  </div>
                </div>

            </div>


        </div>

  </body>
</html>

