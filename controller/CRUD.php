<?php

    require_once "../model/database.php";

    //--------------------------------------------------------order--------------------------------------------------------
    if(isset($_POST['add-order'])){
        $DB = new DB;

        try {
            $sql = "INSERT INTO plunk.order (Order_ID, Order_Place, Quantity, Member_ID, Staff_ID) VALUES ('$_POST[Order_ID]', '$_POST[Order_Place]', '$_POST[Quantity]', '$_POST[Member_ID]', '$_POST[Staff_ID]');";
            echo $DB->crud($sql);
        } catch (\Throwable $th) {
            throw $th;
        }
        
    }

    if(isset($_POST['delete-order'])){
        $DB = new DB;

        try {
            $sql = "DELETE FROM plunk.order WHERE Order_ID=\"$_POST[Order_ID]\"";
            echo $DB->crud($sql);
        } catch (\Throwable $th) {
            throw $th;
        }
        
    }

    if(isset($_POST['update-order'])){
        $DB = new DB;

        try {
            $sql = "UPDATE plunk.order SET $_POST[Column]=\"$_POST[Value]\" WHERE Order_ID=\"$_POST[Order_ID]\"";
            echo $DB->crud($sql);
        } catch (\Throwable $th) {
            throw $th;
        }
        
    }

    if(isset($_POST['search-order'])){
        $DB = new DB;

        try {
            $sql = "SELECT * FROM plunk.order WHERE Order_ID=\"$_POST[Order_ID]\"";
            $result = $DB->select($sql);
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
            echo $DB->crud($sql);
        } catch (\Throwable $th) {
            throw $th;
        }
        
    }

    if(isset($_POST['delete-bill'])){
        $DB = new DB;

        try {
            $sql = "DELETE FROM plunk.bill WHERE Bill_ID=\"$_POST[Bill_ID]\"";
            echo $DB->crud($sql);
        } catch (\Throwable $th) {
            throw $th;
        }
        
    }

    if(isset($_POST['update-bill'])){
        $DB = new DB;

        try {
            $sql = "UPDATE plunk.bill SET $_POST[Column]=\"$_POST[Value]\" WHERE Bill_ID=\"$_POST[Bill_ID]\"";
            echo $DB->crud($sql);
        } catch (\Throwable $th) {
            throw $th;
        }
        
    }

    if(isset($_POST['search-bill'])){
        $DB = new DB;
        
        try {
            $sql = "SELECT * FROM plunk.bill WHERE Bill_ID=\"$_POST[Bill_ID]\"";
            $result = $DB->select($sql);
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
    

?>