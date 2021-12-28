<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/stafftable.css">

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
                                          <select id="ReportType" name="ReportType" class="search" placeholder="Choose report type..." onchange="changeType(this);">
                                                <option value="Salary">Salary report</option>
                                                <option value="ServiceCharge">Service Charge report</option>
                                                <option value="Leave">Leave report</option>
                                                <option value="Item">Item report</option>
                                                <option value="Invoice">Invoice report</option>
                                          </select>
                                    </div>
                                    <div >
                                          <input title="Start Date" name = "start" type = date class = "search" value="<?php if(isset($_POST['start'])) {echo $_POST['start'];} else {echo date("Y-m-d");}?>">
                                    </div>
                                    <div >
                                          <input title="End Date" name = "end" type = date class = "search" value="<?php if(isset($_POST['end'])) {echo $_POST['end'];} else {echo date("Y-m-d");}?>">
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

                                                case 'Salary':
                                                      echo "<iframe src=salary.php?start=$_POST[start]&end=$_POST[end] class=staff></iframe>";
                                                      break;
                                
                                                case 'ServiceCharge':
                                                      break;
                                
                                                case 'Leave':
                                                      break;
                                
                                                case 'Item':
                                                      break;
                                
                                                case 'Invoice':
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

