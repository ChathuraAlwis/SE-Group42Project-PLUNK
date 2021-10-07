<?php
    require_once "../../model/database.php";
    

    class Table{

        private $DB;
        private $tableName;
        public $recordCount;

        function __construct($table){
            $this->DB = new DB;
            $this->tableName = $table;
        }

        function show($newQuery="", $all=true){
            if($all){
                $sql = "SELECT * FROM plunk.$this->tableName";
            }
            else{
                $sql=$newQuery;
            }
            $result = $this->DB->runQuery($sql);
            $this->recordCount = $recordCount = count($result);

            $heading = false;
            echo "<table border=1 width=100% >";
            for ($row=0; $row<$recordCount; $row++) {
                echo "<tr>";
                foreach ($result[$row] as $column=>$data){
                    if (!$heading){
                        echo "<th>$column</th>";
                    }
                    else{
                        $record = http_build_query(array('record' => $result[$row]));
                        echo "<td><a href=\"update.php?data=$record\" target=\"Pages\">$data</a></td>";
                    }
                }
                echo "</tr>";
                if (!$heading){
                    $row--;
                    $heading = true;
                }
            }
            echo "</table>";
        }

    }

?>
