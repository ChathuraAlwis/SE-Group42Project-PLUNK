<?php

    class DB{

        public $error = "";
        private $pdo = null;
        private $stmt = null;

        function __construct(){

            try{
                $this->pdo = new PDO(
                    "mysql:host = ".DB_HOST.";dbname = ".DB_NAME.";charset = ".DB_CHARSET,
                    DB_USER, DB_PASSWORD, [
                        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
                    ]
                    );
            } catch (Exception $ex) { die($ex->getMessage());}

        }

        function __destruct(){
            if ($this->stmt!==null) {$this->stmt = null;}
            if ($this->pdo!==null) {$this->pdo = null;}
        }

        //for executing queries
        function runQuery($sql, $cond=null){
            $result = false;
            try{
                $this->stmt = $this->pdo->prepare($sql);
                $this->stmt->execute($cond);
                $result = $this->stmt->fetchAll();
                return $result;
            }
            catch(Exception $ex){
                $this->error = $ex->getMessage();
                return $this->error;
            }
        }

    }

    define('DB_HOST', 'localhost');
    define('DB_NAME', 'plunk');
    define('DB_CHARSET', 'utf8');
    define('DB_USER', 'root');
    define('DB_PASSWORD', '');

?>
