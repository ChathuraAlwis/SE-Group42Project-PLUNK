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
                        $grnTable = new Table("grn");
                        
                        if(isset($_GET['name'])){                    
                              $name = $_GET['name'];
  
                              if ($_GET['type']=='0'){
                                $type = '1 OR Itemtype=2';
                              }
                              else{
                                $type = $_GET['type'];
                              }
                                
                              $grnTable->show("SELECT `GRNID` AS 'GRN ID', `CompanyName` AS 'Company Name', `AddDate` AS 'Add Date', `ItemType` AS 'Item Type' FROM plunk.grn WHERE CompanyName LIKE ('%$name%') AND ItemType=$type ", 'update');
                              
                            }
                            
                            else{
  
                              $grnTable->show("SELECT `GRNID` AS 'GRN ID', `CompanyName` AS 'Company Name', `AddDate` AS 'Add Date', `ItemType` AS 'Item Type' FROM plunk.grn", 'update');
                            }
                            
                      
                      
                      
                      ?>

                </div>


  </body>
</html>
