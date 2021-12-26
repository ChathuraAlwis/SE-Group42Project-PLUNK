<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/tabledesign.css">

  </head>
  <body>
        <div class="main" >

                    <div class="detailtable">
                      <?php
                          require_once "..\..\controller\showtable.php";
                          $orderTable = new Table("user");
                          $orderTable->show("SELECT Company AS 'Company Name', DistributorName AS 'Distributor Name', PhoneNo AS 'Contact No', Email as 'E-mail' FROM plunk.company WHERE Remove='No'", 'update');
                       ?>


                    </div>

                </div>


  </body>
</html>
