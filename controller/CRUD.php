<?php
    session_start();
    require_once "../model/database.php";
    require_once "pages.php";
    date_default_timezone_set("Asia/Colombo");
    //--------------------------------------------------------order--------------------------------------------------------
    if(isset($_POST['add-order'])){
        $DB = new DB;
        $sql = "SELECT Display FROM plunk.restaurantmessage WHERE No ='1'";
        $result = $DB->runQuery($sql)[0];

        if($result['Display'] == 'Yes'){

            if($_POST['rowCount']!=0){
                try {
                    $sql = "INSERT INTO plunk.order (OrderDate, OrderTime, OrderPlace, Total, UserID) VALUES ('$_POST[OrderDate]', '$_POST[OrderTime]', '$_POST[OrderPlace]', '$_POST[Total]', '$_SESSION[UserID]');";
                    $DB->runQuery($sql);
                    $sql = "SELECT OrderID FROM plunk.order ORDER BY OrderID ASC;";
                    $OrderID = end($DB->runQuery($sql))['OrderID'];
                    $itemRow = 1;
                    $rowCount = $_POST['rowCount'];
                    while($rowCount > 0){
                        if(isset($_POST['ItemID' . $itemRow])){
                            $rowCount--;
                            $ItemRow = 'ItemID' . $itemRow;
                            $QuanRow = 'Quantity' . $itemRow;
                            $sql = "INSERT INTO plunk.orderitem (OrderID, ItemID, Quantity) VALUES ('$OrderID', '$_POST[$ItemRow]',  '$_POST[$QuanRow]');";
                            $DB->runQuery($sql);
                            $sql = "UPDATE plunk.item SET Quantity = Quantity - $_POST[$QuanRow] WHERE ItemID = $_POST[$ItemRow];";
                            $DB->runQuery($sql);
                            $sql = "UPDATE plunk.item SET Availability = IF(Quantity<=0, 'No', 'Yes') WHERE ItemID = $_POST[$ItemRow];";
                            $DB->runQuery($sql);
                        }
                        $itemRow++;
                    }
                    $billPrice = $_POST['BillTotal'];
                    echo $billPrice;
                    $sql = "INSERT INTO plunk.bill (CustomerName, Price, Discount, BillDate, UserID, OrderID) VALUES('$_POST[CustomerName]', '$billPrice', $_POST[Discount], '$_POST[OrderDate]', '$_SESSION[UserID]', $OrderID)";
                    $DB->runQuery($sql);
                    $sql = "SELECT * FROM plunk.bill ORDER BY BillID DESC LIMIT 1;";
                    $BillData = $DB->runQuery($sql);
                    $record = http_build_query(array('record' => $BillData));
                    $newPage = new Page("../view/bill/add.php?data=$record");
                    $newPage->show();
                } catch (\Throwable $th) {
                    throw $th;
                }
            }
            else{
                echo "<script>alert('Order was Incomplete. Please check again before Adding order.')</script>";
                // print_r($_COOKIE);
            }
        }
        else{
            $newPage = new Page("../view/order/ordereror.html");
            $newPage->show();
        }
    }

    if(isset($_POST['delete-order'])){
        $DB = new DB;

        try {
            $sql = "DELETE FROM plunk.order WHERE Order_ID=\"$_POST[Order_ID]\"";
            $DB->runQuery($sql);
        } catch (\Throwable $th) {
            throw $th;
        }

    }

    if(isset($_POST['update-order'])){
        $DB = new DB;

        try {;
            $sql = "UPDATE plunk.order SET OrderDate=\"$_POST[OrderDate]\", OrderTime=\"$_POST[OrderTime]\", OrderPlace=\"$_POST[OrderPlace]\", Total=\"$_POST[Total]\", UserID=\"$_POST[UserID]\" WHERE OrderID=\"$_POST[OrderID]\"";
            $DB->runQuery($sql);
        } catch (\Throwable $th) {
            throw $th;
        }

    }

    if(isset($_POST['search-order'])){
        $DB = new DB;

        try {
            $sql = "SELECT * FROM plunk.order WHERE Order_ID=\"$_POST[Order_ID]\"";
            $result = $DB->runQuery($sql);
            $rows = count($result, 0);
            if ($rows == 0){
                echo "Could not find Order: " . $_POST['Order_ID'] . "\n";
            }
            elseif ($rows > 1){
                echo "Multiple rows found. Please contact Admit to resolve issues.\n";
            }
            else{
                $row = $result[0];
                echo "Order ID\t:" . $row['Order_ID'] . "\n";
                echo "Order Place\t:" . $row['Order_Place'] . "\n";
                echo "Quantity\t:" . $row['Quantity'] . "\n";
                echo "Memebr ID\t:" . $row['Member_ID'] . "\n";
                echo "Staff ID\t:" . $row['Staff_ID'] . "\n";
            }

        } catch (\Throwable $th) {
            throw $th;
        }

    }

    //--------------------------------------------------------bill--------------------------------------------------------
    if(isset($_POST['pay-bill'])){
        $DB = new DB;
        print_r($_POST);
        try {
            $sql = "UPDATE plunk.bill SET Paid=2 WHERE BillID=$_POST[BillID];";
            $DB->runQuery($sql);
            $newPage = new Page("../view/Dashboards/cashierdash.php");
            $newPage->show();
        } catch (\Throwable $th) {
            throw $th;
        }

    }

    if(isset($_POST['update-bill'])){
        $DB = new DB;

        try {
            $sql = "UPDATE plunk.bill SET $_POST[Column]=\"$_POST[Value]\" WHERE Bill_ID=\"$_POST[Bill_ID]\"";
            $DB->runQuery($sql);
        } catch (\Throwable $th) {
            throw $th;
        }

    }

    if(isset($_POST['search-bill'])){
        $DB = new DB;

        try {
            $sql = "SELECT * FROM plunk.bill WHERE Bill_ID=\"$_POST[Bill_ID]\"";
            $result = $DB->runQuery($sql);
            $rows = count($result, 0);
            if ($rows == 0){
                echo "Could not find Bill: " . $_POST['Bill_ID'] . "\n";
            }
            elseif ($rows > 1){
                echo "Multiple rows found. Please contact Admit to resolve issues.\n";
            }
            else{
                $row = $result[0];
                echo "Bill ID\t:" . $row['Bill_ID'] . "\n";
                echo "Payment Type\t:" . $row['Payment_Type'] . "\n";
                echo "Discount\t:" . $row['Discount'] . "\n";
                echo "Steward Name\t:" . $row['Steward_Name'] . "\n";
                echo "Staff ID\t:" . $row['Staff_ID'] . "\n";
                echo "Order ID\t:" . $row['Order_ID'] . "\n";
            }
        } catch (\Throwable $th) {
            throw $th;
        }

    }

//---------------------------------------------------Item-----------------------------------------------------------------------
//---------Add Item------------

