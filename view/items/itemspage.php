<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/tableui.css">

  </head>
  <body>
        <div class="main" >
            <div class="coverheader">

              <div class="tableheader">
                    <div class="innerdiv">
                    </div>
                    <h1>Items</h1>
              </div>
            </div>
            <div class="covertable">
                <div class="table">
                    <div class="upperbar">
                          <input type="text" name="search" class="search" placeholder="Enter Item Name Here.." >
                               <div class="addicon">     
                                    <button type="submit" name="button" class="btnsearch"><b>Search</b></button> 
                                    <a href="../items/additems.html" class="add"><button type="button" name="button" class="addbtn"><b>+</b></button></a>
                              </div>
                   </div>
                    <div >
                    <?php
                        require_once "../../controller/showtable.php";
                        $reorderTable = new Table("item");
                        $reorderTable->show("SELECT * FROM plunk.item", false);
                      ?>
                    </div>

                </div>

            </div>


        </div>

  </body>
</html>
