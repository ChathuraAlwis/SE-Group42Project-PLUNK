<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/feedbacktable.css">

  </head>
  <body>
        <div class="main" >

                    <div class="detailtable">
                      <?php session_start();

                          if (isset($_SESSION['UserType'])){
                          if ($_SESSION['UserType'] == 'Life Member' || $_SESSION['UserType'] == 'Ordinary Member' || $_SESSION['UserType'] == 'HL Member'){
                            require_once "..\..\controller\showtable.php";
                            $orderTable = new Table("feedback");
                            $orderTable->show("SELECT FeedBackID as 'Feedback ID',FeedBack as 'Feedback', FeedBackDate as 'Feedback Date',UserID as 'User ID',Reply,ReplyDate as 'Replyed Date', ReplyPersonID as 'Replyed Person ID' FROM plunk.feedback order by FeedBackID desc");
                          }
                          else {
                          require_once "..\..\controller\showtable.php";
                          $orderTable = new Table("feedback");
                          $orderTable->show("SELECT FeedBackID as 'Feedback ID',FeedBack as 'Feedback', FeedBackDate as 'Feedback Date',UserID as 'User ID',Reply,ReplyDate as 'Replyed Date', ReplyPersonID as 'Replyed Person ID' FROM plunk.feedback order by FeedBackID desc", 'update');
                          }
                        }
                       ?>

                    </div>

                </div>


  </body>
</html>
