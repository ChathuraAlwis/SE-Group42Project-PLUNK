<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/crud.css">
        <script type="text/javascript" src="../script/addrow.js"></script>
        <script type="text/javascript" src="../script/maxQuantity.js"></script>
        <script type="text/javascript" src="../script/rowCount.js"></script>
  </head>
  <body>
  <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $sql = "SELECT ItemID, ItemName, Quantity FROM plunk.item;";
        $result = json_encode($DB->runQuery($sql));
        // setcookie("Items", json_encode($result));
    ?>
    <div class=main>
    <div class= left>
    <div class="form">
        <h2 class="center-text"><b>Add GRN</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="add-grn" type="hidden" >
                <table class="formtable">
                <tr>
                <div class="form-group">
                    <td><label for="ItemType">Item Type</label></td>
                    <td><select id="ItemType" name="ItemType" class="form-control" placeholder="Enter the item type" onchange="changeType(this);">
                    <option selected>Choose type...</option>
                        <option value="Food">Food Items</option>
                        <option value="Beverage">Beverage Items</option>
                     </select></td>
                    </div>
                </tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Date">Date</label></td>
                        <td><input type="date" id= "Date" name="Date" required class="form-control" placeholder="Enter the Date"/></td>
                    </div>
                </tr> 
                <tr>
                    <div class="form-group">
                        <td><label for="Company">Company</label></td>
                        <td><input type="text" id= "Company" name="Company" required class="form-control" placeholder="Enter the Company name"/></td>
                    </div>
                </tr>
                
             </table>
            <div class="form-group">
            <div id="myform" onload="load()"> 
                    <b>Enter the item details of the GRN...</b> 
                    <br/><br/> 
                            Item ID:
                            <?php 
                                echo "<td><input type=text id=ItemID onchange=maxQuantity(". $result .",0".")></td>";
                                    
                            ?> 
                    <br/><br/> 
                            Quantity :&nbsp; 
                            <input type=number id="Quantity" min=1 oninput="validity.valid||(value='');"> 
                    <br/> 
                    <?php
                        echo "<td><input type=button id=add value=Add onclick=addRowGRN(" . $result . ") disabled></td>";
                    ?>
                    </div> 
                    <br/>
                    <div id="mydata"> 
                    <b>Item Details...</b><br> 
                    <table id="myTableData"  class="addrowtable" > 
                        <tr> 
                            <td><b>Item ID</b></td> 
                            <td><b>Item Name</b></td> 
                            <td><b>Quantity</b></td> 
                            <td>&nbsp;</td> 
                        </tr> 
                    </table> 

                      
                    </div> 
                </div>
            
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit"><a class="cancel" href="addgrnsuccess.html">Add</button>
                    <button type="reset" name="reset" value="Reset" class="button reset">Reset</button>
                </div>
        </form>        
    </div>
    </div>
    <div class= right>
      <div class = "righttop">
        <div class="itemtable">
            <h4>Company Details</h4>
            <iframe src="../company/companytable.php" class="item"></iframe>
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
  <?php echo "<script>maxQuantity(1,0)</script>"; ?>

 
</html>
