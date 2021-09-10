<?php

    require_once "../model/database.php";

    class User{

        private $DB;

        function __construct(){

            $this->DB = new DB();

        }

        private function userType($userID){
            
            switch ($userID[0]) {

                case 'A':
                    return "accountant";

                case 'D':
                    return "admin";

                case 'C':
                    return "cashier/cashier";

                case 'G':
                    return "generalmanager";

                case 'R':
                    return "restaurantmanager";

                case 'M':
                    return "clubmember";
                
                default:
                    # code...
                    break;
            }

        }

        public function getLogin($userID, $password){

            $query = "SELECT Password from plunk.user_login where User_ID=\"$userID\";";
            $record = $this->DB->select($query);
            $pass = $record[0]["Password"];
            
            if($password==$pass){
                return $this->userType($userID);
            }

            else{
                return "invalid user";
            }
            
        }

    }

?>