<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/tabledesign.css">

  </head>
  <body>
        <div class="main" >

                    <div class="detailtable">
                      <?php
                          require_once "..\..\controller\showtable.php";
                          $orderTable = new Table("user");
                          $orderTable->show("SELECT DisplayID as 'Member ID',Name, UserType as 'Member Type', Email as 'E-mail', ContactNo as 'Contact No', JoinedYear as 'Joined Date' FROM plunk.user WHERE UserType in ('Life Member','Ordinary Member','HL Member')", false);
                       ?>


                    </div>

                </div>


  </body>
</html>