if(isset($_POST['add-item'])){
    $DB = new DB;

    try {
        if($_POST['ItemType'] != "Choose type..."){
            if($_POST['Company'] != "Select the Company"){
                $sql = "INSERT INTO plunk.item (ItemID, Company,ItemName, PurchasePrice,SellingPrice, Discount, Availability , Quantity, ItemType, ReorderQuantity,IsDeleted) VALUES ( '' , '$_POST[Company]','$_POST[ItemName]', '$_POST[PurchasePrice]',  '$_POST[SellingPrice]','$_POST[Discount]', '$_POST[Availability]', '0','$_POST[ItemType]','$_POST[ReorderQuantity]','No');";
                $DB->runQuery($sql);
                $newPage = new Page('../view/items/additemsuccess.html');
                $newPage->show();

            }
            else{
                $newPage = new Page('../view/items/companyerror.html');
                $newPage->show();

            }
        }
        else{
            $newPage = new Page('../view/items/Itemtypeerror.html');
            $newPage->show();
        }

    } catch (\Throwable $th) {
        throw $th;
    }

}
//---------Update Item------------

if(isset($_POST['update-item'])){
    $DB = new DB;

    try {
        if($_POST['ItemType'] != "Choose type..."){
            $sql = "UPDATE plunk.item SET `ItemID`='$_POST[ItemID]',`ItemType`='$_POST[ItemType]',`Company`='$_POST[Company]',`ItemName`='$_POST[ItemName]',`PurchasePrice`='$_POST[PurchasePrice]',`SellingPrice`='$_POST[SellingPrice]',`Quantity`='$_POST[Quantity]',`Discount`='$_POST[Discount]',`Availability`='$_POST[Availability]',`ReorderQuantity`='$_POST[ReorderQuantity]' WHERE `ItemID` = '$_POST[ItemID]'";
            $DB->runQuery($sql);
            $newPage = new Page('../view/items/updateitemsuccess.html');
            $newPage->show();
        }
        else{
            $newPage = new Page('../view/items/Itemtypeerror.html');
            $newPage->show();
        }
    } catch (\Throwable $th) {
        throw $th;
    }


}

//-----------Delete Item--------------------
if(isset($_POST['delete-item'])){
    $DB = new DB;
    try {

            if($_POST['Quantity'] == 0){
                $sql = "UPDATE plunk.item SET `IsDeleted`= 'Yes' WHERE `ItemID` = '$_POST[ItemID]'";
                $DB->runQuery($sql);
                $newPage = new Page('../view/items/deleteitemsuccess.html');
                $newPage->show();
            }
        else{
            $newPage = new Page('../view/items/qerror.html');
            $newPage->show();
        }
    } catch (\Throwable $th) {
        throw $th;
    }


}

//-----------Search Item---------------------


//---------------------------------------------------GRN---------------------------------------------------------------------------

//------------Add GRN-------------------------

if(isset($_POST['add-grn'])){
    $DB = new DB;

    try {
        if($_POST['ItemType'] != "Choose type..."  || $_POST['CompanyName'] != "Not Selected"){

            $sql1 = "INSERT INTO plunk.grn (`GRNID`, `CompanyName`, `AddDate`, `ItemType`, `UserID`) VALUES ( '' , '$_POST[CompanyName]','$_POST[AddDate]','$_POST[ItemType]','$_SESSION[UserID]');";
            //echo $sql;
            $DB->runQuery($sql);

            $rowCount = $_POST['rowCount'];
            // echo $rowCount;
            if($rowCount == 0){
                $newPage = new Page('../view/grn/addgrnitemserror.html');
                $newPage->show();
            }
            else{
               $DB->runQuery($sql1);
               $sql = "SELECT GRNID FROM plunk.grn;";
               $GRNID = end($DB->runQuery($sql))['GRNID'];
               $GRNRow = 1;
            }
            while($rowCount > 0){
                if(isset($_POST['ItemID' . $GRNRow])){
                    $rowCount--;
                    $grnRow = 'ItemID' . $GRNRow;
                    //$itemname = 'ItemName'. $GRNRow;
                    $QuanRow = 'Quantity' . $GRNRow;
                    $sql = "INSERT INTO plunk.grnitem (GRNID, ItemID,ItemName, Quantity) VALUES ('$GRNID', '$_POST[$grnRow]','$_POST[ItemName]','$_POST[$QuanRow]');";
                    //echo $sql;
                    $DB->runQuery($sql);
                    $sql = "UPDATE plunk.item SET Quantity = Quantity + $_POST[$QuanRow] WHERE ItemID = $_POST[$grnRow];";
                    // echo $sql;
                    $DB->runQuery($sql);
                    $sql = "UPDATE plunk.invoice SET AddToGRN = 'Yes' WHERE InvoiceID = $_POST[id]";
                    // echo $sql;
                    $DB->runQuery($sql);
                }
                $GRNRow++;
            }
            $newPage = new Page('../view/grn/addgrnsuccess.html');
            $newPage->show();

        }
        else{
            $newPage = new Page('../view/grn/invoiceerror.html');
            $newPage->show();
        }

    } catch (\Throwable $th) {
        throw $th;
    }

}

//--------------Return GRN--------------------------

if(isset($_POST['return-grn'])){
    $DB = new DB;

    try {
       $sql = "SELECT * FROM plunk.grn WHERE GRNID = $_POST[GRNID]";
       $result = $DB->runQuery($sql)[0];

       $sql = "INSERT INTO plunk.returngrn(`GRNID`, `CompanyName`, `AddDate`, `ItemType`, `ReturnDate`, `Reason`, `UserID`, `Accepted`) VALUES ('$result[GRNID]','$result[CompanyName]','$result[AddDate]','$result[ItemType]','$_POST[ReturnDate]','$_POST[Reason]','$_SESSION[UserID]','No')";
       //echo $sql;
       $DB->runQuery($sql);
       $sql = "SELECT  `ItemID` FROM plunk.grnitem WHERE GRNID = $_POST[GRNID]";
       //echo $sql;
       $result= $DB->runQuery($sql);

       $counter = count($result);
       $index = 0;

       while($counter>$index){
            $id = $result[$index]['ItemID'];
            $sql2 = "SELECT `GRNID`, `ItemID`, `ItemName`, `Quantity` FROM plunk.grnitem WHERE GRNID = '$_POST[GRNID]' AND ItemID = $id";
            // echo $sql2;
            $result2= $DB->runQuery($sql2)[0];

            $sql3 = "INSERT INTO plunk.returngrnitem(`GRNID`, `ItemID`, `ItemName`, `Quantity`) VALUES ('$result2[GRNID]','$result2[ItemID]','$result2[ItemName]','$result2[Quantity]')";
            // echo $sql3;
            $DB->runQuery($sql3);

            $index++;
        }

        $newPage = new Page('../view/grn/requestgrnsuccess.html');
        $newPage->show();

    }
    catch (\Throwable $th) {
        throw $th;

    }

}

//--------------Give permission to return GRN-----------------------

