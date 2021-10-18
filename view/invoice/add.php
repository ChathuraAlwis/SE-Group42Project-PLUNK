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
        $sql = "SELECT ItemID, Quantity, Price, Discount FROM plunk.item;";
        $result = $DB->runQuery($sql);
        setcookie("Items", json_encode($result));
    ?>
    <div class="main">
    <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>Add Invoice</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="add-invoice" type="hidden" >
                <table>
                    <tr>
                        <div class="form-group">
                            <td><label for="Companyname">Company Name</label></td>
                            <td></td>
                            <td><input type="text" id= "Companyname" name="Companyname" required class="form-control" placeholder="Enter the company name"/></td>
                        </div>
                    </tr>
                <tr>
                <div class="form-group">
                    <td><label for="Type">Item Type</label></td>
                    <td></td>
                    <td><select id="Type" name="Type" class="form-control" placeholder="Enter the type" onchange="changeType(this);">
                    <option selected>Choose type...</option>
                        <option value="1">Beverage Items</option>
                        <option value="2">Food Items</option>
                     </select></td>
                    </div>
                </tr>
                <tr>
                    <div class="form-group">
                        <td><label for="ReceivedDate">Received Date</label></td>
                        <td></td>
                        <td><input type="date" id= "ReceivedDate" name="ReceivedDate" required class="form-control" placeholder="Enter the received date" max="<?php echo date("Y-m-d") ?>"/></td>
                    </div>
                </tr> 

                <tr>
                    <div class="form-group">
                        <td><label for="DueDate">Due Date</label></td>
                        <td></td>
                        <td><input type="date" id= "DueDate" name="DueDate" required class="form-control" placeholder="Enter the due date" max="<?php echo date("Y-m-d") ?>"/></td>
                    </div>
                </tr> 

                <br>
                <tr>
                    
                </tr>
            </table>
            <br>
            <div class="form-group">
            <div id="myform" onload="load()"> 
                    <b>Enter the item details of the invoice...</b> 
                    <br/><br/> 
                            Item ID:
                            <?php 
                                echo "<td><input type=text id=ItemID onchange=maxQuantity(". $_COOKIE['Items'] .",0".")></td>";
                                    
                            ?> 
                    <br/><br/> 
                            Quantity :&nbsp; 
                            <input type=number id="Quantity" min=0 oninput="validity.valid||(value='');"> 
                    <br/> 
                    
                    <?php 
                        echo "<td><input type=button id=add value=Add onclick=addRowInvoice(" . $_COOKIE['Items'] . ") disabled></td>";
                    ?> 
                    </div> 
                    <br/><br/> 
                    <div id="mydata"> 
                    <b>Item Details...</b> 
                    <table id="myTableData" class="addrowtable" > 
                        <tr> 
                            <td><b>Item ID</b></td> 
                            <td><b>Quantity</b></td> 
                            <td><b>Price</b></td> 
                            <td>&nbsp;</td> 

                        </tr> 
                        
                    </table> 
                      
                    </div> 
                </div>
                <br>
                <input type="hidden" id="rowCount" name="rowCount" value=0>
                <div class="form-group">
                        <td><label for="Total">Total Invoice Value</label></td>
                    
                        <td><input type="text" id= "Total" name="Total" required class="form-control" value=0 oninput="validity.valid||(value='');" placeholder="Enter the total " readonly/></td>
                    </div>
            
                <br>
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit" onclick="tableRowCount('myTableData')">Add</button>
                    <button type="reset" name="reset" value="Reset" class="button reset" >Reset</button>
                </div>
        </form> 
    </div> 
    </div>
        
        <div class= right>
            <div class="righttable">
            <div class="itemtable">
                <h3>ITEM TABLE</h3>
                <iframe src="../items/itemtable.php" class="item"></iframe>
            </div>
    </div>
    </div>
    </div>
     
  </body>

 
</html>
