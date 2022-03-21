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
                        $leaveTable = new Table("leave");
                        if($_SESSION['UserType'] == 'Accountant'){
                          if(isset($_GET['name']) and isset($_GET['month'])){
                            $month = substr($_GET['month'],0,7);
                            $leaveTable->show("select *, sum(Leaves) over (order by NewTable.Leaves) as Total FROM (SELECT user.UserName as Name, LeaveType as 'Type', sum(NoOfdays) as Leaves FROM plunk.leave INNER JOIN plunk.user where plunk.leave.UserID=user.UserID and user.UserName LIKE '%$_GET[name]%' and LeaveDate LIKE '$month%' and Accepted='Yes' group by LeaveType) as NewTable;", '../salary/add');
                          }else{
                            echo "<h3>Search leaves by member name and salary month.<h3>";
                          }
                        }
                        else{
                          $leaveTable->show("SELECT LeaveDate As 'Leave Date',LeaveType AS 'Leave Type', NoOfdays AS 'No of leave days',Reason,Accepted FROM plunk.leave where UserID = '$_SESSION[UserID]';", 'update');
                        }
                        
                      ?> 
                    </div>

                </div>


  </body>
</html>