if(isset($_POST['permission-return-grn'])){
    $DB =new DB;
    
    if($_POST['accept'] == 'Yes'){

        try{
            $sql = "SELECT Accepted FROM plunk.returngrn WHERE GRNID='$_POST[GRNID]' ";
            $result = $DB->runQuery($sql)[0];
            
            if($result['Accepted'] == 'Yes'){
                $newPage = new Page('../view/grn/alreadyacceptmsg.html');
                $newPage->show();

            }
            else{
                $sql = "UPDATE plunk.returngrn SET `Accepted`='Yes' WHERE `GRNID`='$_POST[GRNID]' ";
                //echo $sql;
                $DB->runQuery($sql);

                $sql = "SELECT  `ItemID` FROM plunk.grnitem WHERE GRNID = $_POST[GRNID]";
                // echo $sql;
                $result= $DB->runQuery($sql);

                $counter = count($result);
                $index = 0;
                
                while($counter>$index){
                    $id = $result[$index]['ItemID'];
                    $sql2 = "SELECT Quantity FROM plunk.grnitem WHERE GRNID = '$_POST[GRNID]' AND ItemID = $id";
                    // echo $sql2;
                    $result1 = $DB->runQuery($sql2)[0];
                    // echo  $result1['Quantity'];

                    $sql3 = "UPDATE plunk.item SET Quantity = Quantity - $result1[Quantity] WHERE ItemID = $id";
                    // echo $sql3;
                    $DB->runQuery($sql3);

                    $sql4 = "SELECT Quantity FROM plunk.item WHERE ItemID = $id";
                    // echo $sql4;
                    $result2 = $DB->runQuery($sql4)[0];

                    if($result2['Quantity'] <= 0){
                        $sql3 = "UPDATE plunk.item SET Availability = 'No' WHERE ItemID = $id";
                        // echo $sql3;
                        $DB->runQuery($sql3);
                    }
                    

                    $index++;
                }

                $sql = "DELETE FROM plunk.grn WHERE GRNID = '$_POST[GRNID]' ";
                // echo $sql;
                $DB->runQuery($sql);

                $sql = "DELETE FROM plunk.grnitem WHERE GRNID = '$_POST[GRNID]' ";
                // echo $sql;
                $DB->runQuery($sql);

                $newPage = new Page('../view/grn/requestacceptmg.html');
                $newPage->show();
                
            }

        }
                
        catch(\Throwable $th) {
            throw $th;
    
        }

    }
    else {
        try{
            $sql = "SELECT Accepted FROM plunk.returngrn WHERE GRNID='$_POST[GRNID]' ";
            $result = $DB->runQuery($sql)[0];
            
            if($result['Accepted'] == 'Yes'){
                $newPage = new Page('../view/grn/alreadyacceptmsg.html');
                $newPage->show();

            }
            else{
                $sql = "DELETE FROM plunk.returngrn WHERE GRNID = '$_POST[GRNID]' ";
                // echo $sql;
                $DB->runQuery($sql);

                $sql = "DELETE FROM plunk.returngrnitem WHERE GRNID = '$_POST[GRNID]' ";
                // echo $sql;
                $DB->runQuery($sql);

                $newPage = new Page('../view/grn/requestdenied.html');
                $newPage->show();
            }
            
        }
            
        catch(\Throwable $th) {
            throw $th;
    
        }
    }
}

//---------------------------------------------------Invoice-----------------------------------------------------------------------
    if(isset($_POST['add-invoice'])){
        $DB = new DB;
        //if($_POST['rowCount']!=0){

            try {
                if($_POST['ItemType'] != "Choose type..."){
                    $sql = "INSERT INTO plunk.invoice (Company, Type, ReceivedDate, DueDate, Total, UserID ) VALUES ('$_POST[CompanyName]', '$_POST[ItemType]', '$_POST[ReceivedDate]', '$_POST[DueDate]', '$_POST[Total]','$_SESSION[UserID]');";
                    //echo $sql;
                    $DB->runQuery($sql);
                    //$sql = "SELECT InvoiceID FROM plunk.invoice;";
                    //$InvoiceID = end($DB->runQuery($sql))['InvoiceID'];
                // $itemRow = 1;
                // $rowCount = $_POST['rowCount'];
                // while($rowCount > 0){
                //     if(isset($_POST['ItemID' . $itemRow])){
                //         $rowCount--;
                //         $IDRow = 'ItemID' . $itemRow;
                //         $NameRow = 'ItemName' . $itemRow;
                //         $QuanRow = 'Quantity' . $itemRow;
                //         $sql = "INSERT INTO plunk.invoiceitem (InvoiceID, ItemID, ItemName, Quantity) VALUES ('$InvoiceID', '$_POST[$IDRow]', '$_POST[$NameRow]',  '$_POST[$QuanRow]');";
                //         $DB->runQuery($sql);
                        $newPage = new Page('../view/invoice/addinvoicesuccess.html');
                        $newPage->show();

                        // $sql = "UPDATE plunk.item SET Quantity = Quantity + $_POST[$QuanRow] WHERE ItemID = $_POST[$ItemRow];";
                        // $DB->runQuery($sql);
                    }
                    //$itemRow++;

            else{
                $newPage = new Page('../view/invoice/Invoicetypeerror.html');
                $newPage->show();
            }

            } catch (\Throwable $th) {
                throw $th;
            }
        //}
    }
//---------Update Invoice------------

if(isset($_POST['update-invoice'])){
    $DB = new DB;

    try {
        $sql = "UPDATE plunk.invoice SET `InvoiceID`='$_POST[InvoiceID]',`Company`='$_POST[Company]',`Type`='$_POST[Type]',`ReceivedDate`='$_POST[ReceivedDate]',`DueDate`='$_POST[DueDate]',`Total`='$_POST[Total]'  WHERE InvoiceID = '$_POST[InvoiceID]'";
        $DB->runQuery($sql);
        $newPage = new Page('../view/invoice/updateinvoicesuccess.html');
        $newPage->show();
    } catch (\Throwable $th) {
        throw $th;
    }

}

if(isset($_POST['search-invoice'])){
    $DB = new DB;

    try {
        $sql = "SELECT * FROM plunk.invoice WHERE InvoiceID=\"$_POST[InvoiceID]\"";
        $result = $DB->runQuery($sql);
        $rows = count($result, 0);
        if ($rows == 0){
            echo "Could not find Invoice: " . $_POST['InvoiceID'] . "\n";
        }
        elseif ($rows > 1){
            echo "Multiple rows found. Please contact Admit to resolve issues.\n";
        }
        else{
            $row = $result[0];
            echo "Invoice ID\t:" . $row['InvoiceID'] . "\n";
            echo "Company\t:" . $row['Companyname'] . "\n";
            echo "Type\t:" . $row['Type'] . "\n";
            echo "Received Date\t:" . $row['ReceivedDate'] . "\n";
            echo "Due Date\t:" . $row['DueDate'] . "\n";
            echo "Total\t:" . $row['Total'] . "\n";
        }
    } catch (\Throwable $th) {
        throw $th;
    }

}
//--Delete
if(isset($_POST['delete-invoice'])){
    $DB = new DB;

    try {
        $sql = "SELECT * FROM plunk.invoice WHERE InvoiceID=$_POST[InvoiceID]";
        $data = $DB->runQuery($sql)[0];
        //print_r($data);
        $sql2 = "INSERT INTO plunk.deleteinvioce(`InvoiceID`, `Company`, `Type`, `ReceivedDate`, `DueDate`, `Total`, `DeleteDate`, `Reason`, `UserID`) VALUES ('$data[InvoiceID]','$data[Company]','$data[Type]','$data[ReceivedDate]','$data[DueDate]','$data[Total]','$_POST[DeleteDate]','$_POST[Reason]','$data[UserID]')";
        $DB->runQuery($sql2);
        $sql3 = "DELETE FROM plunk.invoice WHERE InvoiceID=$_POST[InvoiceID]";
        $DB->runQuery($sql3);

        $newPage = new Page('../view/invoice/deleteinvoicesuccess.html');
        $newPage->show();
    } catch (\Throwable $th) {
        throw $th;
    }

}

