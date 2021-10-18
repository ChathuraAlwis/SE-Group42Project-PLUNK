<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/tablehome.css">

  </head>
  <body>
        <div class="main" >

                    <div class="detailtable">
                    
                    <?php
                        require_once "../../controller/showtable.php";
                        $cashTable = new Table("cashpayment");
                        $cashTable->show("SELECT PaymentID as 'Payment ID', ReceiptNo as 'Receipt No', SignedPerson as 'Signed Person Name' FROM plunk.cashpayment", 'update');
                      ?>

                </div>


  </body>
</html>