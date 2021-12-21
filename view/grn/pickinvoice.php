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
                        $grnTable = new Table("invoice");
                        $grnTable->show("SELECT `InvoiceID` AS 'Invoice ID', `Company` AS 'Company', `Type` AS 'Item Type', `ReceivedDate` AS 'Received Date', `DueDate` AS 'Due Date', `Total` AS 'Total' FROM plunk.invoice WHERE AddToGRN = 'No'", 'addgrn');
                      ?>

                </div>


  </body>
</html>