//---------------------------------------------------User-----------------------------------------------------------------------
//---------------------sign up----------------------
if(isset($_POST['joinrequest'])){
    $DB = new DB;

    try {
          $sql = "INSERT INTO plunk.signup (SignupID, Name, Email, ContactNo, JoinedYear,UserType, ProfilePic) VALUES ( '' , '$_POST[Name]', '$_POST[Email]', '$_POST[ContactNo]','$_POST[JoinedYear]','$_POST[UserType]','$_POST[image]')";
         $DB->runQuery($sql);

         $newPage = new Page('..\view\user\requestsuccess.html');
         $newPage->show();

    } catch (\Throwable $th) {
        throw $th;
    }
}
//-------------give approve for requests---------------
if(isset($_POST['give-approve'])){
    $DB = new DB;
    $pw="$_POST[Password]";
    $day = date("Y-m-d");
    if (is_null($pw)) {
      $pw="$_POST[DisplayID]";
    }

    try {
        $sql = "UPDATE plunk.signup SET UserName='$_POST[UserName]', Password='$pw',DisplayID='$_POST[DisplayID]',JoinedYear='$day', Approval='Yes' WHERE SignupID='$_POST[SignupID]'";
        $DB->runQuery($sql);


    } catch (\Throwable $th) {
        throw $th;
    }
    $hashedpassword = Password_hash("$pw", PASSWORD_BCRYPT);

    try {
          $sql = "INSERT INTO plunk.user (UserID, Name, UserName, Password, Email, ContactNo, JoinedYear, DisplayID,UserType) VALUES ( '' , '$_POST[Name]',  '$_POST[UserName]','$hashedpassword', '$_POST[Email]', '$_POST[ContactNo]','$day','$_POST[DisplayID]','$_POST[UserType]')";
         $DB->runQuery($sql);
         $newPage = new Page('..\view\user\approvalsuccess.html');
         $newPage->show();

    } catch (\Throwable $th) {
        throw $th;
    }

}
//------------------request denied-------------------------
if(isset($_POST['denied'])){
    $DB = new DB;


    try {
        $sql = "UPDATE plunk.signup SET Reason='$_POST[Reason]', Approval='No' WHERE SignupID='$_POST[SignupID]'";
        $DB->runQuery($sql);
        $newPage = new Page('..\view\user\approvaldenied.html');
        $newPage->show();

    } catch (\Throwable $th) {
        throw $th;
    }

}

//---------------------Add, update and delete user--------------------------
if(isset($_POST['add-staff'])||isset($_POST['add-member'])){
    $DB = new DB;

    $hashedpassword = Password_hash("$_POST[Password]", PASSWORD_BCRYPT);

    try {
          $sql = "INSERT INTO plunk.user (UserID, Name, UserName, Password, Email, ContactNo, JoinedYear, DisplayID,UserType) VALUES ( '' , '$_POST[Name]',  '$_POST[UserName]','$hashedpassword', '$_POST[Email]', '$_POST[ContactNo]','$_POST[JoinedYear]','$_POST[DisplayID]','$_POST[UserType]')";
         $DB->runQuery($sql);
         $type="$_POST[UserType]";
         if($type=='Manager'||$type=='Admin'||$type=='Accountant'||$type=='Restaurant Manager'||$type=='Cashier'||$type=='Staff Member'){
           $newPage = new Page('..\view\user\success.html');
           $newPage->show();
         }
         elseif ($type=='Life Member'||$type=='Ordinary Member'||$type=='HL Member') {
           $newPage = new Page('..\view\user\Addmembersuccess.html');
           $newPage->show();
         }
         else {

               $sql = "DELETE FROM plunk.user WHERE DisplayID='$_POST[DisplayID]'";
               $DB->runQuery($sql);
               $newPage = new Page('..\view\user\Errormg.html');
               $newPage->show();

         }


    } catch (\Throwable $th) {
        throw $th;
    }
}

if(isset($_POST['update-user'])){
    $DB = new DB;

    try {
        $sql = "UPDATE plunk.user SET Name='$_POST[Name]', DisplayID='$_POST[DisplayID]',UserID='$_POST[UserID]', UserType='$_POST[UserType]', JoinedYear='$_POST[JoinedYear]', Email='$_POST[Email]', ContactNo='$_POST[ContactNo]' WHERE UserID='$_POST[UserID]'";
        $DB->runQuery($sql);
        $type="$_POST[UserType]";
        if($type=='Manager'||$type=='Admin'||$type=='Accountant'||$type=='Restaurant Manager'||$type=='Cashier'||$type=='Staff Member'){
          $newPage = new Page('..\view\user\updatestaffsuccess.html');
          $newPage->show();
        }
        elseif ($type=='Life Member'||$type=='Ordinary Member'||$type=='HL Member') {
          $newPage = new Page('..\view\user\updatemembersuccess.html');
          $newPage->show();
        }
    } catch (\Throwable $th) {
        throw $th;
    }

}

if(isset($_POST['delete-user'])){
    $DB = new DB;



    try {
          $sql = "INSERT INTO plunk.deleteuser (UserID, Name,  Email, ContactNo, JoinedYear, DisplayID,UserType,Reason) VALUES ( '$_POST[UserID]' , '$_POST[Name]',  '$_POST[Email]', '$_POST[ContactNo]','$_POST[JoinedYear]','$_POST[DisplayID]','$_POST[UserType]','$_POST[Reason]')";
         $DB->runQuery($sql);
    } catch (\Throwable $th) {
        throw $th;
    }

    try {
        $sql = "DELETE FROM plunk.user WHERE UserID='$_POST[UserID]'";
        $DB->runQuery($sql);
        $newPage = new Page('..\view\user\deleteusersuccess.html');
        $newPage->show();
    } catch (\Throwable $th) {
        throw $th;
    }

}
//---------------------------------------------------Nortification-----------------------------------------------------------------------
//---------Add notification------------

if(isset($_POST['add-notifications'])){
    $DB = new DB;

    try {
        if($_POST['EventType'] != "Choose type..."){
            $sql = "INSERT INTO plunk.notification (`NotificationID`, `FromDate`, `ToDate`, `EventType` ,`Message`, `UserID`) VALUES ( '' , '$_POST[FromDate]', '$_POST[ToDate]', '$_POST[EventType]',  '$_POST[Message]','$_SESSION[UserID]')";
            $DB->runQuery($sql);
            print_r($DB);
            $newPage = new Page('../view/notifications/addnotifysuccess.html');
            $newPage->show();
        }
        else{
            $newPage = new Page('../view/notifications/notificationtypeerror.html');
            $newPage->show();
        }

    } catch (\Throwable $th) {
        throw $th;
    }

}
//---------Update Notification------------
if(isset($_POST['update-notifications'])){
    $DB = new DB;

    try {
        if($_POST['EventType'] != "Choose type..."){
            $sql = "UPDATE plunk.notification SET `NotificationID`='$_POST[NotificationID]' ,`FromDate` = '$_POST[FromDate]', `ToDate` = '$_POST[ToDate]', `EventType` ='$_POST[EventType]' ,`Message` = '$_POST[Message]' WHERE `NotificationID` = '$_POST[NotificationID]'";
            $DB->runQuery($sql);
            $newPage = new Page('../view/notifications/updatenotifysuccess.html');
            $newPage->show();
        }
        else{
            $newPage = new Page('../view/notifications/notificationtypeerror.html');
            $newPage->show();
        }

    } catch (\Throwable $th) {
        throw $th;
    }

}
//-----------Delete Notification--------------------
if(isset($_POST['delete-notification'])){
    $DB = new DB;
    try {

        $sql = "DELETE FROM plunk.notification WHERE `NotificationID` = '$_POST[NotificationID]'";
        $DB->runQuery($sql);

        $newPage = new Page('../view/notifications/deletenotifysuccess.html');
        $newPage->show();

    } catch (\Throwable $th) {
        throw $th;
    }


}

