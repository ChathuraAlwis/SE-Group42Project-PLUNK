<?php
    session_start();
    require_once "../model/database.php";

    class User{

        private $DB;

        function __construct(){

            $this->DB = new DB();

        }

        private function setSession($userRecord){
            $_SESSION['UserID'] = $userRecord[0]["UserID"];
            $_SESSION['UserName'] = $userRecord[0]["UserName"];
            $_SESSION['UserType'] = $userRecord[0]["UserType"];
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
                $this->setSession($record);
                $type = $_SESSION['UserType'];
                return $this->userType($type);
            }
            else{
                return "invalid user";
            }
            
        }

    }

?>