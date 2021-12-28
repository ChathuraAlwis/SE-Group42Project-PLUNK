<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/crud.css">
        <script type="text/javascript" src="../script/addrow.js"></script>

  </head>
  <body>
  <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $id = explode("=", $_GET['data'])[1];
        $query = "SELECT * FROM plunk.grn WHERE GRNID=$id";
        $result = $DB->runQuery($query)[0];
        
    ?>

    <div class=main>
    <div class= left>
    <div class="form">
        <h2 class="center-text"><b>GRN DETAILS</b><button  class="return"><a href= "returngrn.php?<?php echo 'GRNID='.$result['GRNID'];?>"><image src = "../images/return.png"  class="bin"></image></a></button></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="update-grn" type="hidden" >
                <table class="formtable">
                <tr>
                    <div class="form-group">
                        <td><label for="GRNID">GRNID</label></td>
                        <td><input type="text" id= "GRNID" name="GRNID" required class="form-control" value = "<?php echo "$result[GRNID]";?>"/></td>
                    </div>
                </tr>     
                <tr>
                <div class="form-group">
                    <td><label for="ItemType">Item Type</label></td>
                    <td><select id="ItemType" name="ItemType" class="form-control"  onchange="changeType(this);">
                        <option selected>Choose type...</option>
                        <option value="Food"  <?php if("$result[ItemType]"=="Food") echo 'selected="selected"'; ?> >Food Items</option>
                        <option value="Beverage"  <?php if("$result[ItemType]"=="Beverage") echo 'selected="selected"'; ?> >Beverage Items</option>
                     </select></td>
                </div>
                </tr>
                <tr>
                    <div class="form-group">
                        <td><label for="AddDate">Date</label></td>
                        <td><input type="date" id= "AddDate" name="AddDate" required class="form-control" value = "<?php echo "$result[AddDate]";?>"/></td>
                    </div>
                </tr> 
                <tr>
                    <div class="form-group">
                        <td><label for="CompanyName">Company</label></td>
                        <td><input type="text" id= "CompanyName" name="CompanyName" required class="form-control" value = "<?php echo "$result[CompanyName]";?>"/></td>
                    </div>
                </tr>
                
             </table>
             <div class="forminputs">
                  <?php
                      require_once "..\..\controller\showtable.php";
                      $orderTable = new Table("grnitem");
                      $orderTable->show("SELECT * FROM plunk.grnitem WHERE GRNID in ('$result[GRNID]')", 'update');
                   ?>
                </div><br>
            
                <div class="form-group">
                    <!-- <button type="submit" name="submit" value="Submit" class="button submit"><a class="cancel" href="updategrnsuccess.html">Update</a></button> -->
                    <button type="submit" name="cancel" value="cancel" class="button submit"><a class="cancel" href="grnpage.php">Cancel</a></button>
                </div>
        </form>        
    </div>
    </div>
    <div class= right>
      <div class = "righttop">
        <div class="itemtable">
            <h4>GRN TABLE</h4>
            <iframe src="grntable.php" class="item"></iframe>
        </div>
        
       </div>
        <div class = "rightbottom">
            <div class="itemtable">
                <h4>ITEMS TABLE</h4>
                <iframe src="../items/itemtable.php" class="item"></iframe>
            </div>  
        </div>
    </div>
    </div>
  </body>

 
</html>