//..........................................................Reservation Menu................................................................................

//---------Add Reservation Menu------------


if(isset($_POST['add-reservation'])){
    $DB = new DB;

    try {
        if($_POST['Type'] == "Restaurant" || $_POST['Type'] == "Club"){
            $sql = "SELECT ReservationName FROM plunk.reservationmenu";
            $names= $DB->runQuery($sql);
            $namecount = count($names);
            $index=0;
            while($index < $namecount){
                // print_r($names[$index]['ReservationName']);

                if($names[$index]['ReservationName'] == $_POST['ReservationName']){
                    $sql = "SELECT IsDeleted FROM plunk.reservationmenu WHERE ReservationName = '$_POST[ReservationName]'";
                    $IsDeleted=$DB->runQuery($sql)[0];

                    if($IsDeleted['IsDeleted'] == 'Yes'){
                        $sql = "UPDATE plunk.reservationmenu SET IsDeleted = 'No', Cost = $_POST[Cost], Type = '$_POST[Type]', Availability = '$_POST[Availability]' WHERE ReservationName = '$_POST[ReservationName]'";
                        break;
                    }
                    else{
                        echo "No";
                        $newPage = new Page('../view/reservationmenu/readdingerror.html');
                        $newPage->show();
                    }


                }else{

                    $sql = "INSERT INTO plunk.reservationmenu(`ReservationName`, `Type`, `Cost`,`Availability`, `IsDeleted`) VALUES ('$_POST[ReservationName]','$_POST[Type]','$_POST[Cost]','$_POST[Availability]','No')";

                }
                $index++;
            }
            $DB->runQuery($sql);

            $newPage = new Page('../view/reservationmenu/addreservationsuccess.html');
            $newPage->show();
        }
        else{
            $newPage = new Page('../view/reservationmenu/reservationtypeerror.html');
            $newPage->show();
        }

    } catch (\Throwable $th) {
        throw $th;
    }

}

//---------Update Reservation Menu------------
if(isset($_POST['update-reservation'])){
    $DB = new DB;

    try {
        if($_POST['Type'] == "Restaurant" || $_POST['Type'] == "Club" ){
            $sql = "UPDATE plunk.reservationmenu SET `ReservationName`='$_POST[ReservationName]',`Type`='$_POST[Type]',`Cost`='$_POST[Cost]',`Availability` = '$_POST[Availability]',`IsDeleted`='No' WHERE `ReservationName`='$_POST[ReservationName]'";
            $DB->runQuery($sql);
            $newPage = new Page('../view/reservationmenu/updateresrvationsuccesssuccess.html');
            $newPage->show();
        }
        else{
            $newPage = new Page('../view/reservationmenu/reservationtypeerror.html');
            $newPage->show();
        }

    } catch (\Throwable $th) {
        throw $th;
    }

}

//-----------Delete Reservation Menu--------------------
if(isset($_POST['delete-reservation'])){
    $DB = new DB;
    try {

        $sql = "UPDATE plunk.reservationmenu SET `IsDeleted` = 'Yes', Availability = 'No' WHERE `ReservationName` = '$_POST[ReservationName]'";
        $DB->runQuery($sql);

        $newPage = new Page('../view/reservationmenu/deleteressuccess.html');
        $newPage->show();

    }
    catch (\Throwable $th) {
        throw $th;
    }
}


//--------------------------------------------feedback-------------------------------------------
//----give feedback-------
if(isset($_POST['give-feedback'])){
    $DB = new DB;

    try {
        $sql = "INSERT INTO plunk.feedback (FeedBackID,FeedBack,FeedBackDate, UserID) VALUES ('','$_POST[FeedBack]','$_POST[CreatedDate]','$_SESSION[UserID]')";
        $DB->runQuery($sql);

        $newPage = new Page('..\view\feedback\feebacksuccess.html');
        $newPage->show();

    } catch (\Throwable $th) {
        throw $th;
    }

}
//----give reply--------
if(isset($_POST['reply-feedback'])){
    $DB = new DB;

    try {
        $sql = "UPDATE plunk.feedback SET Reply='$_POST[Reply]', ReplyDate='$_POST[replydDate]',ReplyPersonID='$_SESSION[UserID]' WHERE FeedBackID='$_POST[FeedBackID]'";
        $DB->runQuery($sql);

        $newPage = new Page('..\view\feedback\replysuccess.html');
        $newPage->show();

    } catch (\Throwable $th) {
        throw $th;
    }

}

//--------------------------------------------------------edit-profile--------------------------------------------------------
if(isset($_POST['edit-profile'])){
    $DB = new DB;

    //--------------------------------------------------------upload-profile-picture-------------------------------------------------------
   if(isset($_FILES['image'])){
      $errors= array();
      $file_name = $_FILES['image']['name'];
      $file_size = $_FILES['image']['size'];
      $file_tmp = $_FILES['image']['tmp_name'];
      $file_type = $_FILES['image']['type'];
      $file_ext=strtolower(end(explode('.',$_FILES['image']['name'])));

      $extensions= array("jpeg","jpg","png");

      if(in_array($file_ext,$extensions)=== false){
         $errors[]="extension not allowed, please choose a JPEG or PNG file.";
      }

      if($file_size > 2097152) {
         $errors[]='File size must be excately 2 MB';
      }

      if(empty($errors)==true) {
            // move_uploaded_file($file_tmp,"images/".$file_name);
            $image = $_FILES['image']['tmp_name'];
            $imgContent = addslashes(file_get_contents($image));

            // Insert image content into database
            $result = $DB->runQuery("UPDATE plunk.user SET ProfilePic='$imgContent' WHERE UserID=$_POST[UserID]");
      }else{
         print_r($errors);
      }
   }
    try {
        $sql = "UPDATE plunk.user SET Name='$_POST[Name]', ContactNo='$_POST[ContactNo]',Email='$_POST[Email]', UserName='$_POST[UserName]' WHERE UserID='$_POST[UserID]'";
        $DB->runQuery($sql);

        $newPage = new Page('..\view\profile\prfileui.php');
        $newPage->show();

    } catch (\Throwable $th) {
        throw $th;
    }
}

