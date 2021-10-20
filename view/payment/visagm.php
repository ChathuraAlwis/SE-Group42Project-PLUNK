<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
    <link rel="stylesheet" href="../style/paymentgm.css">
    <title>Bloomfield</title>
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
        <div class="left">
            <div class="form">
                <h2 class="center-text"><b>Cash Payment</b></h2>
                <form action="../../controller/CRUD.php" method="post">
                    <input name ="add-cash" type="hidden" >
                    <table>
                        <div class="form-group">
                            <tr>
                                <td style="text-align: right"><label for="PaymentDate">Payment Date</label></td>
                                <td><input name ="PaymentDate" id="PaymentDate" type="date" value="<?php echo date("Y-m-d") ?>" readonly></td>
                                <td width=50px>&nbsp;</td>
                                <td style="text-align: right"><label for="PaymentTime">Payment Time</label></td>
                                <td><input name ="PaymentTime" id="PaymentTime" type="time" value="<?php echo date("H:i") ?>" readonly></td>
                            </tr>
                        </div>
                    </table>
                    <table>
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
                        <td><label for="CardName">Visa Card Name</label></td>
                        <td></td>
                        <td><input type="text" id= "CardName" name="CardName" required class="form-control" placeholder="Enter the visa card name"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="CardNo">Visa Card No :</label></td>
                        <td></td>
                        <td><input type="text" id= "CardNo" name="CardNo" required class="form-control" placeholder="Enter the visa card no"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="ExpDate">Exp-Date</label></td>
                        <td></td>
                        <td><input type="date" id= "ExpDate" name="ExpDate" required class="form-control" placeholder="Enter the Exp-Date"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="CVC">CVC</label></td>
                        <td></td>
                        <td><input type="text" id= "CVC" name="CVC" required class="form-control" placeholder="Enter the CVC"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                    </table>

                    <div class="form-group">
                        <button type="submit" name="submit" value="Submit" class="button submit" >Pay</button>
                        <button type="reset" name="reset" value="Reset" class="button reset" onclick="history.back()" >Cancle</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</body>
</html>
