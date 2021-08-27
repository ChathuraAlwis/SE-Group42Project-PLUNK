<?php

    require_once '../model/models.php';

    $model = new Model;
    $result = $model->getLogin();

    if($result == 'login'){
        header('generalmanager.html');
        exit();
    }
    else{
        echo $result;
    }

?>