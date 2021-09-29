<?php
    session_start();
    require_once "../model/database.php";

    //--------------------------------------------------------order--------------------------------------------------------
    if(isset($_POST['add-order'])){
        $DB = new DB;

        try {
            $sql = "INSERT INTO plunk.order (OrderDate, OrderTime, OrderPlace, Total, UserID) VALUES ('$_POST[OrderDate]', '$_POST[OrderTime]', '$_POST[OrderPlace]', '$_POST[Total]', '$_SESSION[UserID]');";
             $DB->runQuery($sql);
        } catch (\Throwable $th) {
            throw $th;
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
            $sql = "UPDATE plunk.order SET $_POST[Column]=\"$_POST[Value]\" WHERE Order_ID=\"$_POST[Order_ID]\"";
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
    if(isset($_POST['add-bill'])){
        $DB = new DB;

        try {
            $sql = "INSERT INTO plunk.bill (Bill_ID, Payment_Type, Discount, Steward_Name, Staff_ID, Order_ID) VALUES ('$_POST[Bill_ID]', '$_POST[Payment_Type]', '$_POST[Discount]', '$_POST[Steward_Name]', '$_POST[Staff_ID]', '$_POST[Order_ID]');";
             $DB->runQuery($sql);
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
            $sql = "INSERT INTO plunk.item (ItemID, ItemName, Price, Discount, Availability , Quantity, ItemType, ReorderQuantity) VALUES ( '' , '$_POST[ItemName]',  '$_POST[Price]','$_POST[Discount]', '$_POST[Availability]', '$_POST[Quantity]','$_POST[ItemType]','$_POST[ReorderQuantity]');";
            $DB->runQuery($sql);
        } catch (\Throwable $th) {
            throw $th;
        }

    }

//----------Search Item--------------
    if(isset($_POST['search-itemtype'])){
        $DB = new DB;

        try {
            $sql = "SELECT * FROM plunk.item WHERE ItemType=\"$_POST[ItemType]\"";
            $result = $DB->runQuery($sql);
            $rows = count($result, 0);
            //result//

        } catch (\Throwable $th) {
            throw $th;
        }

    }


    if(isset($_POST['delete-item'])){
        $DB = new DB;

        try {
            //deleteitem

        } catch (\Throwable $th) {
            throw $th;
        }

         $DB->runQuery($sql);
    }

    //---------------------------------------------------Invoice-----------------------------------------------------------------------
    if(isset($_POST['add-invoice'])){
        $DB = new DB;

        try {
            $sql = "INSERT INTO plunk.invoice (InvoiceID, Company, Type, ReceivedDate, DueDate, Total, UserID ) VALUES ( '' , '$_POST[Companyname]',  '$_POST[Type]','$_POST[ReceivedDate]', '$_POST[DueDate]', '$_POST[Total]','$_SESSION[UserID]');";
            $DB->runQuery($sql);
        } catch (\Throwable $th) {
            throw $th;
        }

    }


?>
