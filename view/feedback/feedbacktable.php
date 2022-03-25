<!DOCTYPE html>
<?php session_start();
date_default_timezone_set("Asia/Kolkata");
require_once "..\..\controller\showtable.php";?>
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
                      <?php
                      $today= date("Y-m-d");

                            $orderTable = new Table("booking");
                          if(isset($_GET['UserID'])){
                            $search = $_GET['UserID'];
                            $sql = "SELECT FeedBackID as 'Feedback ID',FeedBack as 'Feedback', FeedBackDate as 'Feedback Date',Reply,ReplyDate as 'Replyed Date', ReplyPersonID as 'Replyed Person ID' FROM plunk.feedback WHERE UserID LIKE ('%$search%')";

                            if(isset($_GET['OrderBy'])){
                              $sql .= " ORDER BY $_GET[OrderBy]";
                            }
                              $orderTable->show($sql, 'update');
                          }
                          elseif (isset($_POST['history'])) {
                            $orderTable = new Table("feedback");
                            $orderTable->show("SELECT FeedBackID as 'Feedback ID',FeedBack as 'Feedback', FeedBackDate as 'Feedback Date',UserID as 'User ID',Reply,ReplyDate as 'Replyed Date', ReplyPersonID as 'Replyed Person ID' FROM plunk.feedback WHERE Reply IS NOT NULL order by FeedBackID desc", 'update');
                          }
                          else {


                          if ($_SESSION['UserType'] == 'Life Member' || $_SESSION['UserType'] == 'Ordinary Member' || $_SESSION['UserType'] == 'HL Member'){

                            $orderTable = new Table("feedback");
                            $orderTable->show("SELECT FeedBackID as 'Feedback ID',FeedBack as 'Feedback', FeedBackDate as 'Feedback Date',Reply,ReplyDate as 'Replyed Date', ReplyPersonID as 'Replyed Person ID' FROM plunk.feedback WHERE UserID='$_SESSION[UserID]' order by FeedBackID desc");
                          }
                          else {

                          $orderTable = new Table("feedback");
                          $orderTable->show("SELECT FeedBackID as 'Feedback ID',FeedBack as 'Feedback', FeedBackDate as 'Feedback Date',UserID as 'User ID',Reply,ReplyDate as 'Replyed Date', ReplyPersonID as 'Replyed Person ID' FROM plunk.feedback WHERE Reply IS NULL order by FeedBackID desc", 'update');

                        }
                      }
                       ?>

                    </div>

                </div>


  </body>
</html>
