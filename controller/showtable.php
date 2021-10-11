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

        function show($sql, $linkPage){

            //get the returned array with data from database
            $result = $this->DB->runQuery($sql);
            
            //row count of the returned table
            $this->recordCount = $recordCount = count($result);

            $heading = false; //if table heading has been printed

            //start echoing the table
            echo "<table border=1 width=100% >";

            //loop for each record
            for ($row=0; $row<$recordCount; $row++) {
                //new row
                echo "<tr>";
                //for each column and data inside the row in the record
                foreach ($result[$row] as $column=>$data){
                    //check if heading has been printed
                    if (!$heading){
                        //heading of the table
                        echo "<th>$column</th>";
                    }
                    else{
                        //prepare data to send through get method for update forms
                        $record = http_build_query(array('record' => $result[$row]));
                        //link each data in the table with the update form
                        echo "<td><a href=\"" . $linkPage . ".php?data=$record\" target=\"Pages\">$data</a></td>";
                    }
                }
                //end row
                echo "</tr>";
                //in the first loop heading is printed
                if (!$heading){
                    //go back to the first row in the record
                    $row--;
                    //heading is printed
                    $heading = true;
                }
            }
            //end table
            echo "</table>";
        }

    }

?>
