<?php session_start() ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/crud.css">
        <script type="text/javascript" src="../script/additem.js"></script>
        <script type="text/javascript" src="../script/maxQuantity.js"></script>
        
        
  </head>
  <body>
  
    <?php
        require_once "../../model/database.php";
        if(isset($_GET['data'])){ //Select company
            //$DB2 = new DB;
            $companyname = explode("=", $_GET['data'])[1];
            //$query = "SELECT * FROM plunk.company WHERE Company=$companyname";
            //$result2 = $DB2->runQuery($query)[0];
            //print_r($result2);
        }
        else{
            $companyname = "Select the Company";
        }
    ?>
    <div class="main">
    <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>Add Invoice</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="add-invoice" type="hidden" >
                <table class="formtable">
                <tr>
                    <div class="form-group">
                        <td><label for="Company">Company</label></td>
                        <td><input type="text" id="Company" name="CompanyName"  required class="form-control"  placeholder="Select the company name from the company table" value = "<?php echo "$companyname";?>"/></td>
                    </div>
                </tr>
                <tr>
                <div class="form-group">
                    <td><label for="Type">Item Type</label></td>
                    
                    <td><select id="Type" name="ItemType" class="form-control" placeholder="Enter the type" onchange="changeType(this);">
                    <option selected>Choose type...</option>
                        <option value="Beverage">Beverage Items</option>
                        <option value="Food">Food Items</option>
                     </select></td>
                    </div>
                </tr>
                <tr>
                    <div class="form-group">
                        <td><label for="ReceivedDate">Received Date</label></td>
                        <td><input type="date" id= "ReceivedDate" name="ReceivedDate" required class="form-control" placeholder="Enter the received date" max="<?php echo date("Y-m-d") ?>"/></td>
                    </div>
                </tr> 

                <tr>
                    <div class="form-group">
                        <td><label for="DueDate">Due Date</label></td>
                        <td><input type="date" id= "DueDate" name="DueDate" required class="form-control" placeholder="Enter the due date" min="<?php echo date("Y-m-d") ?>"/></td>
                    </div>
                </tr> 

                        <tr>
                            <td><label for="Total">Total</label></td>
                            <td><input type="text" id= "Total" name="Total" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the total"/></td>
                        </tr>
                    </table>
                        
            
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit" >Add</button>
                    <button type="reset" name="reset" value="Reset" class="button reset" >Reset</button>
                </div>
        </form> 
    </div> 
    </div>
        
    <div class= right>
      <div class = "righttop">
        <div class="itemtable">
            <h4>COMPANY DETAILS TABLE</h4>
            <iframe src="comdetails.php" class="item"></iframe>
        </div>
        
       </div>
        <div class = "rightbottom">
            <div class="itemtable">
                <h4>ITEM DETAILS TABLE</h4>
                <iframe src="../items/itemtable.php" class="item"></iframe>
            </div>  
        </div>
    </div>

</div>
     
  </body>

 
</html>
