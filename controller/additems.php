<?php
    $con = mysqli_connect("localhost","root","Serendipity_Agastopia","plunk");

    $con = mysqli_connect('localhost', 'root', '',’db_contact’);

    $txtName = $_POST['ItemID'];
    $txtEmail = $_POST['txtEmail'];
    $txtPhone = $_POST['txtPhone'];     
    $txtMessage = $_POST['txtMessage'];

    $sql = "INSERT INTO `tbl_contact` (`Id`, `fldName`, `fldEmail`, `fldPhone`, `fldMessage`) VALUES ('0', '$txtName', '$txtEmail', '$txtPhone', '$txtMessage');"

    
?>