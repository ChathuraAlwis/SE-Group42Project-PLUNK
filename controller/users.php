<?php
    session_start();
    require_once "../model/database.php";

    class User{

        private $DB;

        function __construct(){

            $this->DB = new DB();

        }

        private function userType($userType){
            
            switch ($userType) {

                case 'Accountant':
                    return "accountant/accountant";

                case 'Admin':
                    return "admin/admin";

                case 'Cashier':
                    return "cashier/cashier";

                case 'Manager':
                    return "generalmanager/generalmanager";

                case 'Restaurant Manager':
                    return "restaurantmanager/restaurantmanager";

                default:
                    return "clubmember/clubmember";
            }

        }

        public function getLogin($username, $password){

            $query = "SELECT * FROM plunk.user WHERE UserName=\"$username\";";
            $record = $this->DB->runQuery($query);
            // print_r($record);
            $pass = $record[0]["Password"];
            // print_r($pass);
            
            if(password_verify($password, $pass)){
                $type = $record[0]["UserType"];
                $_SESSION['UserType']=$type;
                return $this->userType($type);
            }
            else{
                return "invalid user";
            }
            
        }

    }

?>