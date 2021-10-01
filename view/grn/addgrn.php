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
    <div class=main>
    <div class= left>
    <div class="form">
        <h2 class="center-text"><b>Add GRN</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="add-item" type="hidden" >
                <table>
                <tr>
                <div class="form-group">
                    <td><label for="itemtype">Item Type</label></td>
                    <td></td>
                    <td><select id="itemtype" name="itemtype" class="form-control" placeholder="Enter the item type" onchange="changeType(this);">
                    <option selected>Choose type...</option>
                        <option value="fooditems">Food Items</option>
                        <option value="beverageitems">Beverage Items</option>
                     </select></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Date">Date</label></td>
                        <td></td>
                        <td><input type="date" id= "Date" name="Date" required class="form-control" placeholder="Enter the Date"/></td>
                    </div>
                </tr> 
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Company">Company</label></td>
                        <td></td>
                        <td><input type="text" id= "Company" name="Company" required class="form-control" placeholder="Enter the Company name"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
            </table>
                <div class="form-group">
                <table>
                    <tr>
                        <th>Item Name</th>
                        <th>Quantity</th>
                    </tr>
                    <tr> 
                        <td><input type="text" id= "itemname" name="itemname"  class="form-control" placeholder="Enter the item name"/></td>
                        <td><input type="number" id= "Quantity" name="Quantity"  class="form-control" placeholder="Enter the Quantity"/></td>
                    </tr>
                    <tr> 
                        <td><input type="text" id= "itemname" name="itemname"  class="form-control" placeholder="Enter the item name"/></td>
                        <td><input type="number" id= "Quantity" name="Quantity"  class="form-control" placeholder="Enter the Quantity"/></td>
                    </tr>
                    <tr> 
                        <td><input type="text" id= "itemname" name="itemname"  class="form-control" placeholder="Enter the item name"/></td>
                        <td><input type="number" id= "Quantity" name="Quantity"  class="form-control" placeholder="Enter the Quantity"/></td>
                    </tr>

                </table>
                </div>
                
            
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit">Add</button>
                    <button type="reset" name="reset" value="Reset" class="button reset">Reset</button>
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