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
                    <h2>GRN</h2>
              </div>
            </div>
            <div class="covertable">
                <div class="table">
                    <div class="upperbar">
                    <form method="POST" action="grnpage.php">
                    <input type = "hidden" class = "search" name="companysearch"/>
                    <div >
                              <input type = "text" class = "search" id="CompanyName" name="CompanyName" placeholder="Enter the Company name" value="<?php if(isset($_POST['companysearch'])) {echo $_POST['CompanyName'];}?>" />
                  </div>
                  <div >
                        <select id="ItemType" name="ItemType" class="search" placeholder="Enter the item type" onchange="changeType(this);">
                              <?php 
                                    if(isset($_POST['companysearch'])){
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
                        <div class="addicon">
                              <a href="../grn/addgrn.php" class="add"><button type="button" name="button" class="addbtn"><b>+</b></button></a>
                        </div>
                    </div>
                    <div class="detailtable">
                        <?php
                              if(isset($_POST['companysearch'])){
                                    echo '<iframe src="grntable.php?name=' . $_POST['CompanyName'] . '&type='. $_POST['ItemType'] .'" class="staff"></iframe>';
                              }
                              else{
                                    echo '<iframe src="grntable.php" class="staff"></iframe>';
                              }
                        
                        ?>
                        
                  </div>    

                </div>

            </div>


        </div>

  </body>
</html>


