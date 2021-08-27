<?php

    class Model{

        public function getLogin($username, $password){

            if($username == 'Chathura' && $password == 'Alwis'){
                return 'login';
            }
            else{
                return 'invaid user';
            }
        }

    }

?>