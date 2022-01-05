<?php
    require_once "../../model/database.php";  
    $DB = new DB;
    $query = "SELECT Message FROM plunk.restaurantmessage WHERE Display='Yes'";
    $result = $DB->runQuery($query)[0];
    echo $result['Message'];
    
    // $url1=$_SERVER['REQUEST_URI'];
    // header("Refresh: 15; URL=$url1");

?>