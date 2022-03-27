<html>
<head>

      <meta charset="utf-8">
      <title>Bloomfield</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="icon" type="icon" href="../images/bloomfieldlogo.png" sizes="32*32">
      <link rel="stylesheet" href="../style/updatebooking.css">

</head>
<body>
  <?php
      session_start();
      require_once "../../model/database.php";
      $DB = new DB;
      $id = explode("=", $_GET['data'])[1];
      $query = "SELECT * FROM plunk.booking WHERE BookingID='$id'";
      $result = $DB->runQuery($query)[0];
      $query2 = "SELECT * FROM plunk.user";
      $result2 = $DB->runQuery($query2)[0];

  ?>

  <h2 class="paymenttitle">Booking Payment Details</h2>
<form class="addbookingthree" id="book" method="post" action="https://sandbox.payhere.lk/pay/checkout">
    <input type="hidden" name="merchant_id" value="1219990">    <!-- Replace your Merchant ID -->
    <?php if ($result['BookingType'] =='Club') {?>
      <input type="hidden" name="return_url" value="http://localhost/project/SE-Group42Project-PLUNK/view/bookings/clubpaymentupdate.php?data=<?php echo $_GET['data'];?>"
  <?php  } ?>
    <input type="hidden" name="return_url" value="http://localhost/project/SE-Group42Project-PLUNK/view/bookings/paymentupdated.php?data=<?php echo $_GET['data'];?>" >
    <input type="hidden" name="cancel_url" >
    <input type="hidden" name="notify_url" >
    <input type="hidden" name="currency" value="LKR">
    <input type="hidden" name="address" value="#">
    <input type="hidden" name="city" value="#">
    <input type="hidden" name="country" value="Sri Lanka">
    <input type="hidden" name="last_name" value="#"><br>
    <input type="hidden" name="email" value="#">
    <input type="hidden" name="changepayment" >
    <input type="hidden" name="UserType" value="<?php echo "$result2[UserType]";?>">

    <div class="submain">


    <label for="BookingID">Booking ID :</label>
    <input type="text" class="qtype11" name="order_id" value = "<?php echo "$result[BookingID]";?>" readonly><br><br>


    <label for="type">Booking Type   :</label>
    <input type="text" name="BookingType"  class="qtype11" value="<?php echo "$result[BookingType]";?>" readonly><br><br>

    <label for="reservation1">Reservation  :</label>
    <input type="text" name="items" class="qtype11" id="reservation" value="<?php echo "$result[Reservation]";?>" readonly><br><br>

     <label for="Payment">Payment  :</label>
    <input type="text" name="amount" class="qtype11" value="<?php echo "$result[Total]";?>" readonly><br>
    <br>
    <input type="hidden" name="UserID" value="<?php echo($result['UserID'])?>">
    <label for="name">Name :</label>
    <input type="text" name="first_name" class="qtype11" value="<?php echo "$result[CustomerName]";?>" readonly><br><br>

    <label for="contactno">Contact No :</label>
    <input type="text" name="phone" class="qtype11" value="<?php echo "$result[ContactNo]";?>" readonly><br>
    <br>
  </div>

    <input type="submit" class="pay"  value="Pay">


</form>


</body>
</html>
