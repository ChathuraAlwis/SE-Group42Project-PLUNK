<?php session_start(); ?>
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
                var search = document.getElementById("ordersearch");
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
                    <h2><?php if(isset($_POST['ordersearch'])){ echo "Searched "; } else{ echo "All "; } ?>Orders</h2>
              </div>
            </div>
            <div class="covertable">
                <div class="table">
                    <div class="upperbar">
                        <form method="POST" action="ordertable.php" onclick = "return isEmpty()">
                            <input type="date" id="ordersearch" name="ordersearch" class="search" value="<?php if(isset($_POST['ordersearch'])) { echo "$_POST[ordersearch]"; }else{ echo date("Y-m-d");} ?>" required>
                            <button type = "submit" class = "search"><a href="#"><b>Search</b></a></button>
                        </form>
                    <div >
                    </div>
                    <div class="addordericon">
                        <a href="add.php" class="addorder"><button type="button" name="button" class="addbtn"><b>+</b></button></a>
                    </div> 
                 </div>
                    <div class="detailtable">
                    <?php 
                        if(isset($_POST['ordersearch'])){
                        echo '<iframe src="details.php?ordersearch=' . $_POST['ordersearch'] . '" name="searchinfo" class="staff"></iframe>';
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

