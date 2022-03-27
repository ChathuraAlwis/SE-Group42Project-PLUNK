<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="../style/stafftable.css">

  </head>
  <body>
        <div class="main" >
            <div class="coverheader">

              <div class="tableheader">
                    <div class="innerdiv">
                    </div>
                    <h2>Join Requests</h2>
              </div>
            </div>
            <div class="covertable">
                <div class="table">
                    <div class="upperbar">
                      <form class="searchbar" action="JoinRequests.php" method="post">
                        <!-- <input type="hidden" name="clubsearch" > -->
                        <input type="text" id="clubsearch" name="clubsearch" class="search" placeholder="Search By Name" value="<?php if(isset($_POST['clubsearch'])) { echo "$_POST[clubsearch]"; } ?>" required>

                              <button type = "submit" class = "searchbtn" ><b>Search</b></button>

                      </form>
                          <!-- <input type="text" name="search" class="search" placeholder="Search..." > -->
                          <div class="addicon2">
                                <a href="mail.php" class="add"><button type="button" name="button" class="addbtn"><b><i class="material-icons">&#xe158;</i></b></button></a>
                          </div>

                    </div>
                    <div class="detailtable">
                      <?php
                        if(isset($_POST['clubsearch'])){
                          echo'<iframe src="requeststable.php?Name='.$_POST['clubsearch'].'" name="searchinfo" class="staff"></iframe>';
                        }
                        else{
                          echo '<iframe src="requeststable.php" name="searchinfo" class="staff"></iframe>';
                        }
                      ?>
                            <!-- <iframe src="requeststable.php" class="staff"></iframe> -->
                    </div>

                </div>

            </div>


        </div>

  </body>
</html>
