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
  <?php
        if(isset($_GET['data'])){
            $id = explode("=", $_GET['data'])[1];
        }else{
            $id = -1;
        }
        date_default_timezone_set("Asia/Kolkata");
    ?>

    <div class="main">
    <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>Add Payment</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="add-invoice" type="hidden" >
                <table>
                <div class="form-group">
                            <tr>
                                <td style="text-align: right"><label for="PaymentDate">Payment Date</label></td>
                                <td><input name ="PaymentDate" id="PaymentDate" type="date" value="<?php echo date("Y-m-d") ?>" readonly></td>
                            </tr>
                        </div>
                </table>
                <tr><td><br></td></tr>
                <table>
                     <tr>
                        <div class="form-group">
                            <td><label for="BookingID">Booking ID</label></td>
                            <td></td>
                            <td><input type="text" id= "BookingID" name="BookingID" required class="form-control" placeholder="Enter the booking ID"/></td>
                        </div>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <div class="form-group">
                            <td><label for="UserID">User ID</label></td>
                            <td></td>
                            <td><input type="text" id= "UserID" name="UserID" required class="form-control" placeholder="Enter the user ID"/></td>
                        </div>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <div class="form-group">
                            <td><label for="Customername">Customer Name</label></td>
                            <td></td>
                            <td><input type="text" id= "Customername" name="Customername" required class="form-control" placeholder="Enter the Customer name"/></td>
                        </div>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <div class="form-group">
                            <td><label for="ContactNo">Contact No</label></td>
                            <td></td>
                            <td><input type="text" id= "ContactNo" name="ContactNo" required class="form-control" placeholder="Enter the contact no"/></td>
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
                    <button type="submit" name="cash" value="cash" class="button submit"><a href="addcash.php">Cash</a></button>
                    <button type="submit" name="visa" value="visa" class="button submit"><a href="addvisa.php">Visa Card</a></button>
                </div>
        </form>        
    </div>
</div>
<div class= right>
            <div class="righttop">
            <div class="itemtable">
                <h3>CRICKET CLUB PROPERTY BOOKING TABLE</h3>
                <iframe src="../bookings/bookingtable.php" class="item"></iframe>
            </div>
    </div>
    </div>
    <div class= right>
            <div class="rightbottom">
            <div class="itemtable">
                <h3>PAYMENT DETAILS TABLE</h3>
                <iframe src="paymenttable.php" class="item"></iframe>
            </div>
    </div>
    </div>
    </div>
     
  </body>

 
</html>