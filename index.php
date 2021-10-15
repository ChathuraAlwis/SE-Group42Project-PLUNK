<?php
    date_default_timezone_set("Asia/Kolkata");
    require_once 'controller/pages.php';

    $firstPage = new Page('view/cover.php');
    $firstPage->show();

?>