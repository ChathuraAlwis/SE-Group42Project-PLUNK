<?php

    class Model{

        public function getLogin(){

            if(isset($_POST['username']) && isset($_POST['password'])){

                if($_POST['username'] == 'Chathura' && $_POST['password'] == 'Alwis'){
                    return 'login';
                }
                else{
                    return 'invaid user';
                }

            }

        }

    }

?>