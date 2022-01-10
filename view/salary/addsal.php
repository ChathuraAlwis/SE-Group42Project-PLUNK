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
                        <td><label for="Date">Date</label></td>
                    <td><input type="date" id= "Date" name="Date" required class="form-control" min="<?php echo date("Y-m-d") ?>" placeholder="Enter the Date"/></td>
                        </div>
                    </tr>
                    <tr><td><br></td></tr>
                
                <tr><td><br></td></tr>
                <tr>
                    <div class="form-group">
                        <td><label for="Days">No Of Working Days</label></td>
                        <td><input type="number" id= "Days" name="Days" required class="form-control" placeholder="Enter the working days"/></td>
                    </div>
                </tr>
                <tr><td><br></td></tr>
            </table>


                <div class="form-group">
                <button type="submit" name="submit" value="Submit" class="button submit" >Add</button>
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
