<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
    <link rel="stylesheet" href="../style/crud.css">
    <script type="text/javascript" src="#"></script>
    <title>Bloomfield</title>
</head>
<body>
    <div class="form">
        <h2 class="center-text"><b>Delete Invoice</b></h2>
        <form action="../../controller/CRUD.php" method="post">
            <input name ="delete-invoice" type="hidden" >
            <div class="form-group">
                <label for="Invoice_ID">Invoice ID</label>
                <input name ="Invoice_ID" id="Invoice_ID" type="text" placeholder="Enter Invoice ID" >
            </div>
            <button type="submit" class="button">Delete</button>
        </form>
    </div>
</body>
</html> -->

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
        //print_r($_GET);
        $id = explode("=", $_GET['InvoiceID'])[0];
        $query = "SELECT * FROM plunk.invoice WHERE InvoiceID=$id";
        $result = $DB->runQuery($query)[0];
        //print_r($result);
    ?>

    <div class=main>
    <div class= left>
    <div class="form">
        <form action="update.php" method="POST">
            <h2 class="center-text">
                <b>INVOICE DETAILS</b>
                <!-- <a href="deleteinvoicesuccess.html"> -->
                
            </h2>
        </form>
			
        
        <form action="../../controller/CRUD.php" method="POST">
            <input name ="update-invoice" type="hidden" >
            <table class="formtable">
            <tr>
                <div class="form-group">
                   <td><label for="InvoiceID">Invoice ID</label></td> 
                    <td><input type="number" id= "InvoiceID" name="InvoiceID" required class="form-control" value = "<?php echo "$result[InvoiceID]";?>"/></td>
                </div>
              </tr>
            
            <tr>
            <div class="form-group">
                    <td><label for="Reason">Reason</label></td>
                    <td><textarea id= "Reason" name="Reason" required class="form-control" placeholder="Enter the Reason"></textarea></td>
                </div>
                    </tr>
                    
                
            
            </table>
           
                <div class="form-group">
                <button type="submit" name="submit" value="Submit" class="button submit"  >Delete</button>
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