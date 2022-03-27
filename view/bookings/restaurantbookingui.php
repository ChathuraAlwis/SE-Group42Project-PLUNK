<!DOCTYPE html>
<?php session_start();
date_default_timezone_set("Asia/Kolkata");?>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/bookingui.css">

  </head>
  <body>
        <div class="main" >
            <div class="coverheader">

              <div class="tableheader">
                    <div class="innerdiv">
                    </div>
                    <h2>Restaurant Bookings</h2>
              </div>
            </div>
            <div class="covertable">
                <div class="table">
                    <div class="upperbar">
                      <form class="searchbar" action="restaurantbookingui.php" method="post">
                        <!-- <input type="hidden" name="clubsearch" > -->
                        <input type="text" id="restaurantsearch" name="restaurantsearch" class="search" placeholder="Search By Customer Name" value="<?php if(isset($_POST['restaurantsearch'])) { echo "$_POST[restaurantsearch]"; } ?>" required>

                              <button type = "submit" class = "searchbtn" ><b>Search</b></button>

                              <?php //in this , check the user type .
                              if($_SESSION['UserType'] == 'Manager'){?>
                              <button type="button" name="history" class="history" ><a href="..\bookings\resbookinghistory.php" class="hislink" ><b>History</b><a></button>
                              <?php }
                                else {?>
                                  <button type="button" name="history" class="history" ><a href="..\bookings\resbookinghistory.php" class="hislink" ><b>My Bookings</b><a></button>
                                    <?php } ?>

                      </form>
                          <div class="addicon">

                                <?php //in this , check the user type and check the unpaid bookings.
                                if($_SESSION['UserType'] == 'Manager'){?>
                                    <a href="..\bookings\addbooking.php" class="add"><button type="button" name="button" class="addbtn"> <b>+</b></button></a>
                                  <?php }
                                else if($_SESSION['UserType'] == 'Accountant'){
                                  ?>
                                  <form class="" action="restaurantbookingui.php" method="post">

                                  
                                 <?php //if member has unpaid bookings, he can not add new booking until payment will complete
                                 require_once "..\..\model\database.php";
                                 require_once "..\..\controller\pages.php";

                                 if (isset($_POST['check'])) {
                                   $DB = new DB;
                                 $notpaid="SELECT BookingID FROM plunk.booking WHERE BookingType ='Restaurant' AND Payment='No'";
                                 $paidslot=$DB->runQuery($notpaid);
                                 $nonotpaid= count($paidslot);

                                 }
                                }
                                    else {?>
                                      <form class="" action="restaurantbookingui.php" method="post">

                                       <a href="#" class="add"><button type="input" name="check" class="addbtn"> <b>+</b></button></a> </form>
                                      <?php //if member has unpaid bookings, he can not add new booking until payment will complete
                                      require_once "..\..\model\database.php";
                                      require_once "..\..\controller\pages.php";

                                      if (isset($_POST['check'])) {
                                        $DB = new DB;
                                      $notpaid="SELECT BookingID FROM plunk.booking WHERE BookingType ='Restaurant' AND Payment='No'AND UserID= '$_SESSION[UserID]'";
                                      $paidslot=$DB->runQuery($notpaid);
                                      $nonotpaid= count($paidslot);

                                      if ($nonotpaid>=1) {
                                        $newPage = new Page('..\bookings\member\notpaidwarningres.html');
                                        $newPage->show();
                                      }
                                      else {
                                        $newPage = new Page('..\bookings\addbooking.php');
                                        $newPage->show();

                                     }}
                                    } ?>
                          </div>
                          <?php //in this , check the user type .
                          if($_SESSION['UserType'] == 'Manager'){?>
                          <div class="confimationdiv">
                            <button type="button" name="history" class="typebtn" ><a href="restaurentconfrimedbooking.php" class="hislink" ><b>Confirmed</b><a></button>

                            <button type="button" name="history" class="typebtn2" ><a href="deniedrestaurant.php" class="hislink" ><b>Denied</b><a></button>

                            <button type="button" name="history" class="typebtn3" ><a href="nodecisionrestaurant.php" class="hislink" ><b>No Decision</b><a></button>
                          </div><?php } ?>
                    </div>
                    <div class="detailtable">
                      <?php
                        if(isset($_POST['restaurantsearch'])){
                          echo'<iframe src="restaurantbookingtable.php?CustomerName='.$_POST['restaurantsearch'].'" name="searchinfo" class="staff"></iframe>';
                        }
                        else{
                          echo '<iframe src="restaurantbookingtable.php" name="searchinfo" class="staff"></iframe>';
                        }
                      ?>
                            <!-- echo'<iframe src="restaurantbookingtable.php?CustomerName='.$_POST['CustomerName'].'" name="searchinfo" class="staff"></iframe>' -->
                    </div>

                </div>

            </div>


        </div>

  </body>
</html>
