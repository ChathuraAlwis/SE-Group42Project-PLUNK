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
    <script>
        var ans = getParameterByName('data', window.location.href);
        var id = ans.slice(-1);
        document.cookie = 'data='+id;
    </script>
    <?php 
        require_once "../../model/database.php";
        $DB = new DB;
        $id = $_COOKIE['data'];
        $query = "SELECT * FROM plunk.item WHERE ItemID=$id";
        $result = $DB->runQuery($query)[0];
        //print_r($result);
    ?>
    <div class=main>
    <div class= left>
    <div class="form">
			<h2 class="center-text"><b>ITEM DETAILS</b>
                <image src = "../images/bin.png" class="bin"></image></h2>
			
        
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
                    <td><select id="ItemType" name="ItemType" class="form-control" value = "<?php echo "$result[ItemType]";?>" onchange="changeType(this);">
                        <option selected>Choose type...</option>
                        <option value="Food">Food Items</option>
                        <option value="Beverage">Beverage Items</option>
                     </select></td>
                </div>
            </tr>
            <tr> 
                <div class="form-group">
                    <td><label for="Availability">Availability</label></td>
                    <td><select id="Availability" name="Availability" class="form-control" value = "<?php echo "$result[Availability]";?>" onchange="changeType(this);">
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
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
                <button type="submit" name="cancel" value="cancel" class="button submit"><a href="itemspage.php">Cancel</a></button>
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
