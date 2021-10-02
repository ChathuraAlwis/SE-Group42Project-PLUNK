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
                    <tr><td><br></td></tr>
                <tr>
                <div class="form-group">
                    <td><label for="Type">Type</label></td>
                    <td></td>
                    <td><select id="Type" name="Type" class="form-control" placeholder="Enter the type" onchange="changeType(this);">
                    <option selected>Choose type...</option>
                        <option value="Fooditems">Food Items</option>
                        <option value="Beverageitems">Beverage Items</option>
                     </select></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="ReceivedDate">Received Date</label></td>
                        <td></td>
                        <td><input type="date" id= "ReceivedDate" name="ReceivedDate" required class="form-control" placeholder="Enter the received date"/></td>
                    </div>
                </tr> 
                <tr><td><br></td></tr>

                <tr>
                    <div class="form-group">
                        <td><label for="DueDate">Due Date</label></td>
                        <td></td>
                        <td><input type="date" id= "DueDate" name="DueDate" required class="form-control" placeholder="Enter the due date"/></td>
                    </div>
                </tr> 
                <tr><td><br></td></tr>

                <br>
                <tr>
                    <div class="form-group">
                        <td><label for="Total">Total Invoice Value</label></td>
                        <td></td>
                        <td><input type="text" id= "Total" name="Total" required class="form-control" placeholder="Enter the total invoice value"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
            </table>
            <div class="form-group">
            <div id="myform" onload="load()"> 
                    <b>Enter the item details of the invoice...</b> 
                    <br/><br/> 
                            Item Name:<input type=text id="ItemName"> 
                    <br/><br/> 
                            Quantity :&nbsp; 
                            <input type=number id="Quantity" min=0 oninput="validity.valid||(value='');"> 
                    <br/> 
                            <input type="submit" id="add" value="Add" onclick="addRow()"> 
                    </div> 
                    <br/><br/> 
                    <div id="mydata"> 
                    <b>Item Details...</b> 
                    <table id="myTableData" class="addrowtable" > 
                        <tr> 
                            <td>&nbsp;</td> 
                            <td><b>Item Name</b></td> 
                            <td><b>Quantity</b></td> 
                        </tr> 
                    </table> 
                      
                    </div> 
                </div>
            
                <br>
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit">Add</button>
                    <button type="reset" name="reset" value="Reset" class="button reset" >Reset</button>
                </div>
        </form> 
    </div> 
    </div>
        
        <div class= right>
            <div class="righttable">
            <div class="itemtable">
                <h3>INVOICE TABLE</h3>
                <iframe src="../invoice/invoicedetails.php" class="item"></iframe>
            </div>
    </div>
    </div>
    </div>
     
  </body>

 
</html>
