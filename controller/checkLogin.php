<?php

    if(isset($_POST['UserID']) && isset($_POST['password'])){

        require_once '../model/users.php';
        require_once 'controller.php';

        $user = new User;
        $userType = $user->getLogin($_POST['UserID'], $_POST['password']);

        if($userType != "invalid user"){
            $page = new Page("../view/" . $userType . ".html");
            $page->show();
        }
        else{
            $page = new Page('../view/login.html');
            $page->show();
        }
    }
    else{
        echo "not set";
    }

    

?>