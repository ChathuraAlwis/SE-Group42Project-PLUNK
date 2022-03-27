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
                var search = document.getElementById("servicesearch");
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
                    <h2>Service Charge</h2>
              </div>
            </div>
            <div class="covertable">
                <div class="table">
                  <div class="upperbar">
                  <form method="POST" action="servicetable.php" onclick = "return isEmpty()">
                        <input type = "date" name="servicesearch" class = "search" placeholder="Enter the date"/>
                        <button type = "submit" class = "search" ><b>Search</b></button>
                  </form>
                          <div class="addicon">
                                <a href="addservice.php" class="add"><button type="button" name="button" class="addbtn"><b>+</b></button></a>
                          </div>
                    </div>
                    <div class="detailtable">
                    <?php 
                         //print_r($_POST['servicesearch']);
                        if(isset($_POST['servicesearch'])){
                              echo '<iframe src="details.php?servicesearch=' . $_POST['servicesearch'] . '" name="searchinfo" class="staff"></iframe>';
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