<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/crud.css">
        <script type="text/javascript" src="../script/additem.js"></script>

  </head>
  <body>
    <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $sql = "SELECT ItemID, ItemName FROM plunk.item;";
        $result = json_encode($DB->runQuery($sql));
        // print_r($result);
        // setcookie("Items", json_encode($result));
    ?>
    <div class="main">
    <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>Add item</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="add-item" type="hidden" >
                <table class="formtable">
                  <tr>
                    <div class="form-group">
                       <td><label for="ItemName">Item Name</label></td> 
                       <?php echo "<td><input onchange=itemNameCheck(". $result .") type=text id=ItemName name=ItemName required class=form-control placeholder=\"Enter the item name\" ></td>"; ?>
                    </div>
                  </tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Price">Price</label></td>
                        <td><input type="number" id="Price" name="Price" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the price"/></td>
                    </div>
                </tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Discount">Discount</label></td>
                        <td><input type="number" id="Discount" name="Discount" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the discount"/></td>
                    </div>
                </tr>
                <tr> 
                    <div class="form-group">
                        <td><label for="ItemType">Item Type</label></td>
                        <td><select id="ItemType" name="ItemType" class="form-control" placeholder="Enter the item type" >
                            <option selected>Choose type...</option>
                            <option value="Food">Food Items</option>
                            <option value="Beverage">Beverage Items</option>
                         </select></td>
                    </div>
                </tr>
                <tr> 
                    <div class="form-group">
                        <td><label for="Availability">Availability</label></td>
                        <td><select id="Availability" name="Availability" class="form-control" >
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
                        <td><input type="number" id= "Quantity "name="Quantity" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the Quantity"/></td>
                    </div>
                </tr>                
                <tr>
                    <div class="form-group">
                        <td><label for="ReorderQuantity">Reorder Quantity</label></td>
                        <td><input type="number" id ="ReorderQuantity" name="ReorderQuantity" class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the Reorder Quantity"/></td>
                    </div>
                </tr> 
                </div>
                </table>
                
                <div class="form-group">
                    <button type="submit" id="add" name="submit" value="Submit" class="button submit" disabled>Add</button>
                    <button type="reset" name="reset" value="Reset" class="button reset">Reset</button>
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
