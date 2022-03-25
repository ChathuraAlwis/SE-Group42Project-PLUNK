<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/feedback.css">

  </head>
  <body>
        <div class="main" >
            <div class="coverheader">

              <div class="tableheader">
                    <div class="innerdiv">
                    </div>
                    <h2>Feedback</h2>
              </div>
            </div>
            <div class="covertable">
                <div class="table">
                    <div class="upperbar">

                          <form class="searchbar" action="reply.php" method="post">
                            <!-- <input type="hidden" name="clubsearch" > -->
                            <input type="text" id="clubsearch" name="feedbacksearch" class="search" placeholder="Search By Customer ID" value="<?php if(isset($_POST['feedbacksearch'])) { echo "$_POST[feedbacksearch]"; } ?>" >

                                  <button type = "submit" class = "searchbtn" ><b>Search</b></button>
                                  <button type="submit" name="history" class="history" ><b>History</b></button>
                          </form>

                    </div>
                    <div class="detailtable">

                            <?php
                              if(isset($_POST['feedbacksearch'])){
                                echo'<iframe src="feedbacktable.php?UserID='.$_POST['feedbacksearch'].'" name="searchinfo" class="staff"></iframe>';
                              }
                              elseif (isset($_POST['history'])) {
                                echo '<iframe src="feedbacktable.php" name="searchinfo" class="staff"></iframe>';
                              }
                              else{
                                echo '<iframe src="feedbacktable.php" name="searchinfo" class="staff"></iframe>';
                              }
                            ?>
                    </div>

                </div>

            </div>

        </div>

  </body>
</html>
