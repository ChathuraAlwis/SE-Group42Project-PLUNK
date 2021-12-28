
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,height=device-height, initial-scale=1">
        <link rel="icon" type="icon" href="../images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="..\style\mail.css">



  </head>
  <body>
    <!-- <?php
    require_once "../../model/database.php";
    $DB = new DB;
    $id = explode("=", $_GET['data'])[1];
    $query = "SELECT * FROM plunk.signup WHERE SignupID='$id'";


    $result = $DB->runQuery($query)[0];
    // print_r($result);
    ?> -->

    <div class="main">
              <div class="mailheader">
                <h2>Mail Box</h2>

              </div>


              <div class="middle2">

                            <div class="mainpage3" id="mainpages">
                              <div class="formbox">
                                <form class="adduser" action="..\..\controller\CRUD.php" method="post" autocomplete="on" >
                                  <input name ="sendmail" type="hidden" >
                                  <div class="submain">
                                    <div class="forminputs">
                                        <label for="from"><b>From :</b></label>
                                        <input type="email" name="from" class="input" value="shandilranga62@gmail.com">
                                    </div>
                                    <div class="forminputs">
                                        <label for="to"><b>To :</b></label>
                                        <input type="email" name="to" class="input" value="">
                                    </div>
                                    <div class="forminputs">
                                        <label for="subject"><b>Subject :</b></label>
                                        <input type="text" name="subject" class="input" value="">
                                    </div>
                                    <div class="forminput2">
                                        <label for="message"><b>Message :</b></label><br><br>
                                        <textarea name="message" class="msg" rows="10" cols="60"></textarea>
                                    </div><br>


                                    <div class="formbtn">
                                      <button type="submit"  id="sent" class="add"  ><a href="" class="btnlink">Sent</a></button>
                                      <button type="reset" id="deny" class="add" name="button"><a href="" class="btnlink">Reset</a></button>
                                    </div>

                                  </div>
                                </form>

                              </div>


                            </div>
                  </div>
            </div>
            <?php
        $to = '$_POST[to]';
        $subject = '$_POST[subject]';
        $body = '$_POST[message]';
        $headers = 'From: $_POST[from]';
        $headers .= "Reply-To: info@yoursite.comrn";
        $headers .= "Return-Path: info@yoursite.comrn";
        $headers .= "X-Mailer: PHP5n";
         $headers .= "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
        ini_set("SMTP","localhost");
        ini_set("sendmail_from","phpflow@gmail.com");
        ini_set('smtp_port','25');
        mail($to,$subject,$body,$headers);
        ?>
      </body>
</html>
