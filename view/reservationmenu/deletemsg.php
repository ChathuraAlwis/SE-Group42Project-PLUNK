<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/deletemsg.css">

  </head>
  <body>
        <div class="main" >

          <form action="../../controller/CRUD.php" method="POST">    
            <input name="delete-reservation" type="hidden"/>
            <input name="ReservationName" type="hidden" value="<?php echo $_GET['ReservationName'];?>"/> 
              <div class="detailtable">
                <h3><b>Are you sure you want to delete this place</b> </h3>

                    <div class="btn">                            
                      <button type="Submit" name="Submit"><b>Yes</b></button>
                      <button type="button" name="cancel" value="cancel"><a class="cancel" href="Reservationmenupage.php"><b>No</b> </a></button>
                    </div>

              </div>
          </form>   

                </div>


  </body>
</html>
