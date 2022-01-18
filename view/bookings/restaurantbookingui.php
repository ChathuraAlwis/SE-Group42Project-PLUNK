<!DOCTYPE html>
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

                      </form>
                          <div class="addicon">
                                <a href="..\bookings\addbooking.php" class="add"><button type="button" name="button" class="addbtn"><b>+</b></button></a>
                          </div>
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
