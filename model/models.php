<?php

    require_once('model/models.php');

    class Model{

        public function getLogin(){

            if(isset($_REQUEST['username']) && isset($_REQUEST['password'])){

                if($_REQUEST['username'] == 'Chathura' && $_REQUEST['password'] == 'Alwis'){
                    return 'login';
                }
                else{
                    return 'invaid user';
                }

            }

        }

    }

?>