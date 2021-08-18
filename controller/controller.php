<?php

    require_once('model/models.php');

    class Controller{

        public $model;

        //constructor
        public function __construct(){

            $this->models = new Model();

        }

        //show result
        public function invoke(){

            $result = $this->models->getLogin();

            if ($result == 'login'){
                include 'view/afterLogin.php';
            }
            else{
                include 'view/login.php';
            }

        }

    }

?>