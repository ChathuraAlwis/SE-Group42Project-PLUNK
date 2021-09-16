<?php
    require_once "../model/database.php";
    $con = mysqli_connect("localhost","root","Serendipity_Agastopia","plunk");

   if(isset($_POST["Submit"])){
    $Item_ID = $_POST["Item_ID"];
    $Name = $_POST["Name"];
    $Price = $_POST["Price"];     
    $Discount = $_POST["Discount"];
    $Avalability = $_POST["Availability"];
    $Quantity = $_POST["Quantity"];
    $Item_type = $_POST["Item_type"];
    $Staff_ID = $_POST["Staff_ID"];
    $sql = "";
    if($Item_type == 'kitchenitems'){
        $Category = $_POST["Category"];
        global $sql;
        if ($Avalability == 'Yes'){
            $sql = "INSERT INTO kitchen_item(Item_ID, 'Name',Price,Discount,'Availability',Quantity,Item_type,Category,Staff_ID) VALUES('$Item_ID', '$Name','$Price','$Discount','1','$Quantity','$Item_type','$Category','$Staff_ID')";
        }else {
            $sql = "INSERT INTO kitchen_item(Item_ID, 'Name',Price,Discount,'Availability',Quantity,Item_type,Category,Staff_ID) VALUES('$Item_ID', '$Name','$Price','$Discount','0','$Quantity','$Item_type','$Category','$Staff_ID')";
        }
           
    }
    else if($atype == 'beverageitems'){
        $Volume = $_POST["Volume"];
        $Company_Name = $_POST["Company_Name"];
        $Reorder_Quantity = $_POST["Reorder_Quantity"];
        
        global $sql;
        
        if ($Avalability == 'Yes'){
            $sql = "INSERT INTO beverage_items(Item_ID, 'Name',Price,Discount,'Availability',Quantity,Item_type,Volume,Company_Name,Reorder_Quantity,Staff_ID) VALUES('$Item_ID', '$Name','$Price','$Discount','1','$Quantity','$Item_type',$Volume','$Company_Name','$Reorder_Quantity','$Staff_ID')";
        }else {
            $sql = "INSERT INTO beverage_items(Item_ID, 'Name',Price,Discount,'Availability',Quantity,Item_type,Volume,Company_Name,Reorder_Quantity,Staff_ID) VALUES('$Item_ID', '$Name','$Price','$Discount','1','$Quantity','$Item_type',$Volume','$Company_Name','$Reorder_Quantity','$Staff_ID')";
        }
    }

    
}
?>