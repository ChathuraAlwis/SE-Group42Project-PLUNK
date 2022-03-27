
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,height=device-height, initial-scale=1">
        <link rel="icon" type="icon" href="../images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/decision.css">



  </head>
  <body>
    <?php
    require_once "../../model/database.php";
    $DB = new DB;
    $id = explode("=", $_GET['data'])[1];
    $query = "SELECT * FROM plunk.signup WHERE SignupID='$id'";

    $result = $DB->runQuery($query)[0];

    ?>
    <div class="main">


              <div class="middle">

                            <div class="mainpages" id="mainpages">
                              <div class="formbox">
                                <form class="adduser" action="..\..\controller\CRUD.php" method="post" autocomplete="on" >
                                  <input name ="denied" type="hidden" >
                                  <div class="submain">
                                    <!-- <div class="imagebox">
                                      <input type="file"  accept="image/*" name="image" id="file"  onchange="loadFile(event)" style="display: none;" required>

                                      <?php //echo '<img id="output" alt="No Profile Picture" src="data:image/jpeg;base64,'.base64_encode($result['ProfilePic']).'"/>';?>
                                       <label for="file" class="upload"><b>Upload Image</b> </label>

                                      <script>
                                      var loadFile = function(event) {
                                      	var image = document.getElementById('output');
                                      	image.src = URL.createObjectURL(event.target.files[0]);
                                      };
                                      </script>

                                    </div><br> -->
                                    <div class="forminputs">
                                        <label for="Name"> Name with initials</label><br>
                                        <input type="text" id="Name" class="input" name="Name" value ="<?php echo "$result[Name]";?>"  readonly>
                                    </div>

                                    <div class="radio">
                                          <label for="UserType">Requested Member Type</label><br>
                                          <input type="text" class="input" name="UserType" value="<?php echo "$result[UserType]";?>" readonly>
                                          <!-- <select class="UserType" name="UserType" id="UserType" readonly>
                                                  <option selected>Select the member type</option>
                                                  <option value="Ordinary Member">Ordinary Member</option>
                                                  <option value="Life Member">Life Member</option>
                                                  <option value="HL Member"> HL Member</option>
                                          </select> -->
                                    </div>

                                    <div class="forminputs">
                                      <label for="JoinedYear"> Requested date</label><br>
                                      <input type="date" id="JoinedYear" class="input" name="JoinedYear" value="<?php echo "$result[JoinedYear]";?>" readonly>
                                    </div>
                                    <div class="forminputs">
                                        <label for="Email"> E-mail </label><br>
                                        <input type="email" id="Email" class="input" name="Email" placeholder="xxxx@gmail.com" value="<?php echo "$result[Email]";?>" readonly>
                                    </div>
                                    <div class="forminputs">
                                        <label for="ContactNo"> Contact No</label><br>
                                        <input type=" tel" id="ContactNo" class="input" name="ContactNo" pattern="[0-9]{10}" value="<?php echo "$result[ContactNo]";?>" readonly>
                                    </div>
                                    <div class="forminputs">
                                        <label for="Reason"> Reason</label><br>
                                        <input type="text" id="UserName" class="input" name="Reason"  required>
                                    </div>




                                    <div class="formbtn">
                                      <button type="submit"  id="add" class="add" name="button" > Deny</button>
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
