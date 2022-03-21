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
            require_once "../../model/database.php";
            $DB = new DB;
            $id = explode("=", $_GET['data'])[1];
            $query = "SELECT * FROM plunk.booking WHERE BookingID=$id";
            $result = $DB->runQuery($query)[0];
        }else{
            $id = -1;
        }
        date_default_timezone_set("Asia/Kolkata");



    ?>

    <div class="main">
    <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>Add Payment</b></h2>
        <form>
                <table>
                <div class="form-group">
                            <tr>
                                <td style="text-align: right"><label for="PaymentDate">Payment Date</label></td>
                                <td></td>
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
                    <td><input type="number" id= "BookingID" name="BookingID"  class="form-control" <?php if(isset($result)){echo "value=$result[BookingID]";}?> readonly/></td>
                </div>
                    </tr>
                    <tr><td><br></td></tr>

                    <tr>
                    <div class="form-group">
                   <td><label for="CustomerName">Customer Name</label></td>
                   <td></td>
                    <td><input type="text" id= "CustomerName" name="CustomerName"  class="form-control" <?php if(isset($result)){echo "value=$result[CustomerName]";}?> readonly/></td>
                </div>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <div class="form-group">
                            <td><label for="ContactNo">Contact No</label></td>
                            <td></td>
                            <td><input type="text" id= "ContactNo" name="ContactNo"  class="form-control" <?php if(isset($result)){echo "value=$result[ContactNo]";}?> readonly/></td>
                        </div>
                    </tr>
                    <tr><td><br></td></tr>

                <tr>
                    <div class="form-group">
                        <td><label for="Reservation">Reservation List</label></td>
                        <td></td>
                        <td><input type="text" id= "Reservation" name="Reservation"  class="form-control" <?php if(isset($result)){echo "value=$result[Reservation]";}?> readonly/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>

                <tr>
                    <div class="form-group">
                        <td><label for="Total">Total Value</label></td>
                        <td></td>
                        <td><input type="text" id= "Total" name="Total" required class="form-control" <?php if(isset($result)){echo "value=$result[Total]";}?> readonly/></td>
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
                    <button type="submit" name="cash" value="cash" class="button submit"><a class= "cancel" href="addcash.php<?php if(isset($result)){echo "?id=$result[BookingID]";}?>">Cash</a></button>
                    <button type="submit" name="visa" value="visa" class="button submit"><a class= "cancel" href="addvisa.php<?php if(isset($result)){echo "?id=$result[BookingID]";}?>">Visa Card</a></button>
                </div>
        </form>
    </div>
</div>
<div class= right>
            <div class="righttop">
            <div class="itemtable">
                <h3>CRICKET CLUB PROPERTY BOOKING TABLE</h3>
                <iframe src="paymentbooking.php" class="item"></iframe>
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
