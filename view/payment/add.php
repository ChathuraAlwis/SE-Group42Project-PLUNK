<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/crud.css">
        
  </head>
  <body>

    <div class="main">
    <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>Add Payment</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="add-invoice" type="hidden" >
                <table>
                    <tr>
                        <div class="form-group">
                            <td><label for="Paymentname">Payment Name</label></td>
                            <td></td>
                            <td><input type="text" id= "Paymentname" name="Paymentname" required class="form-control" placeholder="Enter the payment name"/></td>
                        </div>
                    </tr>
                    <tr><td><br></td></tr>
                <tr>
                <div class="form-group">
                    <td><label for="Type">Type</label></td>
                    <td></td>
                    <td><select id="Type" name="Type" class="form-control" placeholder="Enter the type" onchange="changeType(this);">
                    <option selected>Choose type...</option>
                        <option value="Cash">Cash</option>
                        <option value="Card">Card</option>
                     </select></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Reservation1">Reservation 1</label></td>
                        <td></td>
                        <td><input type="text" id= "Reservation1" name="Reservation1" required class="form-control" placeholder="Enter the reservation 1"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>

                <tr>
                    <div class="form-group">
                        <td><label for="Reservation2">Reservation 2</label></td>
                        <td></td>
                        <td><input type="text" id= "Reservation2" name="Reservation2" required class="form-control" placeholder="Enter the reservation 2"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>

                <tr>
                    <div class="form-group">
                        <td><label for="PaymentDate">Payment Date</label></td>
                        <td></td>
                        <td><input type="date" id= "PaymentDate" name="PaymentDate" required class="form-control" placeholder="Enter the payement date"/></td>
                    </div>
                </tr> 
                <tr><td><br></td></tr>

                
                <tr>
                    <div class="form-group">
                        <td><label for="Total">Total Value</label></td>
                        <td></td>
                        <td><input type="text" id= "Total" name="Total" required class="form-control" placeholder="Enter the total value"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>

                <tr>
                    <div class="form-group">
                        <td><label for="Payment">Payment Clear</label></td>
                        <td></td>
                        <td><select id="Payment" name="Type" class="form-control" placeholder="Enter the payment clear or not" onchange="changeType(this);">
                        <option selected>Choose ...</option>
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
                         </select></td>
                        </div>
                    </tr>
                    <tr><td><br></td></tr>
            </table>
            
                
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit">Add</button>
                    <button type="reset" name="reset" value="Reset" class="button reset">Reset</button>
                </div>
        </form>        
    </div>
</div>
<div class= right>
            <div class="righttable">
            <div class="itemtable">
                <h3>Payment TABLE</h3>
                <iframe src="../payment/paymenttable.php" class="item"></iframe>
            </div>
    </div>
    </div>
    </div>
     
  </body>

 
</html>