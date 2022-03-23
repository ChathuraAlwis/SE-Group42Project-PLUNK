<!-- <!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/stafftable.css">

  </head>
  <body>
        <div class="main" >
            <div class="coverheader">

              <div class="tableheader">
                    <div class="innerdiv">
                    </div>
                    <h2>Salary</h2>
              </div>
            </div>
            <div class="covertable">
                <div class="table">
                    <div class="upperbar">
                    <div >
                              <input type = "text" class = "search" placeholder="Enter the salary"/>
                  </div>
                    <div >
                              <button type = "submit" class = "search" ><b>Search</b></button>
                        </div>
                          <div class="addicon">
                                <a href="addsal.php" class="add"><button type="button" name="button" class="addbtn"><b>+</b></button></a>
                          </div>
                    </div>
                    <div class="detailtable">

                            <iframe src="details.php" class="staff"></iframe>
                    </div>

                </div>

            </div>


        </div>

  </body>
</html> -->

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
                var search = document.getElementById("salarysearch");
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
                    <h2>Salary</h2>
              </div>
            </div>
            <div class="covertable">
                <div class="table">
                  <div class="upperbar">
                  <form method="POST" action="salarytable.php" onclick = "return isEmpty()">
                        <input type = "date" name="salarysearch" class = "search" placeholder="Enter the date"/>
                        <button type = "submit" class = "search" ><b>Search</b></button>
                  </form>
                          <div class="addicon">
                                <a href="addsal.php" class="add"><button type="button" name="button" class="addbtn"><b>+</b></button></a>
                          </div>
                    </div>
                    <div class="detailtable">
                    <?php 
                         //print_r($_POST['salarydetailssearch']);
                        if(isset($_POST['salarysearch'])){
                              echo '<iframe src="details.php?salarysearch=' . $_POST['salarysearch'] . '" name="searchinfo" class="staff"></iframe>';
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