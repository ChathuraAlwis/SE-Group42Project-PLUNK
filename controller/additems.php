<?php
    $con = mysqli_connect("localhost","root","Serendipity_Agastopia","plunk");

    $con = mysqli_connect('localhost', 'root', '',’db_contact’);

    $itemid = $_POST['Item_ID'];
    $name = $_POST['Name'];
    $price = $_POST['Price'];     
    $discount = $_POST['Discount'];
    $quantity = $_POST['Quantity'];

    $sql = "INSERT INTO `tbl_contact` (`Item_ID`, `Name`, `Price`, `Discount`, `Quantity`) VALUES ('$itemid', '$name', '$price', '$discount', '$quantity');"

    
?>

