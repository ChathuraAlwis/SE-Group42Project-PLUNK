
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

    <?php
    $status='';

    if (isset($_POST['sendmail'])) {
      $to = 'shandilranga62@gmail.com';
      $from= $_POST['to'];
      $subject = $_POST['subject'];
      $body = $_POST['message'];

      $email_body   = "Message from Bloomfield cricket club: <br>";
  		$email_body   .= "<b>Subject:</b> {$subject} <br>";
  		$email_body   .= "<b>Message:</b><br>" . nl2br(strip_tags($body));
      $header       = "From: {$from}\r\nContent-Type: text/html;";

      $send_mail_result= mail($to, $subject, $email_body, $headers);

      if ( $send_mail_result ) {
			$status= '<p class= success>Message Sent</p>';
		} else {
				$status= '<p class= error>Message Error</p>';
		}
  }

?>
    <div class="main">
              <div class="mailheader">
                <h2>Mail Box</h2>

              </div>


              <div class="middle2">

                            <div class="mainpage3" id="mainpages">
                              <div class="formbox">
                                <form class="adduser" action="mail.php" method="post" autocomplete="on" >
                                  <!-- <input name ="sendmail" type="hidden" > -->
                                  <div class="submain">
                                    <!-- <div class="forminputs">
                                        <label for="from"><b>From :</b></label>
                                        <input type="email" name="from" class="input" value="shandilranga61@gmail.com">
                                    </div> -->
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
                                      <button type="submit"  id="sent" class="add" name="sendmail" >Sent</button>
                                      <button type="reset" id="deny" class="add" name="button"><a href="" class="btnlink">Reset</a></button>
                                    </div>

                                  </div>
                                </form>

                              </div>


                            </div>
                  </div>
            </div>

      </body>
</html>