//--------------------------------------------------------update-password--------------------------------------------------------
if (isset($_POST['update-password'])){
    $DB = new DB;
    $query = "SELECT * FROM plunk.user WHERE UserID=$_SESSION[UserID]";
    $result = $DB->runQuery($query)[0];

    if (count($_POST) > 0) {
        $verify = password_verify($_POST["currentPassword"], $result["Password"]);
        $confirm = ($_POST["newPassword"] == $_POST["confirmPassword"]);

        if (!$verify){
            $message = "Current Password is not correct";
        }
        if (!$confirm){
            $message = "Password confirmation doesn't match the password";
        }
        if (!$verify and !$confirm){
            $message = "Current Password is not correct
            Password confirmation doesn't match the password";
        }
        if ($verify and $confirm) {
            $hashedpassword = Password_hash("$_POST[newPassword]", PASSWORD_BCRYPT);
            $result = $DB->runQuery("UPDATE plunk.user set password='" . $hashedpassword . "' WHERE userId=$_SESSION[UserID]");
            // print_r($_POST['newPassword']);
            $message = "Password Changed";
        }
        $pageURL = '..\view\profile\change_password.php?msg=' . $message;
        $newPage = new Page($pageURL);
        $newPage->show();
    }
}

//---------------------------------------------------Company-----------------------------------------------------------------------
    if(isset($_POST['add-company'])){
        $DB = new DB;

        try {
            $sql = "INSERT INTO plunk.company (Company,DistributorName,PhoneNo, Email) VALUES ('$_POST[Company]','$_POST[DistributorName]','$_POST[PhoneNo]','$_POST[Email]')";
            $DB->runQuery($sql);

            $newPage = new Page('..\view\company\addcompanysuccess.html');
            $newPage->show();

        } catch (\Throwable $th) {
            throw $th;
        }

    }
    if(isset($_POST['update-company'])){
        $DB = new DB;

        try {
            $sql = "UPDATE plunk.company SET DistributorName='$_POST[DistributorName]', PhoneNo='$_POST[PhoneNo]',Email='$_POST[Email]' WHERE Company='$_POST[Company]'";
            $DB->runQuery($sql);

            $newPage = new Page('..\view\company\updatesuccess.html');
            $newPage->show();

        } catch (\Throwable $th) {
            throw $th;
        }

    }
    if(isset($_POST['remove'])){
        $DB = new DB;

        try {
            $sql = "UPDATE plunk.company SET Remove='Yes' WHERE Company='$_POST[Company]'";
            $DB->runQuery($sql);

            $newPage = new Page('..\view\company\deletesuccess.html');
            $newPage->show();

        } catch (\Throwable $th) {
            throw $th;
        }

    }


//------------------------------------------------Restaurant Message---------------------------------------------------

if(isset($_POST['res-message'])){
    $DB = new DB;

    try {
        $sql = "SELECT Display FROM plunk.restaurantmessage WHERE No ='1'";
        $result = $DB->runQuery($sql)[0];
        //echo $result['Display'];

        if($result['Display'] == 'Yes'){
            //echo "open";
            $sql = "UPDATE plunk.restaurantmessage SET `Display`='No' WHERE No = '1'";
            //echo $sql;
            $DB->runQuery($sql);

            $sql = "UPDATE plunk.restaurantmessage SET `Display`='Yes' WHERE No = '2'";
            //echo $sql;
            $DB->runQuery($sql);

            $newPage = new Page('..\view\restaurantmanager\resclosesuccess.php');
            $newPage->show();

        }
        else{
            //echo "close";
            $sql = "UPDATE plunk.restaurantmessage SET `Display`='No' WHERE No = '2'";
            //echo $sql;
            $DB->runQuery($sql);

            $sql = "UPDATE plunk.restaurantmessage SET `Display`='Yes' WHERE No = '1'";
            //echo $sql;
            $DB->runQuery($sql);

            $newPage = new Page('..\view\restaurantmanager\resopensuccess.php');
            $newPage->show();
        }
    }

    catch (\Throwable $th) {
        throw $th;
    }
}

//---------------------------------------------------Salary-----------------------------------------------------------------------

if(isset($_POST['add-salary'])){
    $DB = new DB;

    try {
        $sql = "INSERT INTO plunk.salary(SalaryID,Date,WorkingDays) VALUES ('','$_POST[Date]','$_POST[Days]')";
        //echo $sql;
        $DB->runQuery($sql);


        $newPage = new Page('..\view\salary\addsalsuccess.php');
        $newPage->show();

    } catch (\Throwable $th) {
        throw $th;
    }

}

//---------------------------------------------------UserSalary-----------------------------------------------------------------------

if(isset($_POST['add-usersalary'])){
    $DB = new DB;

    try {
        $sql = "INSERT INTO plunk.salarystaff(SalaryID,StaffID,Basic,Bonus,ETF,EPF,Total) VALUES ('','$_POST[StaffID]','$_POST[Basic]','$_POST[Bonus]','$_POST[ETF]','$_POST[EPF]','$_POST[Total]')";
        //echo $sql;
        $DB->runQuery($sql);


        $newPage = new Page('..\view\salary\addusersalsuccess.php');
        $newPage->show();

    } catch (\Throwable $th) {
        throw $th;
    }

}

//---------Update user salary------------

if(isset($_POST['update-usersalary'])){
    $DB = new DB;

    try {
        $sql = "UPDATE plunk.salarystaff SET `SalaryID`='$_POST[SalaryID]',`StaffID`='$_POST[StaffID]',`Basic`='$_POST[Basic]',`Bonus`='$_POST[Bonus]',`ETF`='$_POST[ETF]',`EPF`='$_POST[EPF]',`Total`='$_POST[Total]'  WHERE StaffID = '$_POST[StaffID]'";
        $DB->runQuery($sql);
        $newPage = new Page('../view/salary/updatesalarysuccess.html');
        $newPage->show();
    } catch (\Throwable $th) {
        throw $th;
    }

}


//---------------------------------------------------ServiceCharge-----------------------------------------------------------------------

if(isset($_POST['add-servicecharge'])){
    $DB = new DB;

    try {
        $sql = "INSERT INTO plunk.servicecharge(ServiceChargeID,Date) VALUES ('','$_POST[Date]')";
        //echo $sql;
        $DB->runQuery($sql);


        $newPage = new Page('..\view\servicecharge\addservicesuccess.php');
        $newPage->show();

    } catch (\Throwable $th) {
        throw $th;
    }

}

//---------------------------------------------------UserServiceCharge-----------------------------------------------------------------------

if(isset($_POST['add-userservice'])){
    $DB = new DB;

    try {
        $sql = "INSERT INTO plunk.servicechargestaff(ServiceChargeID,StaffID,Percentage,Amount) VALUES ('','$_POST[StaffID]','$_POST[Percentage]','$_POST[Amount]')";
        //echo $sql;
        $DB->runQuery($sql);


        $newPage = new Page('..\view\servicecharge\adduserservicesuccess.php');
        $newPage->show();

    } catch (\Throwable $th) {
        throw $th;
    }

}

//---------Update user salary------------

if(isset($_POST['update-userservicecharge'])){
    $DB = new DB;

    try {
        $sql = "UPDATE plunk.servicechargestaff SET `ServiceChargeID`='$_POST[ServiceChargeID]',`StaffID`='$_POST[StaffID]',`Percentage`='$_POST[Percentage]',`Amount`='$_POST[Amount]'  WHERE StaffID = '$_POST[StaffID]'";
        $DB->runQuery($sql);
        $newPage = new Page('../view/servicecharge/updateservicesuccess.html');
        $newPage->show();
    } catch (\Throwable $th) {
        throw $th;
    }

}


