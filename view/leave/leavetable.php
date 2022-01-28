<?php
session_start();?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/tablehome.css">

  </head>
  <body>
        <div class="main" >

                    <div class="detailtable">

                    <?php
                        require_once "../../controller/showtable.php";
                        $itemTable = new Table("leave");

                        if($_SESSION['UserType'] == 'Manager'){
                          if(isset($_GET['leavesearch'])){
                            $search = $_GET['leavesearch'];
                            $sql = "SELECT * FROM plunk.leave WHERE LeaveDate='$search'";
                            if(isset($_GET['OrderBy'])){
                              $orderBy = str_replace("-", " ", $_GET['OrderBy']);
                              $sql .= " ORDER BY '$orderBy'";
                            }
                            $itemTable->show($sql, 'givepermission');
                          }
                          else{
                            $sql = "SELECT * FROM plunk.leave";
                            if(isset($_GET['OrderBy'])){
                              $orderBy = str_replace("-", " ", $_GET['OrderBy']);
                              $sql .= " ORDER BY '$orderBy'";
                            }
                            $itemTable->show($sql, "givepermission");
                          }
                        }
                        else{
                          if(isset($_GET['leavesearch'])){
                            $search = $_GET['leavesearch'];
                            $sql = "SELECT LeaveDate As 'Leave Date',LeaveType AS 'Leave Type', NoOfdays AS 'No of leave days',Reason,Accepted FROM plunk.leave where UserID = '$_SESSION[UserID]' and LeaveDate='$search'";
                            if(isset($_GET['OrderBy'])){
                              $orderBy = str_replace("-", " ", $_GET['OrderBy']);
                              $sql .= " ORDER BY '$orderBy'";
                            }
                            $itemTable->show($sql, 'update');
                          }
                          else{
                            $sql = "SELECT LeaveDate As 'Leave Date',LeaveType AS 'Leave Type', NoOfdays AS 'No of leave days',Reason,Accepted FROM plunk.leave where UserID = '$_SESSION[UserID]'";
                            if(isset($_GET['OrderBy'])){
                              $orderBy = str_replace("-", " ", $_GET['OrderBy']);
                              $sql .= " ORDER BY '$orderBy'";
                            }
                            $itemTable->show($sql, "update");
                          }
                         }

                      ?>
                    </div>

                </div>


  </body>
</html>
