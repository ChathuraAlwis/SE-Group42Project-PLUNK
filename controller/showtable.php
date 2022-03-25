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

        function show($sql, $linkPage="none", $getdata="none", $SearchBy="none", $getdatawithname="none"){
            //for search query
            if(isset($_GET[$SearchBy])){
                $search = $_GET[$SearchBy];
            }
            
            //function caller file
            $callerFile = basename($_SERVER['PHP_SELF']);

            //get the returned array with data from database
            $result = $this->DB->runQuery($sql);
            
            //row count of the returned table
            $this->recordCount = $recordCount = count($result);

            $heading = false; //if table heading has been printed

            //start echoing the table
            echo "<table id=$this->tableName border=1 width=100% >";

            //loop for each record
            for ($row=0; $row<$recordCount; $row++) {
                //new row
                echo "<tr>";
                //for each column and data inside the row in the record
                foreach ($result[$row] as $column=>$data){
                    //check if heading has been printed
                    if (!$heading){
                        //heading of the table
                        $GetColumn = $column;
                        if(strpos($column," ")){
                            $GetColumn = str_replace(" ", "-", $column);
                            $chr = "'";
                            $GetColumn = $chr . $GetColumn . $chr;
                        }
                        if(isset($_GET[$SearchBy])){
                            echo "<th><a href=$callerFile?OrderBy=$GetColumn&$SearchBy=$search>$column</a></th>";
                        }else{
                            echo "<th><a href=$callerFile?OrderBy=$GetColumn>$column</a></th>";
                        }
                    }
                    else{
                        //prepare data to send through get method for update forms
                        $record = http_build_query(array('record' => $result[$row]));
                        //link each data in the table with the update form
                        if($linkPage!="none") {
                            if($getdata!="none"){
                                // $send = $result[$row][$getdata];
                                echo "<td><a href=\"" . $linkPage . ".php?data=$record&getdata=$getdata\" target=\"Pages\">$data</a></td>";
                            }elseif($getdatawithname!="none"){
                                $getdataname=$getdatawithname[0];
                                $getdataval=$getdatawithname[1];
                                echo "<td><a href=\"" . $linkPage . ".php?data=$record&$getdataname=$getdataval\" target=\"Pages\">$data</a></td>";
                            }else{
                                echo "<td><a href=\"" . $linkPage . ".php?data=$record\" target=\"Pages\">$data</a></td>";
                            }
                        } else {
                            echo "<td>$data</td>";
                        }
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