//---------------------------------------------------UserSalarydetail-----------------------------------------------------------------------


if(isset($_POST['update-basicsalary'])){
    $DB = new DB;

    try {
        $sql = "UPDATE plunk.usersalary SET basic='$_POST[basic]', bonusValue='$_POST[bonusValue]', ETFvalue='$_POST[ETFvalue]',EPFvalue='$_POST[EPFvalue]',percentage='$_POST[percentage]' WHERE userType='$_POST[userType]'";
        $DB->runQuery($sql);

        $newPage = new Page('..\view\staffpayments\updateusesalsuccess.html');
        $newPage->show();

    } catch (\Throwable $th) {
        throw $th;
    }

}

    //---------------------------------------------------Leaves-----------------------------------------------------------------------

    if(isset($_POST['add-leave'])){
        $DB = new DB;

        try {

            $sql = "INSERT INTO plunk.leave(UserID,RequestedDate,LeaveDate,LeaveType,NoOfdays,Reason) VALUES ('$_SESSION[UserID]','$_POST[Date]','$_POST[LeaveDate]','$_POST[Type]','$_POST[NoOfdays]','$_POST[Reason]')";

            //echo $sql;
            $DB->runQuery($sql);


            $newPage = new Page('..\view\leave\addleavesuccess.html');
            $newPage->show();

        } catch (\Throwable $th) {
            throw $th;
        }

    }

//------------------------give permission for leaves--------------------------
    if(isset($_POST['accept'])){
        $DB = new DB;


        try {

            $sql = "UPDATE plunk.leave SET Accepted='Yes' WHERE UserID='$_POST[UserID]' AND LeaveDate='$_POST[LeaveDate]' ";
            $DB->runQuery($sql);

            $newPage = new Page('..\view\leave\accepted.html');
            $newPage->show();

        } catch (\Throwable $th) {
            throw $th;
        }

    }
    elseif (isset($_POST['deny'])) {
      $DB = new DB;

      try {

          $sql = "UPDATE plunk.leave SET Accepted='No' WHERE UserID='$_POST[UserID]' AND LeaveDate='$_POST[LeaveDate]' ";
          $DB->runQuery($sql);

          $newPage = new Page('..\view\leave\denied.html');
          $newPage->show();

      } catch (\Throwable $th) {
          throw $th;
      }
    }
