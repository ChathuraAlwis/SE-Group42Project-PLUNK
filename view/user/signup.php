
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,height=device-height, initial-scale=1">
        <link rel="icon" type="icon" href="../images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/signup.css">



  </head>
  <body>
    <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $sql = "SELECT UserName, DisplayID, Email FROM plunk.user;";
        $result = json_encode($DB->runQuery($sql));
        date_default_timezone_set("Asia/Kolkata");
    ?>
    <div class="main">

          <div class="header" id="myheader">
                  <div class="leftheader">
                      <img class="plunk" src="../images/projectlogo.png" alt="plunk logo"><br>

                  </div>

                  <div class="middleheader">
                    <img class="Logo" src="../images/bloomfieldlogo.png" alt="Bloomfield Logo"><br>
                      <h2>Bloomfield C. & A.C.</h2>

                  </div>

                  <div class="rightheader">
                    <div class="subrightheader">

                    </div>

                  </div>

          </div>
              <div class="middle">

                            <div class="mainpages" id="mainpages">
                              <div class="formbox">
                                <form class="adduser" action="..\..\controller\CRUD.php" method="post" autocomplete="on" >
                                  <input name ="joinrequest" type="hidden" >
                                  <div class="submain">
                                    <div class="imagebox">
                                      <input type="file"  accept="image/*" name="image" id="file"  onchange="loadFile(event)" style="display: none;" required>

                                      <img id="output" >
                                      <label for="file" class="upload"><b>Upload Image</b> </label>

                                      <script>
                                      var loadFile = function(event) {
                                      	var image = document.getElementById('output');
                                      	image.src = URL.createObjectURL(event.target.files[0]);
                                      };
                                      </script>

                                    </div><br>
                                    <div class="forminputs">
                                        <label for="Name"> Name with initials</label><br>
                                        <input type="text" id="Name" class="input" name="Name"  required>
                                    </div>

                                    <div class="radio">
                                          <label for="UserType">Requesting Member Type</label><br>
                                          <select class="UserType" name="UserType" id="UserType" required>
                                                  <option selected>Select the member type</option>
                                                  <option value="Ordinary Member">Ordinary Member</option>
                                                  <option value="Life Member">Life Member</option>
                                                  <option value="HL Member"> HL Member</option>
                                          </select>
                                    </div>

                                    <div class="forminputs">
                                        <label for="JoinedYear"> Requesting date</label><br>
                                        <input type="date" id="JoinedYear" class="input" name="JoinedYear" value="<?php echo date("Y-m-d") ?>" readonly>
                                    </div>
                                    <div class="forminputs">
                                        <label for="Email"> E-mail </label><br>
                                        <input type="email" id="Email" class="input" name="Email" placeholder="xxxx@gmail.com" onchange='<?php echo 'checkEmail('. $result .')';?>' required>
                                    </div>
                                    <div class="forminputs">
                                        <label for="ContactNo"> Contact No</label><br>
                                        <input type=" tel" id="ContactNo" class="input" name="ContactNo" pattern="[0-9]{10}" required>
                                    </div><br>


                                    <div class="formbtn">
                                      <button type="submit"  id="add" class="add" name="button" onclick='<?php echo 'checkUser('. $result .')';?>'>Add Member</button>
                                      <button type="reset" id="reset" class="add" name="button">Reset</button>
                                    </div>

                                  </div>
                                </form>

                              </div>


                            </div>
                  </div>
            </div>
      </body>
</html>
