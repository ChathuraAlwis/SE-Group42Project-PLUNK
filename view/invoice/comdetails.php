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
                        $itemTable = new Table("company");
                        // if($_SESSION['UserType'] ==  'Restaurant Manager'){
                        //   $itemTable->show("SELECT Company AS 'Company Name', DistributorName AS 'Distributor Name', PhoneNo AS 'Phone No' FROM plunk.company",'../items/additems');
                        // }
                        // elseif ($_SESSION['UserType'] == 'Accountant') {
                        //   $itemTable->show("SELECT Company AS 'Company Name', DistributorName AS 'Distributor Name', PhoneNo AS 'Phone No' FROM plunk.company",'../invoice/add');
                        // }
                        $itemTable->show("SELECT Company AS 'Company Name', DistributorName AS 'Distributor Name', PhoneNo AS 'Phone No' FROM plunk.company WHERE Remove= 'No'",'../invoice/add');
                      ?> 
                    </div>

                </div>


  </body>
</html>