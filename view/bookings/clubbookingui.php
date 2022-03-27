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
                    <h2>Club and cricket Bookings</h2>
              </div>
            </div><br>
            <div class="covertable">
                <div class="table">
                    <div class="upperbar">

                        <form class="searchbar" action="clubbookingui.php" method="post">
                          <!-- <input type="hidden" name="clubsearch" > -->
                          <input type="text" id="clubsearch" name="clubsearch" class="search" placeholder="Search By Customer Name" value="<?php if(isset($_POST['clubsearch'])) { echo "$_POST[clubsearch]"; } ?>" required>

                                <button type = "submit" class = "searchbtn" ><b>Search</b></button>

                                <?php
                                    if ($_SESSION['UserType']!='Accountant'){
                                      echo "<button type=\"button\" name=\"history\" class=\"history\" ><a href=\"../bookings/bookinghistory.php\" class=\"hislink\" ><b>History</b><a></button>";
                                    }
                                ?>
                        </form>

                          <div class="addicon">

                            <?php //in this , check the user type and check the unpaid bookings.
                            if($_SESSION['UserType'] == 'Manager'){?>
                                <a href="..\bookings\addcricketbooking.php" class="add"><button type="button" name="button" class="addbtn"> <b>+</b></button></a>
                              <?php }
                            else if($_SESSION['UserType'] == 'Accountant'){
                                  ?>
                                  <form class="" action="clubbookingui.php" method="post">

                                  
                                 <?php //if member has unpaid bookings, he can not add new booking until payment will complete
                                 require_once "..\..\model\database.php";
                                 require_once "..\..\controller\pages.php";

                                 if (isset($_POST['check'])) {
                                   $DB = new DB;
                                 $notpaid="SELECT BookingID FROM plunk.booking WHERE BookingType ='Club' AND Payment='No'";
                                 $paidslot=$DB->runQuery($notpaid);
                                 $nonotpaid= count($paidslot);

                                 }
                                }
                                else {?>
                                  <form class="" action="clubbookingui.php" method="post">

                                   <a href="#" class="add"><button type="input" name="check" class="addbtn"> <b>+</b></button></a>
                                 </form>
                                  <?php //if member has unpaid bookings, he can not add new booking until payment will complete
                                  require_once "..\..\model\database.php";
                                  require_once "..\..\controller\pages.php";
                                  if (isset($_POST['check'])) {
                                    $DB = new DB;
                                  $notpaid="SELECT BookingID FROM plunk.booking WHERE BookingType ='Club' AND Payment='No'AND UserID= '$_SESSION[UserID]'";
                                  $paidslot=$DB->runQuery($notpaid);
                                  $nonotpaid= count($paidslot);

                                  if ($nonotpaid>=1) {
                                    $newPage = new Page('..\bookings\member\notpaidwarningclub.html');
                                    $newPage->show();
                                  }
                                  else {
                                    $newPage = new Page('..\bookings\addcricketbooking.php');
                                    $newPage->show();

                                 }}
                                } ?>
                          </div>
                    </div>
                    <div class="detailtable">
                      <?php
                        if(isset($_POST['clubsearch'])){
                          echo'<iframe src="gmclubbookingtable.php?CustomerName='.$_POST['clubsearch'].'" name="searchinfo" class="staff"></iframe>';
                        }
                        else{
                          echo '<iframe src="gmclubbookingtable.php" name="searchinfo" class="staff"></iframe>';
                        }
                      ?>
                            <!-- <iframe src="..\bookings\gmclubbookingtable.php" class="staff"></iframe> -->
                    </div>

                </div>

            </div>


        </div>

  </body>
</html>
