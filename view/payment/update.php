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
        $query = "SELECT * FROM plunk.payment WHERE PaymentID=$id";
        $result = $DB->runQuery($query)[0];
    ?>

    <div class=main>
    <div class= left>
    <div class="form">
			<h2 class="center-text"><b>Payment Details</b>
                <image src = "../images/bin.png" class="bin"></image></h2>
			
        
        <form action="../../controller/CRUD.php" method="POST">
            <input name ="update-payment" type="hidden" >
            <table class="formtable">
            <tr>
                <div class="form-group">
                   <td><label for="PaymentID">Payment ID</label></td> 
                   <td></td>
                    <td><input type="number" id= "PaymentID" name="PaymentID" required class="form-control" value = "<?php echo "$result[PaymentID]";?>"/></td>
                </div>
              </tr>
            
            <tr>
                        <div class="form-group">
                            <td><label for="PaymentDate">Payment Date</label></td>
                            <td></td>
                            <td><input type="date" id= "PaymentDate" name="PaymentDate" required class="form-control" value = "<?php echo "$result[PaymentDate]";?>"/></td>
                        </div>
                    </tr>
                <tr>
                <div class="form-group">
                    <td><label for="PaymentType">Type</label></td>
                    <td></td>
                    <td><select id="PaymentType" name="PaymentType" class="form-control" value = "<?php echo "$result[Type]";?>" onchange="changeType(this);">
                    <option selected>Choose type...</option>
                        <option value="Cash" <?php if("$result[PaymentType]"=="Cash") echo 'selected="selected"'; ?> >Cash</option>
                        <option value="Visa" <?php if("$result[PaymentType]"=="Visa") echo 'selected="selected"'; ?>>Visa</option>
                     </select></td>
                    </div>
                </tr>
                <tr>
                <div class="form-group">
                   <td><label for="UserID">User ID</label></td> 
                   <td></td>
                    <td><input type="number" id= "UserID" name="UserID" required class="form-control" value = "<?php echo "$result[UserID]";?>"/></td>
                </div>
              </tr>
              <tr>
                <div class="form-group">
                   <td><label for="BookingID">Booking ID</label></td> 
                   <td></td>
                    <td><input type="number" id= "BookingID" name="BookingID" required class="form-control" value = "<?php echo "$result[BookingID]";?>"/></td>
                </div>
              </tr>
            </table>
            
                <br>
                <div class="form-group">
                <button type="submit" name="submit" value="Submit" class="button submit" >Update</button>
                <button type="submit" name="cancel" value="cancel" class="button submit"><a href="invoicetable.php">Cancel</a></button>
            </div>
    </form>                
    </div>
</div>
<div class= right>
      <div class = "righttop">
        <div class="itemtable">
            <h4>CASH PAYMENT TABLE</h4>
            <iframe src="cash.php" class="item"></iframe>
        </div>
        
       </div>
        <div class = "rightbottom">
            <div class="itemtable">
                <h4>VISA PAYMENT TABLE</h4>
                <iframe src="visa.php" class="item"></iframe>
            </div>  
        </div>
    </div>

</div>
     
  </body>

 
</html>