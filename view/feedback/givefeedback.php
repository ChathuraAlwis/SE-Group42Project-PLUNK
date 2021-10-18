<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/feedback.css">

  </head>
  <body>

        <div class="main" >
            <div class="coverheader">

              <div class="tableheader">
                    <div class="innerdiv">
                    </div>
                    <h2>Feedback</h2>
              </div>
            </div>

            <div class="replyboxcover">
              <div class="replybox2">
                <form class="feedbackform" action="..\..\controller\CRUD.php" method="post">
                  <input name ="reply-feedback" type="hidden" >
                  <div class="questions">

                          <label for="CreatedDate"><b>Date :</b> </label>
                          <input type="date" name="CreatedDate" id="today" value="<?php echo date("Y-m-d") ?>" readonly>

                  </div><br><br>
                <div class="labelbox">
                    <label for="FeedBack"><b>Message :</b> </label>

                    <textarea name="FeedBack" rows="8" cols="80"  required></textarea>
                </div><br><br>


                <div  class="btnbox">
                  <button type="submit" name="submit" class="btn" formaction="..\feedback\feebacksuccess.html"><b>Submit</b> </button>
                  <button type="reset" name="reset" class="btn"><b>Reset</b> </button>
                </div>
              </form>
              </div>

            </div>


        </div>

  </body>
</html>
