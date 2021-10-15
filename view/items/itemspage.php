<?php session_start(); ?>
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
                    <h2>ITEMS</h2>
              </div>
            </div>
            <div class="covertable">
                <div class="table">
                    <div>
                    <input type = "hidden" class = "search" value="search-item"/>
                    <div >
                              <input type = "text" id= "ItemID" name= "ItemID" class = "search" placeholder="Enter the item name" />
                  </div>
                    <div >
                              <button type = "submit" class = "search" ><a href= "#" ><b>Search</b></a></button>
                        </div>
                        <div >
                              <select id="ItemType" name="ItemType" class="search" placeholder="Enter the item type" onchange="changeType(this);">
                                    <option selected>Choose item type...</option>
                                    <option value="Food">Food Items</option>
                                    <option value="Beverage">Beverage Items</option>
                              </select>
                        </div>   
                        <?php
                              if ($_SESSION['UserType']=='Restaurant Manager'){
                                    echo "<div class=\"addicon\">
                                                <a href=\"../items/additems.php\" class=\"add\"><button type=\"button\" name=\"button\" class=\"addbtn\"><b>+</b></button></a>
                                          </div>";
                              }               
                        ?>
                    </div>
                    <div class="detailtable">

                        <iframe src="itemtable.php" class="staff"></iframe>
                  </div>
                </div>

            </div>


        </div>

  </body>
</html>

