<?php

    require_once "../model/database.php";

    if(isset($_POST['add-order'])){
        $DB = new DB;

        try {
            $sql = "INSERT INTO plunk.order (Order_ID, Order_Place, Quantity, Member_ID, Staff_ID) VALUES ('$_POST[Order_ID]', '$_POST[Order_Place]', '$_POST[Quantity]', '$_POST[Member_ID]', '$_POST[Staff_ID]');";
        } catch (\Throwable $th) {
            throw $th;
        }

        echo $DB->crud($sql);
    }

    if(isset($_POST['delete-order'])){
        $DB = new DB;

        try {
            $sql = "DELETE FROM plunk.order WHERE Order_ID=\"$_POST[Order_ID]\"";
        } catch (\Throwable $th) {
            throw $th;
        }

        echo $DB->crud($sql);
    }

    if(isset($_POST['add-item'])){
        $DB = new DB;

        try {
            if($_POST['itemtype']=='kitchenitems'){
                if($_POST['isavailable']=='Yes'){
                     $sql = "INSERT INTO plunk.kichen_item (Item_ID,'Name',Price,Discount,'Availability',Quantity,Category,Portion,Staff_ID) 
                        VALUES ('$_POST[item_id]', '$_POST[item_name]', '$_POST[price]','$_POST[discount]','1', '$_POST[quantity]', '$_POST[category]',  '$_POST[portion]''$_POST[staffid]');";
                }
               else{
                    $sql = "INSERT INTO plunk.kichen_item (Item_ID,'Name',Price,Discount,'Availability',Quantity,Category,Portion,Staff_ID) 
                        VALUES ('$_POST[item_id]', '$_POST[item_name]', '$_POST[price]','$_POST[discount]','0', '$_POST[quantity]', '$_POST[category]',  '$_POST[portion]''$_POST[staffid]');";
               }
            }
            else{
                if($_POST['isavailable']=='Yes'){
                    $sql = "INSERT INTO plunk.kitchen_item (Item_ID,'Name',Price,Discount,'Availability',Quantity,Volume,Company_Name,Reorder_Quantity,Staff_ID) 
                        VALUES ('$_POST[item_id]', '$_POST[item_name]', '$_POST[price]','$_POST[discount]','1', '$_POST[quantity]', '$_POST[volume]',  '$_POST[companyname]','$_POST[reorder]','$_POST[staffid]');";
               }
              else{
                    $sql = "INSERT INTO plunk.kitchen_item (Item_ID,'Name',Price,Discount,'Availability',Quantity,Volume,Company_Name,Reorder_Quantity,Staff_ID) 
                        VALUES ('$_POST[item_id]', '$_POST[item_name]', '$_POST[price]','$_POST[discount]','0', '$_POST[quantity]', '$_POST[volume]',  '$_POST[companyname]','$_POST[reorder]','$_POST[staffid]');";
              }
            }
                                                                                        
        } catch (\Throwable $th) {
            throw $th;
        }

        echo $DB->crud($sql);
    }

    if(isset($_POST['delete-item'])){
        $DB = new DB;

        try {
            if($_POST['itemtype']=='kitchenitems'){
                $sql = "DELETE FROM plunk.kitchen_items WHERE Item_ID=\"$_POST[item_id]\"";
            }
            if($_POST['itemtype']=='beverageitems'){
                $sql = "DELETE FROM plunk.beverage_items WHERE Item_ID=\"$_POST[item_id]\"";
            }
            
        } catch (\Throwable $th) {
            throw $th;
        }

        echo $DB->crud($sql);
    }

?>