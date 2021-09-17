<?php
    session_start();

    if(isset($_POST['UserID']) && isset($_POST['password'])){

        require_once 'users.php';
        require_once 'pages.php';

        $user = new User;
        $userType = $user->getLogin($_POST['UserID'], $_POST['password']);

        if($userType != "invalid user"){
            $_SESSION['UserID'] = $_POST['UserID'];
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