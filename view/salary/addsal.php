<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/crud.css">

  </head>
  <body>

    <div class="main">
    <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>New Salary Sheet</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
                <input name ="add-salary" type="hidden" >
                <table>
                    <tr>
                        <div class="form-group">
                            <td><label for="Year">Year</label></td>
                            <td></td>
                            <td><input type="number" id= "Year" name="Year" required class="form-control" placeholder="Enter the Year"/></td>
                        </div>
                    </tr>
                    <tr><td><br></td></tr>
                <tr>
                <div class="form-group">
                    <td><label for="Month">Month</label></td>
                    <td></td>
                    <td><select id="Month" name="Month" class="form-control" placeholder="Enter the Month" onchange="changeType(this);">
                    <option selected>Choose month...</option>
                        <option value="1">January</option>
                        <option value="2">February</option>
                        <option value="3">March</option>
                        <option value="4">April</option>
                        <option value="5">May</option>
                        <option value="6">June</option>
                        <option value="7">July</option>
                        <option value="8">August</option>
                        <option value="9">September</option>
                        <option value="10">October</option>
                        <option value="11">November</option>
                        <option value="12">December</option>
                     </select></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Days">No Of Working Days</label></td>
                        <td></td>
                        <td><input type="number" id= "Days" name="Days" required class="form-control" placeholder="Enter the working days"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
            </table>


                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit" ><a class="addpage" href="..\salary\details.php">Add</a></button>
                    <button type="reset" name="reset" value="Reset" class="button reset" >Reset</button>
                </div>
        </form>
    </div>
</div>
<div class= right>
            <div class="righttable">
            <div class="itemtable">
                <h3>SALARY TABLE</h3>
                <iframe src="details.php" class="item"></iframe>
            </div>
    </div>
    </div>
    </div>

  </body>


</html>
