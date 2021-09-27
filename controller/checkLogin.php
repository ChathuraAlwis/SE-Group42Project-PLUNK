<?php
    session_start();

    if(isset($_POST['UserName']) && isset($_POST['Password'])){

        require_once 'users.php';
        require_once 'pages.php';

        $user = new User;
        $userType = $user->getLogin($_POST['UserName'], $_POST['Password']);

        if($userType != "invalid user"){
            $_SESSION['UserName'] = $_POST['UserName'];
            $page = new Page("../view/" . $userType . ".php");
            $page->show();
        }
        else{
            $page = new Page('../view/l.html');
            $page->show();
        }
    }
    else{
        echo "not set";
    }

    

?>