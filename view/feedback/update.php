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
    <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $id = explode("=", $_GET['data'])[1];
        $query = "SELECT * FROM plunk.feedback WHERE FeedBackID='$id'";

        $result = $DB->runQuery($query)[0];

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
                    <label for="FeedBack"><b>Message :</b> </label>
                    
                    <textarea name="FeedBack" rows="5" cols="80"  readonly><?php echo "$result[FeedBack]";?></textarea>
                </div>
                <div class="labelbox2">
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
