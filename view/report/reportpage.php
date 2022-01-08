<?php session_start() ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

      <meta charset="utf-8">
      <title>Bloomfield</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
      <link rel="stylesheet" href="../style/stafftable.css">

      <script>
            function myFunction() {
                  var x = document.getElementById("ReportType");
                  var p = document.getElementById("end");
                  if (x.value === "DailySales" || x.value === "MonthlySales") {
                        p.style.display = "none";
                  } else {
                        p.style.display = "block";
                  }
            }
      </script>

  </head>
  <body>
      <div class="main" >
            <div class="coverheader">

                  <div class="tableheader">
                        <div class="innerdiv">
                        </div>
                        <h2>Report</h2>
                  </div>
            </div>
            <div class="covertable">
                  <div class="table">
                        <div>
                              <form action="reportpage.php" method="post">
                                    <div class>
                                          <select id="ReportType" name="ReportType" class="search" placeholder="Choose report type..." onchange="myFunction();">
                                                <option value="Salary" <?php if(isset($_POST['ReportType'])) {if($_POST['ReportType'] == "Salary") {echo "selected";}}?>>Salary</option>
                                                <option value="Leave" <?php if(isset($_POST['ReportType'])) {if($_POST['ReportType'] == "Leave") {echo "selected";}}?>>Leave</option>
                                                <option value="ReturnGRN" <?php if(isset($_POST['ReportType'])) {if($_POST['ReportType'] == "ReturnGRN") {echo "selected";}} if($_SESSION['UserType'] != "Restaurant Manager" and $_SESSION['UserType'] != "Manager"){echo "hidden";}?>>Return GRN</option>
                                                <option value="DailySales" <?php if(isset($_POST['ReportType'])) {if($_POST['ReportType'] == "DailySales") {echo "selected";}} if($_SESSION['UserType'] != "Accountant" and $_SESSION['UserType'] != "Restaurant Manager" and $_SESSION['UserType'] != "Manager"){echo "hidden";}?>>Daily Sales</option>
                                                <option value="MonthlySales" <?php if(isset($_POST['ReportType'])) {if($_POST['ReportType'] == "MonthlySales") {echo "selected";}} if($_SESSION['UserType'] != "Accountant" and $_SESSION['UserType'] != "Restaurant Manager" and $_SESSION['UserType'] != "Manager"){echo "hidden";}?>>Monthly Sales</option>
                                                <option value="ServiceCharge" <?php if(isset($_POST['ReportType'])) {if($_POST['ReportType'] == "ServiceCharge") {echo "selected";}} if($_SESSION['UserType'] != "Accountant"){echo "hidden";}?>>Service Charge</option>
                                                      
                                          </select>
                                    </div>
                                    <div >
                                          <input title="Start Date" name = "start" type = date class = "search" value="<?php if(isset($_POST['start'])) {echo $_POST['start'];} else {echo date("Y-m-d");}?>">
                                    </div>
                                    <div >
                                          <input title="End Date" id = "end" name = "end" type = date class = "search" value="<?php if(isset($_POST['end'])) {echo $_POST['end'];} else {echo date("Y-m-d");}?>">
                                          <script>myFunction()</script>   
                                    </div>
                                    <div >
                                          <button type="submit" class = "reportsearch">Generate</button>
                                    </div>
                              </form>
                        </div>
                        <div class="detailtable">
                              <?php
                              
                                    if(isset($_POST['ReportType'])){
                                          switch ($_POST['ReportType']) {

                                                case 'DailySales':
                                                      echo "<iframe src=DailySales.php?today=$_POST[start] class=staff></iframe>";
                                                      break;

                                                case 'MonthlySales':
                                                      echo "<iframe src=MonthlySales.php?today=$_POST[start] class=staff></iframe>";
                                                      break;

                                                case 'Salary':
                                                      echo "<iframe src=salary.php?start=$_POST[start]&end=$_POST[end] class=staff></iframe>";
                                                      break;

                                                case 'ReturnGRN':
                                                      echo "<iframe src=ReturnGRN.php?start=$_POST[start]&end=$_POST[end] class=staff></iframe>";
                                                      break;
                                
                                                case 'ServiceCharge':
                                                      echo "<iframe src=serviceCharge.php?start=$_POST[start]&end=$_POST[end] class=staff></iframe>";
                                                      break;
                                
                                                case 'Leave':
                                                      echo "<iframe src=leave.php?start=$_POST[start]&end=$_POST[end] class=staff></iframe>";
                                                      break;
                                                default:
                                                      break;
                                            }
                                    }
                              
                              ?>
                              
                        </div>
                  </div>

            </div>

      </div>

  </body>
</html>

