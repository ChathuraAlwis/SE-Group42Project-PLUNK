<?php

    class FirstPage{

        public function show(){
            header('location: view/firstpage.php');
            exit();
        }

    }

    class Controller{

        public $model;

        //constructor
        public function __construct(){
            require_once('../model/models.php');
            $this->models = new Model();

        }

        //show result
        public function invoke(){

            $result = $this->models->getLogin();

            if ($result == 'login'){
                header('../view/afterLogin.php');
                exit();
            }
            else{
                echo $result;
                header('../view/login.php');
                exit();
            }
            //
        }

    }

?>