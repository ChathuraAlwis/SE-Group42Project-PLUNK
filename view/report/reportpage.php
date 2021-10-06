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
                    <div class>
                              <select id="ItemType" name="ItemType" class="search" placeholder="Enter the item type" onchange="changeType(this);">
                                    <option selected>Choose report type...</option>
                                    <option value="Salary">Salary report</option>
                                    <option value="ServiceCharge">Service Charge report</option>
                                    <option value="Leave">Leave report</option>
                                    <option value="Item">Item report</option>
                                    <option value="Invoice">Invoice report</option>
                              </select>
                        </div>

                        <div class = "search">
                              <input type= "date" placeholder="Enter the start date"/>
                              <button type = "Submit" class= "submit">Start Date</button>
                        </div>  

                        <div class = "search">
                              <input type= "date" placeholder="Enter the end date"/>
                              <button type = "Submit" class= "submit">End Date</button>
                        </div>  

                        
                    </div>
                    <div class="detailtable">

                        <iframe src="reporttable.php" class="staff"></iframe>
                  </div>
                </div>

            </div>


        </div>

  </body>
</html>

