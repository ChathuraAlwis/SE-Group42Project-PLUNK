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
                          $invoiceTable = new Table("invoice");
                          if(isset($_POST['invoicesearch'])){
                            $search = $_POST['invoicesearch'];
                            $invoiceTable->show("SELECT * FROM plunk.invoice WHERE Company LIKE ('%$search%');", false);
                            // $orderTable->show("SEARCH Cus");
                          }
                          else{
                            $invoiceTable->show();
                          }
                          
                       ?>
                      

                    </div>

                </div>


  </body>
</html>
