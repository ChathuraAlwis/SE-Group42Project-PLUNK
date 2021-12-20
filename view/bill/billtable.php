<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/stafftable.css">
        <script type="text/javascript">
            function isEmpty(){
                var search = document.getElementById("billsearch");
                // console.log(search.value);
                if (search.value.length){
                    return true;
                }
                else{ return false; }
            }
        </script>
  </head>
  <body>
        <div class="main" >
            <div class="coverheader">

              <div class="tableheader">
                    <div class="innerdiv">
                    </div>
                    <h2><?php if(isset($_POST['billsearch'])){ echo "Searched "; } else{ echo "Unpaid "; } ?>Bills</h2>
              </div>
            </div>
            <div class="covertable">
                <div class="table">
                    <div class="upperbar">
                        <form method="POST" action="billtable.php" onclick = "return isEmpty()">
                              <input type="text" id="billsearch" name="billsearch" class="search" placeholder="Search By Customer Name" value="<?php if(isset($_POST['billsearch'])) { echo "$_POST[billsearch]"; } ?>" required>
                              <button type = "submit" class = "search"><a href="#"><b>Search</b></a></button>
                        </form>
                          
                    </div>
                    <div class="detailtable" >
                            <?php 
                              if(isset($_POST['billsearch'])){
                                echo '<iframe src="details.php?billsearch=' . $_POST['billsearch'] . '" name="searchinfo" class="staff"></iframe>';
                              }
                              else{
                                echo '<iframe src="details.php" name="searchinfo" class="staff"></iframe>';
                              }
                            ?>
                    </div>

                </div>

            </div>


        </div>

  </body>
</html>
