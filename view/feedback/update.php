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
    <script>
       var ans = getParameterByName('data', window.location.href);
       var id = ans.slice(-1);
      document.cookie = 'data='+id;
   </script>
   <?php
       require_once "../../model/database.php";
       $DB = new DB;
        $id = $_COOKIE['data'];
       $query = "SELECT * FROM plunk.feedback";
       $result = $DB->runQuery($query)[0];
        print_r($result);
   ?>
        <div class="main" >
            <div class="coverheader">

              <div class="tableheader">
                    <div class="innerdiv">
                    </div>
                    <h2>Feedback</h2>
              </div>
            </div>

            <div class="replyboxcover">
              <div class="replybox">
                <form class="feedbackform" action="..\..\controller\CRUD.php" method="post">
                  <input name ="reply-feedback" type="hidden" >
                <div class="labelbox">
                    <label for="Message"><b>Message :</b> </label>
                    <textarea name="Reply" rows="5" cols="80" value = "<?php echo "$result[FeedBack]";?>" readonly></textarea>
                </div>
                <div class="labelbox">
                  <label for="Reply"><b>Reply :</b> </label>
                  <textarea name="Reply" rows="5" cols="80" ></textarea>
                </div>
                <div  class="btnbox">
                  <button type="submit" name="submit" class="btn"><b>Submit</b> </button>
                  <button type="reset" name="reset" class="btn"><b>Reset</b> </button>
                </div>
              </form>
              </div>

            </div>


        </div>

  </body>
</html>
