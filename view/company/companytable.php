<?php session_start(); ?>
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
                        //   $itemTable->show("SELECT Company AS 'Company Name', DistributorName AS 'Distributor Name', PhoneNo AS 'Phone No', Email AS 'E-mail Address' FROM plunk.company",'../invoice/add');
                        // }
                        if(isset($_GET['companysearch'])){
                          $search = $_GET['companysearch'];
                          $itemTable->show("SELECT Company AS 'Company Name', DistributorName AS 'Distributor Name', PhoneNo AS 'Contact No' FROM plunk.company WHERE Remove= 'No' AND Company LIKE ('%$search%');",'update');
                        }
                        else{
                          $itemTable->show("SELECT Company AS 'Company Name', DistributorName AS 'Distributor Name', PhoneNo AS 'Contact No' FROM plunk.company WHERE Remove= 'No'",'update');

                        }
                      ?>
                    </div>

                </div>


  </body>
</html>
