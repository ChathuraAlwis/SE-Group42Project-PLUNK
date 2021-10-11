<?php
    session_start();

    require_once 'pages.php';
    if(isset($_POST['UserName']) && isset($_POST['Password'])){

        require_once 'users.php';

        $user = new User;
        $userType = $user->getLogin($_POST['UserName'], $_POST['Password']);

        if($userType != "invalid user"){
            $page = new Page("../view/" . $userType . ".php");
            $page->show();
        }
        else{
            $page = new Page('../view/login.php?result="Invaild User"');
            $page->show();
            echo '<script>alert("Invalid Username or Password")</script>';
        }
    }
    else{
        $page = new Page('../view/login.php');
        $page->show();
    }

    

?>