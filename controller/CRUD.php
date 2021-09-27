<?php
    session_start();
    require_once "../model/database.php";

    //--------------------------------------------------------order--------------------------------------------------------
    if(isset($_POST['add-order'])){
        $DB = new DB;

        try {
            $sql = "INSERT INTO plunk.order (Order_ID, Order_Place, Quantity, Member_ID, Staff_ID) VALUES ('$_POST[Order_ID]', '$_POST[Order_Place]', '$_POST[Quantity]', '$_POST[Member_ID]', '$_SESSION[UserID]');";
            echo $DB->runQuery($sql);
        } catch (\Throwable $th) {
            throw $th;
        }
        
    }

    if(isset($_POST['delete-order'])){
        $DB = new DB;

        try {
            $sql = "DELETE FROM plunk.order WHERE Order_ID=\"$_POST[Order_ID]\"";
            echo $DB->runQuery($sql);
        } catch (\Throwable $th) {
            throw $th;
        }
        
    }

    if(isset($_POST['update-order'])){
        $DB = new DB;

        try {;
            $sql = "UPDATE plunk.order SET $_POST[Column]=\"$_POST[Value]\" WHERE Order_ID=\"$_POST[Order_ID]\"";
            echo $DB->runQuery($sql);
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
            echo $DB->runQuery($sql);
        } catch (\Throwable $th) {
            throw $th;
        }
        
    }

    if(isset($_POST['update-bill'])){
        $DB = new DB;

        try {
            $sql = "UPDATE plunk.bill SET $_POST[Column]=\"$_POST[Value]\" WHERE Bill_ID=\"$_POST[Bill_ID]\"";
            echo $DB->runQuery($sql);
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
    

    if(isset($_POST['add-item'])){
        $DB = new DB;

        try {
            if($_POST['itemtype']=='kitchenitems'){
                if($_POST['isavailable']=='Yes'){
                     $sql = "INSERT INTO plunk.kichen_item (Item_ID, Item_Name, Price, Discount, Available, Quantity, Category, Portion, Staff_ID) 
                        VALUES ('$_POST[item_id]', '$_POST[item_name]', '$_POST[price]','$_POST[discount]','1', '$_POST[quantity]', '$_POST[category]',  '$_POST[portion]', '$_POST[staffid]');";
                }
               else{
                    $sql = "INSERT INTO plunk.kichen_item (Item_ID,'Name',Price,Discount,'Availability',Quantity,Category,Portion,Staff_ID) 
                        VALUES ('$_POST[item_id]', '$_POST[item_name]', '$_POST[price]','$_POST[discount]','0', '$_POST[quantity]', '$_POST[category]',  '$_POST[portion]', '$_POST[staffid]');";
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

            echo $DB->runQuery($sql);
                                                                                        
        } catch (\Throwable $th) {
            throw $th;
        }

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

        echo $DB->runQuery($sql);
    }

?>