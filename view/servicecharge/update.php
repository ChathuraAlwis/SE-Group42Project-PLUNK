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
        $query = "SELECT * FROM plunk.servicechargestaff WHERE ServiceChargeID=$id";
        $result = $DB->runQuery($query)[0];
    ?>

    <div class=main>
    <div class= left>
    <div class="form">
			<h2 class="center-text"><b>Service Charge DETAILS</b>
                <image src = "../images/bin.png" class="bin"></image></h2>
			
        
        <form action="../../controller/CRUD.php" method="POST">
            <input name ="update-servicechargestaff" type="hidden" >
            <table class="formtable">
            <tr>
                <div class="form-group">
                   <td><label for="ServiceChargeID">Service Charge ID</label></td> 
                   <td></td>
                    <td><input type="number" id= "ServiceChargeID" name="ServiceChargeID" required class="form-control" value = "<?php echo "$result[ServiceChargeID]";?>"/></td>
                </div>
              </tr>
            
            <tr>
                        <div class="form-group">
                            <td><label for="StaffID">Staff ID</label></td>
                            <td></td>
                            <td><input type="number" id= "" name="StaffID" required class="form-control" value = "<?php echo "$result[StaffID]";?>"/></td>
                        </div>
                    </tr>

                <tr>
                    <div class="form-group">
                        <td><label for="Percentage">Percentage</label></td>
                        <td></td>
                        <td><input type="text" id= "Percentage" name="Percentage" required class="form-control" value = "<?php echo "$result[Percentage]";?>"/></td>
                    </div>
                </tr> 

                <br>
                <tr>
                    <div class="form-group">
                        <td><label for="Amount">Amount</label></td>
                        <td></td>
                        <td><input type="text" id= "Amount" name="Amountant" required class="form-control" min=0 oninput="validity.valid||(value='');" value = "<?php echo "$result[Amount]";?>"/></td>
                    </div>
                </tr>
            </table>
            
                <br>
                <div class="form-group">
                <button type="submit" name="submit" value="Submit" class="button submit" >Update</button>
                <button type="submit" name="cancel" value="cancel" class="button submit"><a href="allservicecharge.php">Cancel</a></button>
            </div>
    </form>                
    </div>
</div>
<div class= right>
      <div class = "righttop">
        <div class="itemtable">
            <h4>Service Charge TABLE</h4>
            <iframe src="allservicecharge.php" class="item"></iframe>
        </div>
        
       </div>

    </div>

</div>
     
  </body>

 
</html>