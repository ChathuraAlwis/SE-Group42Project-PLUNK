<?php

    if(isset($_POST['UserID']) && isset($_POST['password'])){

        require_once '../model/models.php';
        require_once 'controller.php';

        $model = new Model;
        $result = $model->getLogin($_POST['UserID'], $_POST['password']);

        if($result == 'login'){
            $page = new Page('../view/generalmanager.html');
            $page->show();
        }
        else{
            // echo $result;
            // include_once '../view/login.html';
            $page = new Page('../view/login.html');
            $page->show();
        }
    }
    else{
        echo "not set";
    }

    

?>