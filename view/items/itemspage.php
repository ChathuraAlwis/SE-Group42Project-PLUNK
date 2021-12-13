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
                        <div class="upperbar">
                              <form method="POST" action="itemspage.php">
                                    <input type = "hidden" class = "search" name="itemsearch"/>
                                    <div >
                                          <input type = "text" id= "ItemName" name= "ItemName" class = "search" placeholder="Search By Item Name" value="<?php if(isset($_POST['itemsearch'])) {echo $_POST['ItemName'];}?>" />
                                    </div>
                                    <div >
                                          <select id="ItemType" name="ItemType" class="search" placeholder="Enter the item type" onchange="changeType(this);">
                                                <?php 
                                                      if(isset($_POST['itemsearch'])){
                                                            if ($_POST['ItemType']=='0'){
                                                                  echo '<option value="0" selected>Item Type: All</option>
                                                                  <option value="1">Item Type: Food Items</option>
                                                                  <option value="2">Item Type: Beverage Items</option>';
                                                            }elseif ($_POST['ItemType']=='1') {
                                                                  echo '<option value="0">Item Type: All</option>
                                                                  <option value="1" selected>Item Type: Food Items</option>
                                                                  <option value="2">Item Type: Beverage Items</option>';
                                                            }else{
                                                                  echo '<option value="0">Item Type: All</option>
                                                                  <option value="1">Item Type: Food Items</option>
                                                                  <option value="2" selected>Item Type: Beverage Items</option>';
                                                            }
                                                      }
                                                      else{
                                                            echo '<option value="0" selected>Item Type: All</option>
                                                            <option value="1">Item Type: Food Items</option>
                                                            <option value="2">Item Type: Beverage Items</option>';
                                                      }
                                                      ?>
                                          </select>
                                    </div>
                                    <div >
                                          <button type = "submit" class = "search" ><b>Search</b></button>
                                    </div>
                              </form>
                              <?php
                                    if ($_SESSION['UserType']=='Restaurant Manager'){
                                          echo "<div class=\"addicon\">
                                                      <a href=\"../items/additems.php\" class=\"add\"><button type=\"button\" name=\"button\" class=\"addbtn\"><b>+</b></button></a>
                                                </div>";
                                    }               
                              ?>
                        </div>
                        <div class="detailtable">
                              <?php 
                                    if(isset($_POST['itemsearch'])){
                                          echo '<iframe src="itemtable.php?name=' . $_POST['ItemName'] . '&type='. $_POST['ItemType'] .'" class="staff"></iframe>';
                                    }
                                    else{
                                          echo '<iframe src="itemtable.php" class="staff"></iframe>';
                                    }
                              ?>
                        </div>
                  </div>
            </div>
      </div>
</body>
</html>