//--------------------------------------------------------Booking---------------------------------------------------------------------------------
//----------------------------add booking--------------------------------------------
//-------------add restaurant booking--------------------------
if(isset($_POST['addbook'])){

    $DB = new DB;

    try {
        $slot="SELECT BookingID FROM plunk.booking WHERE BookingType ='Restaurant'AND Reservation='$_POST[Reservation]' AND ReservedDate='$_POST[ReservedDate]' AND 	(ReservedTime BETWEEN '$_POST[ReservedTime]' AND'$_POST[EndTime]' OR EndTime BETWEEN '$_POST[ReservedTime]' AND '$_POST[EndTime]' )";

        $bookslot=$DB->runQuery($slot);
        $booklen=count($bookslot);

          if ($booklen>=1) {
            $newPage = new Page('..\view\bookings\duplicate.html');
            $newPage->show();

          }
          else {
            $create = $_POST['CreatedDate'];
            $reserve = $_POST['ReservedDate'];
            $start=$_POST['ReservedTime'];
            $end=$_POST['EndTime'];
            // $weekday = date("D");
            //  print_r($weekday);
            // print_r(gettype($end));
            for ($i=0; $i < 2; $i++) {
              $create++;
            }
            $planday=$create;

            if ($start>='17:00'&& $start<='22:30'&& $end >='17:30'&& $end <='23:00') {

                    $sql = "INSERT INTO plunk.booking (BookingID,CustomerName,BookingType,Reservation,NoOfPeople,ReservedDate,ReservedTime,EndTime,CreatedDate,LastModifiedDate,ContactNo,Total,UserID) VALUES ('','$_POST[CustomerName]','Restaurant','$_POST[Reservation]','$_POST[NoOfPeaople]','$_POST[ReservedDate]','$_POST[ReservedTime]','$_POST[EndTime]','$_POST[CreatedDate]','$_POST[CreatedDate]','$_POST[ContactNo]','$_POST[Total]','$_POST[UserID]')";
                    $DB->runQuery($sql);


                    if ($planday>=$reserve) {
                      $newPage = new Page('..\view\bookings\forneardaysuccess.html');
                      $newPage->show();
                    }else {
                      $newPage = new Page('..\view\bookings\addbookingsuccess.html');
                      $newPage->show();
                    }
                  }else {
                    $newPage = new Page('..\view\bookings\restimewarning.html');
                    $newPage->show();
                  }
      }
    } catch (\Throwable $th) {
        throw $th;
    }

}
//---------------------add club booking----------------------------
elseif (isset($_POST['add-clubbook'])) {
  $DB = new DB;

  try {
      $slot="SELECT BookingID FROM plunk.booking WHERE BookingType ='Club'AND Reservation='$_POST[Reservation]' AND ReservedDate='$_POST[ReservedDate]' AND 	(ReservedTime BETWEEN '$_POST[ReservedTime]' AND'$_POST[EndTime]' OR EndTime BETWEEN '$_POST[ReservedTime]' AND '$_POST[EndTime]' )";

      $bookslot=$DB->runQuery($slot);
      $booklen=count($bookslot);

        if ($booklen>=1) {
          $newPage = new Page('..\view\bookings\clubduplicate.html');
          $newPage->show();

        }
        else {
          $create = $_POST['CreatedDate'];
          $reserve = $_POST['ReservedDate'];
          $start=$_POST['ReservedTime'];
          $end=$_POST['EndTime'];

          for ($i=0; $i < 2; $i++) {
            $create++;
          }
          $planday=$create;

          if ($start>='8:00'&& $start<='17:00'&& $end >='09:00'&& $end <='18:00') {
        $sql = "INSERT INTO plunk.booking (BookingID,CustomerName,BookingType,Reservation,NoOfPeople,ReservedDate,ReservedTime,EndTime,CreatedDate,LastModifiedDate,ContactNo,Total,UserID) VALUES ('','$_POST[CustomerName]','Club','$_POST[Reservation]','$_POST[NoOfPeaople]','$_POST[ReservedDate]','$_POST[ReservedTime]','$_POST[EndTime]','$_POST[CreatedDate]','$_POST[CreatedDate]','$_POST[ContactNo]','$_POST[Total]','$_POST[UserID]')";
        $DB->runQuery($sql);


        if ($planday>=$reserve) {
          $newPage = new Page('..\view\bookings\forneardaysuccess.html');
          $newPage->show();
        }else {
          $newPage = new Page('..\view\bookings\addclubbookingsuccess.html');
          $newPage->show();
        }
      }else {
        $newPage = new Page('..\view\bookings\restimewarning.html');
        $newPage->show();
      }
    }
  } catch (\Throwable $th) {
      throw $th;
  }

}
//---------------------------------Update booking---------------------------------------------------------
//----------------------update restaurent booking------------------
if(isset($_POST['update-booking'])){
    $DB = new DB;

    try {

        $checkID="SELECT BookingID FROM plunk.booking WHERE BookingType ='Restaurant'AND Reservation='$_POST[Reservation]' AND ReservedDate='$_POST[ReservedDate]' AND 	(ReservedTime BETWEEN '$_POST[ReservedTime]' AND'$_POST[EndTime]' OR EndTime BETWEEN '$_POST[ReservedTime]' AND '$_POST[EndTime]' )";

        $result = $DB->runQuery($checkID);
        $len= count($result);

        $start=$_POST['ReservedTime'];
        $end=$_POST['EndTime'];
         // print_r($result[$len-1['BookingID']);
         // print_r($len);
         // if (is_null($len)) {
         //   echo "it is null";
         // }
         // else {
         //   echo "not null";
         // }
         if ($start>='17:00'&& $start<='22:30'&& $end >='17:30'&& $end <='23:00') {
            if ($len == 0) {
              $sql = "UPDATE plunk.booking SET CustomerName='$_POST[CustomerName]', Reservation='$_POST[Reservation]', NoOfPeople='$_POST[NoOfPeaople]', ReservedDate='$_POST[ReservedDate]', ReservedTime='$_POST[ReservedTime]', EndTime='$_POST[EndTime]', LastModifiedDate='$_POST[LastModifiedDate]', ContactNo='$_POST[ContactNo]', Total='$_POST[Total]', UserID='$_POST[UserID]' WHERE BookingID='$_POST[BookingID]'  ";

               $DB->runQuery($sql);

               $newPage = new Page('..\view\bookings\addbookingsuccesstwo.html');
               $newPage->show();

            }
            elseif ($len=1) {
                if ($result[$len-1]['BookingID'] == $_POST['BookingID']) {

                  $sql = "UPDATE plunk.booking SET CustomerName='$_POST[CustomerName]', Reservation='$_POST[Reservation]', NoOfPeople='$_POST[NoOfPeaople]', ReservedDate='$_POST[ReservedDate]', ReservedTime='$_POST[ReservedTime]', EndTime='$_POST[EndTime]', LastModifiedDate='$_POST[LastModifiedDate]', ContactNo='$_POST[ContactNo]', Total='$_POST[Total]', UserID='$_POST[UserID]' WHERE BookingID='$_POST[BookingID]'  ";

                  $DB->runQuery($sql);

                  $newPage = new Page('..\view\bookings\addbookingsuccesstwo.html');
                  $newPage->show();

                }
                else {
                  $newPage = new Page('..\view\bookings\duplicate.html');
                   $newPage->show();
                }
            }

            else {

             $newPage = new Page('..\view\bookings\databaseerror.html');
             $newPage->show();
            }
          }else {
            $newPage = new Page('..\view\bookings\restimewarning.html');
            $newPage->show();
          }


    } catch (\Throwable $th) {
        throw $th;
    }

}
//-------------------update club booking----------------------
elseif(isset($_POST['update-clubbooking'])){
    $DB = new DB;

    try {

        $checkID="SELECT BookingID FROM plunk.booking WHERE BookingType ='Club'AND Reservation='$_POST[Reservation]' AND ReservedDate='$_POST[ReservedDate]' AND 	(ReservedTime BETWEEN '$_POST[ReservedTime]' AND'$_POST[EndTime]' OR EndTime BETWEEN '$_POST[ReservedTime]' AND '$_POST[EndTime]' )";

        $result = $DB->runQuery($checkID);
        $len= count($result);
        $start=$_POST['ReservedTime'];
        $end=$_POST['EndTime'];


        if ($start>='8:00'&& $start<='17:00'&& $end >='09:00'&& $end <='18:00') {
            if ($len == 0) {
              $sql = "UPDATE plunk.booking SET CustomerName='$_POST[CustomerName]', Reservation='$_POST[Reservation]', NoOfPeople='$_POST[NoOfPeaople]', ReservedDate='$_POST[ReservedDate]', ReservedTime='$_POST[ReservedTime]', EndTime='$_POST[EndTime]', LastModifiedDate='$_POST[LastModifiedDate]', ContactNo='$_POST[ContactNo]', Total='$_POST[Total]', UserID='$_POST[UserID]' WHERE BookingID='$_POST[BookingID]'  ";

               $DB->runQuery($sql);

               $newPage = new Page('..\view\bookings\addclubbookingsuccesstwo.html');
               $newPage->show();

            }
            elseif ($len=1) {
                if ($result[$len-1]['BookingID'] == $_POST['BookingID']) {

                  $sql = "UPDATE plunk.booking SET CustomerName='$_POST[CustomerName]', Reservation='$_POST[Reservation]', NoOfPeople='$_POST[NoOfPeaople]', ReservedDate='$_POST[ReservedDate]', ReservedTime='$_POST[ReservedTime]', EndTime='$_POST[EndTime]', LastModifiedDate='$_POST[LastModifiedDate]', ContactNo='$_POST[ContactNo]', Total='$_POST[Total]', UserID='$_POST[UserID]' WHERE BookingID='$_POST[BookingID]'  ";

                  $DB->runQuery($sql);

                  $newPage = new Page('..\view\bookings\addclubbookingsuccesstwo.html');
                  $newPage->show();

                }
                else {
                  $newPage = new Page('..\view\bookings\clubduplicate.html');
                   $newPage->show();
                }
            }

            else {

             $newPage = new Page('..\view\bookings\databaseerror.html');
             $newPage->show();
            }
          }else {
            $newPage = new Page('..\view\bookings\restimewarning.html');
            $newPage->show();
          }
    } catch (\Throwable $th) {
        throw $th;
    }

}
//--------------------delete booking--------------------------
if(isset($_POST['delete-booking'])){
    $DB = new DB;



    try {
          $type=$_POST['BookingType'];
          // print_r($type);
          $sql = "INSERT INTO plunk.deletebooking (BookingID,CustomerName,BookingType,Reservation,NoOfPeople,ReservedDate,ReservedTime,EndTime,CreatedDate,LastModifiedDate,ContactNo,Total,UserID,Payment,DeleteDate,Reason
) VALUES  ('$_POST[BookingID]','$_POST[CustomerName]', '$_POST[BookingType]', '$_POST[Reservation]', '$_POST[NoOfPeaople]', '$_POST[ReservedDate]', '$_POST[ReservedTime]', '$_POST[EndTime]', '$_POST[CreatedDate]', '$_POST[LastModifiedDate]', '$_POST[ContactNo]', '$_POST[Total]', '$_POST[UserID]', '$_POST[Payment]', '$_POST[DeleteDate]','$_POST[Reason]')";
         $DB->runQuery($sql);

         $sql = "DELETE FROM plunk.booking WHERE BookingID='$_POST[BookingID]'";
         $DB->runQuery($sql);

         if($type== 'Restaurant'){
         $newPage = new Page('..\view\bookings\bookingdeleted.html');
         $newPage->show();
          }
          else {
            $newPage = new Page('..\view\bookings\clubbookingdeleted.html');
            $newPage->show();
          }
    } catch (\Throwable $th) {
        throw $th;
    }



}
?>
