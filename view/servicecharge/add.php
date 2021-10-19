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
        <h2 class="center-text"><b>Add Service Charge Details</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="add-salary" type="hidden" >
                <table>
                    <tr>
                        <div class="form-group">
                            <td><label for="StaffID">Staff ID</label></td>
                            <td></td>
                            <td><input type="text" id= "StaffID" name="StaffID" required class="form-control" placeholder="Enter the staff ID"/></td>
                        </div>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                    <div class="form-group">
                        <td><label for="Percentage">Percentage</label></td>
                        <td></td>
                        <td><input type="number" id="Percentage" name="Percentage" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the percentage"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Amount">Total Amount</label></td>
                        <td></td>
                        <td><input type="number" id="Amount" name="Amount" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Total Amount"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
               
                
            </table>
            <br>
            
            
                <br>
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit">Add</button>
                    <button type="reset" name="reset" value="Reset" class="button reset" >Reset</button>
                </div>
        </form> 
    </div> 
    </div>
    <div class= right>
      <div class = "righttop">
        <div class="itemtable">
            <h4>Service Charge Details Table</h4>
            <iframe src="allservicecharge.php?id=<?php echo $_GET['id'];?>" class="item"></iframe>
        </div>
        
       </div>
        <div class = "rightbottom">
            <div class="itemtable">
            <h3>Leave Details Table</h3>
                <iframe src="../leave/allleave.php" class="item"></iframe>
            </div>  
        </div>
    </div>
        
    </div>
     
  </body>

 
</html>