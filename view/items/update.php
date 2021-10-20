<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/crud.css">
        <script type="text/javascript" src="../script/additem.js"></script>
        <script type="text/javascript" src="../script/updatedata.js"></script>

  </head>
  <body>
  <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $id = explode("=", $_GET['data'])[1];
        $query = "SELECT * FROM plunk.item WHERE ItemID=$id";
        $result = $DB->runQuery($query)[0];
    ?>

    <div class=main>
    <div class= left>
    <div class="form">
			<h2 class="center-text"><b>ITEM DETAILS</b>
                <a href="deleteitemsuccess.html"><image src = "../images/bin.png" class="bin"></image></a></h2>
			
        
        <form action="../../controller/CRUD.php" method="POST">
            <input name ="update-item" type="hidden" >
            <table class="formtable">
            <tr>
                <div class="form-group">
                   <td><label for="ItemID">Item ID</label></td> 
                    <td><input type="number" id= "ItemID" name="ItemID" required class="form-control" value = "<?php echo "$result[ItemID]";?>"/></td>
                </div>
              </tr>
            
            <tr>
                <div class="form-group">
                   <td><label for="ItemName">Item Name</label></td> 
                    <td><input type="text" id= "ItemName" name="ItemName" required class="form-control" value = "<?php echo "$result[ItemName]";?>"/></td>
                </div>
              </tr>
              <tr>
                <div class="form-group">
                    <td><label for="ItemCost">Item Cost</label></td>
                    <td><input type="number" id="ItemCost" name="ItemCost" class="form-control" min=0 oninput="validity.valid||(value='');" value = "<?php echo "$result[ItemCost]";?>" /></td>
                </div>
            </tr>
            <tr>
                <div class="form-group">
                    <td><label for="Price">Price</label></td>
                    <td><input type="number" id="Price" name="Price" required class="form-control" min=0 oninput="validity.valid||(value='');" value = "<?php echo "$result[Price]";?>" /></td>
                </div>
            </tr>
            <tr>
                <div class="form-group">
                    <td><label for="Discount">Discount</label></td>
                    <td><input type="number" id="Discount" name="Discount" required class="form-control" min=0 oninput="validity.valid||(value='');" value = "<?php echo "$result[Discount]";?>" /></td>
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
                    <td><label for="Availability">Availability</label></td>
                    <td><select id="Availability" name="Availability" class="form-control"  onchange="changeType(this);">
                            <option value="Yes"  <?php if("$result[Availability]"=="Yes") echo 'selected="selected"'; ?>>Yes</option>
                            <option value="No"  <?php if("$result[Availability]"=="No") echo 'selected="selected"'; ?>>No</option>
                        </select>
                    </td>
                </div>
            </tr> 
            
            <div id = Quantity>
            <tr>
                
                <div class="form-group">
                    <td><label for="Quantity">Quantity</label></td>
                    <td><input type="number" id= "Quantity "name="Quantity" required class="form-control" min=0 oninput="validity.valid||(value='');" value = "<?php echo "$result[Quantity]";?>" /></td>
                </div>
            </tr>
        
            <tr>
                <div class="form-group">
                    <td><label for="ReorderQuantity">Reorder Quantity</label></td>
                    <td><input type="number" id ="ReorderQuantity" name="ReorderQuantity" class="form-control" min=0 oninput="validity.valid||(value='');" value = "<?php echo "$result[ReorderQuantity]";?>" /></td>
                </div>
            </tr> 
            </div>
            </table>
            
            <div class="form-group">
                <button type="submit" name="submit" value="Submit" class="button submit" >Update</button>
                <button type="back" name="cancel" value="cancel" class="button submit"><a class="cancel" href="itemspage.php">Cancel</a></button>
            </div>
    </form>                
    </div>
</div>
<div class= right>
        <div class="righttable">
        <div class="itemtable">
            <h3>ITEMS TABLE</h3>
            <iframe src="itemtable.php" class="item"></iframe>
        </div>
</div>
</div>
</div>
     
  </body>

 
</html>
