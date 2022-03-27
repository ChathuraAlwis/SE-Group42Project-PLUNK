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
  <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $id = explode("=", $_GET['data'])[1];
    ?>
        <div class="main" >
            <div class="coverheader">

              <div class="tableheader">
                    <div class="innerdiv">
                    </div>
                    <h2>Service Charge Sheet</h2>
              </div>
            </div>
            <div class="covertable">
                <div class="table">
                    <div class="upperbar">
                    <!-- <div >
                              <input type = "text" class = "search" placeholder="Enter the serviceCharge"/>
                  </div>
                    <div >
                              <button type = "submit" class = "search" ><b>Search</b></button>
                        </div> -->
                          <div class="addicon">
                                <a href="add.php ?id=<?php echo $id;?>" class="add"><button type="button" name="button" class="addbtn"><b>+</b></button></a>
                          </div>
                    </div>
                    <div class="detailtable">

                            <iframe src="allservicecharge.php?id=<?php echo $id;?>" class="staff"></iframe>
                    </div>

                </div>

            </div>


        </div>

  </body>
</html>
