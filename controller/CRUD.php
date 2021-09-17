<?php

    require_once "../model/database.php";

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

?>