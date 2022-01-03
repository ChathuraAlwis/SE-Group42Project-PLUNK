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
                    <h2>NOTIFICATIONS</h2>
              </div>
            </div>
            <div class="covertable">
                <div class="table">
                <div clss="upperbar">
                  <form method="POST" action="notificationpage.php">
                  <input type = "hidden" class = "search" name="notificationsearch"/>
                    <div >
                              <input type = text class = "search" id="msg" name="msg" placeholder="Type the message" value="<?php if(isset($_POST['notificationsearch'])) {echo $_POST['msg'];}?>"/>
                  </div>
                  <div >
                        <select id="EventType" name="EventType" class="search" placeholder="Enter the Event type" onchange="changeType(this);">
                              <?php 
                                    if(isset($_POST['notificationsearch'])){
                                          if ($_POST['EventType']=='0'){
                                                echo '<option value="0" selected>Item Type: All</option>
                                                <option value="1">Event Type: Club</option>
                                                <option value="2">Event Type: Restaurant</option>';
                                          }elseif ($_POST['EventType']=='1') {
                                                echo '<option value="0">Event Type: All</option>
                                                <option value="1" selected>Event Type: Club</option>
                                                <option value="2">Event Type: Restaurant</option>';
                                          }else{
                                                echo '<option value="0">Event Type: All</option>
                                                <option value="1">Event Type: Club</option>
                                                <option value="2" selected>Event Type: Restaurant</option>';
                                          }
                                    }
                                    else{
                                          echo '<option value="0" selected>Event Type: All</option>
                                          <option value="1">Event Type: Club</option>
                                          <option value="2">Event Type: Restaurant</option>';
                                    }
                                    ?>
                        </select>
                  </div>
                  <div >
                              <button type = "submit" class = "search" ><b>Search</b></button>
                   </div>  
                  </form>      

                        <div class="addicon">
                              <a href="addnotifications.html" class="add"><button type="button" name="button" class="addbtn"><b>+</b></button></a>
                        </div>
                    </div>
                    <div class="detailtable">
                    <?php
                              if(isset($_POST['notificationsearch'])){
                                    echo '<iframe src="notificationtable.php?msg=' . $_POST['msg'] . '&Type='. $_POST['EventType'] .'" class="staff"></iframe>';
                              }
                              else{
                                    echo '<iframe src="notificationtable.php" class="staff"></iframe>';
                              }
                        
                        ?>
                        <!-- <iframe src="notificationtable.php" class="staff"></iframe> -->
                  </div>
                </div>

            </div>


        </div>

  </body>
</html>

