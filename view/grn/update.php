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
        $query = "SELECT GRNID, ItemType,Date,Company FROM plunk.grn WHERE GRNID=$id";
        $result = $DB->runQuery($query)[0];
    ?>

    <div class=main>
    <div class= left>
    <div class="form">
        <h2 class="center-text"><b>GRN DETAILS</b><button link="returngrn.php" class="return"><image src = "../images/return.png" class="bin"></image></button></h2>
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
                    <td><select id="ItemType" name="ItemType" class="form-control" value = "<?php echo "$result[ItemType]";?>" onchange="changeType(this);">
                    <option selected>Choose type...</option>
                        <option value="fooditems">Food Items</option>
                        <option value="beverageitems">Beverage Items</option>
                     </select></td>
                    </div>
                </tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Date">Date</label></td>
                        <td><input type="date" id= "Date" name="Date" required class="form-control" value = "<?php echo "$result[Date]";?>"/></td>
                    </div>
                </tr> 
                <tr>
                    <div class="form-group">
                        <td><label for="Company">Company</label></td>
                        <td><input type="text" id= "Company" name="Company" required class="form-control" value = "<?php echo "$result[Company]";?>"/></td>
                    </div>
                </tr>
                
             </table>
            <div class="form-group">
            <div id="myform" onload="load()"> 
                    <b>Enter the item details of the GRN...</b> 
                    <br/><br/> 
                            Item Name:<input type=text id="ItemName"> 
                    <br/><br/> 
                            Quantity :&nbsp; 
                            <input type=number id="Quantity" min=0 oninput="validity.valid||(value='');"> 
                    <br/> 
                            <input type="submit" id="add" value="Add" onclick="addRow()" > 
                    </div> 
                    <br/>
                    <div id="mydata"> 
                    <b>Item Details...</b><br> 
                    <table id="myTableData"  class="addrowtable" > 
                        <tr> 
                            <td>&nbsp;</td> 
                            <td><b>Item Name</b></td> 
                            <td><b>Quantity</b></td> 
                        </tr> 
                    </table> 

                      
                    </div> 
                </div>
            
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit">Update</button>
                    <button type="submit" name="cancel" value="cancel" class="button submit"><a href="grntable.php">Cancel</a></button>
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
