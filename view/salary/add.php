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
        <h2 class="center-text"><b>Add Salary Details</b></h2>
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
                        <td><label for="Basic">Basic Salary</label></td>
                        <td></td>
                        <td><input type="number" id="Basic" name="Basic" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the basic salary"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Bonus">Bonus Value</label></td>
                        <td></td>
                        <td><input type="number" id="Bonus" name="Bonus" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the bonus value"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                    <tr>
                    <div class="form-group">
                        <td><label for="ETF">ETF Value</label></td>
                        <td></td>
                        <td><input type="number" id="ETF" name="ETF" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the ETF value"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                    <tr>
                    <div class="form-group">
                        <td><label for="EPF">EPF Value</label></td>
                        <td></td>
                        <td><input type="number" id="EPF" name="EPF" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Enter the EPF Value"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                
                <tr>
                    <div class="form-group">
                        <td><label for="Total">Total Salary</label></td>
                        <td></td>
                        <td><input type="number" id="Total" name="Total" required class="form-control" min=0 oninput="validity.valid||(value='');" placeholder="Total salary"/></td>
                    </div>
                </tr>
               
                
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
            <h4>Salary Details Table</h4>
            <iframe src="saldetail.php" class="item"></iframe>
        </div>
        
       </div>
        <div class = "rightbottom">
            <div class="itemtable">
            <h3>Leave Details Table</h3>
                <iframe src="../leave/alldetails.php" class="item"></iframe>
            </div>  
        </div>
    </div>
        
    </div>
     
  </body>

 
</html>
