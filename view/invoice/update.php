<?php session_start(); ?>
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
        $id = explode("=", $_GET['data'])[1];
        $query = "SELECT * FROM plunk.invoice WHERE InvoiceID=$id";
        $result = $DB->runQuery($query)[0];
    ?>

    <div class=main>
    <div class= left>
    <div class="form">
        <form action="update.php" method="POST">
            <h2 class="center-text">
                <b>INVOICE DETAILS</b>
                <!-- <a href="deleteinvoicesuccess.html"> -->
                <!-- <input type="hidden" name="delete-invoice"> -->
                <?php if($result["AddToGRN"]=="Yes"){
                    echo "<a href=deletemsg.php><image src = '../images/bin.png' class='bin'></image></a></h2>";
                }
                else{
                    echo "<a href=delete.php?InvoiceID=$result[InvoiceID]><image src = '../images/bin.png' class='bin'></image></a></h2>";
                }
                ?>
                
                <!-- <button type="submit" style="background-color: transparent; border:none"><image src = "../images/bin.png" class="bin"></image></button> -->
            </h2>
        </form>
			
        
        <form action="../../controller/CRUD.php" method="POST">
            <input name ="update-invoice" type="hidden" >
            <table class="formtable">
            <tr>
                <div class="form-group">
                   <td><label for="InvoiceID">Invoice ID</label></td> 
                   <td></td>
                    <td><input type="number" id= "InvoiceID" name="InvoiceID" required class="form-control" value = "<?php echo "$result[InvoiceID]";?>"/></td>
                </div>
              </tr>
            
            <tr>
                        <div class="form-group">
                            <td><label for="Company">Company Name</label></td>
                            <td></td>
                            <td><input type="text" id= "Company" name="Company" required class="form-control" value = "<?php echo "$result[Company]";?>"/></td>
                        </div>
                    </tr>
                    
                <tr>
                <div class="form-group">
                    <td><label for="Type">Item Type</label></td>
                    <td></td>
                    <td><select id="Type" name="Type" class="form-control" onchange="changeType(this);">
                    <option selected>Choose type...</option>
                        <option value="Beverage" <?php if("$result[Type]"=="Beverage") echo 'selected="selected"'; ?> >Beverage Items</option>
                        <option value="Food"<?php if("$result[Type]"=="Food") echo 'selected="selected"'; ?> >Food Items</option>
                     </select></td>
                    </div>
                </tr>
                <tr>
                    <div class="form-group">
                        <td><label for="ReceivedDate">Received Date</label></td>
                        <td></td>
                        <td><input type="date" id= "ReceivedDate" name="ReceivedDate" required class="form-control" value = "<?php echo "$result[ReceivedDate]";?>"/></td>
                    </div>
                </tr> 

                <tr>
                    <div class="form-group">
                        <td><label for="DueDate">Due Date</label></td>
                        <td></td>
                        <td><input type="date" id= "DueDate" name="DueDate" required class="form-control" value = "<?php echo "$result[DueDate]";?>"/></td>
                    </div>
                </tr> 

                <tr>
                    <div class="form-group">
                        <td><label for="Total">Total Invoice Value</label></td>
                        <td></td>
                        <td><input type="text" id= "Total" name="Total" required class="form-control" min=0 oninput="validity.valid||(value='');" value = "<?php echo "$result[Total]";?>"/></td>
                    </div>
                </tr>
                <tr>
                <div class="form-group">
                   <td><label for="UserID">User ID</label></td> 
                   <td></td>
                    <td><input type="number" id= "UserID" name="UserD" required class="form-control" value = "<?php echo "$result[UserID]";?>"/></td>
                </div>
              </tr>
            
            </table>
           
                <div class="form-group">
                <button type="submit" name="submit" value="Submit" class="button submit"  >Update</button>
                <button type="back" name="cancel" value="cancel" class="button submit" ><a class="cancel" href="invoicetable.php">Cancel</a></button>
            </div>
    </form>                
    </div>
</div>
<div class= right>
      <div class = "righttop">
        <div class="itemtable">
            <h4>COMPANY DETAILS TABLE</h4>
            <iframe src="../company/companytable.php" class="item"></iframe>
        </div>
        
       </div>
        <div class = "rightbottom">
            <div class="itemtable">
                <h4>INVOICE DETAILS TABLE</h4>
                <iframe src="invoiceform.php" class="item"></iframe>
            </div>  
        </div>
    </div>

</div>
     
  </body>

 
</html>