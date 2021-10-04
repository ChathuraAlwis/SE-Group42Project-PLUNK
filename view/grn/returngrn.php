<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

        <meta charset="utf-8">
        <title>Bloomfield</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
        <link rel="stylesheet" href="../style/crud.css">
        <script type="text/javascript" src="../script/additem.js"></script>

  </head>
  <body>
    <div class="main">
      <div class= "left">
    <div class="form">
        <h2 class="center-text"><b>RETURN GRN</b></h2>
        <form action="../../controller/CRUD.php" method="POST">
          <input name ="add-leave" type="hidden" >
          <table class="formtable">           
                <div class="form-group">
                    <td><label for="Reason">Reason</label></td>
                    <td><textarea id= "Reason" name="Reason" required class="form-control" placeholder="Enter the Reason"></textarea></td>
                </div>
          </table>
                <div class="form-group">
                    <button type="submit" name="submit" value="Submit" class="button submit">Request</button>
                    <button type="submit" name="cancel" value="cancel" class="button submit"><a href="grntable.php">Cancel</a></button>
                </div>
        </form>        
      </div>
    </div>
    </div> 
  </body>

 
</html>
