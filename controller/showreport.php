<?php
require_once "../../model/database.php";


class Report{

    private $DB;
    private $ReportName;

    function __construct($report){
        $this->DB = new DB;
        $this->ReportName = $report;
    }

    function salaryReport($start, $end){

        echo "<table border=1 width=100% >";
        
        $names = $this->DB->runQuery("SELECT UserID, Name FROM plunk.user WHERE UserType NOT IN ('Life Member', 'HL Member', 'Ordinary Member');");
        $cols = count($names);
        echo "<tr><td></td>";
        for ($col=0; $col<$cols; $col++) {
            $name = $names[$col]['Name'];
            $id = $names[$col]['UserID'];
            echo "<th> $name ($id)</th>";
        }
        echo "<th>Total</th></tr>";
        
        $result = $this->DB->runQuery("SELECT Date, Total FROM plunk.salary INNER JOIN (SELECT * FROM plunk.salarystaff INNER JOIN plunk.user WHERE salarystaff.StaffID=user.UserID) as userSalary WHERE salary.SalaryID=userSalary.SalaryID AND Date BETWEEN '$start' AND '$end' ORDER BY Date;");
        $totSum=0;
        for ($row=0; $row<count($result)/$cols; $row++) {
            $rowSum=0;
            echo "<tr>";
            $month = $result[$row+$cols-1]['Date'];
            echo "<td> $month </td>";
            for ($col=0; $col<$cols; $col++) {
                $total = $result[$col]['Total'];
                $rowSum += $total;
                echo "<td> $total </td>";
            }
            $totSum += $rowSum;
            echo "<td>$rowSum</td></tr>";
        }

        echo "</table>";
        // echo "Total = $totSum";
    }

    function serviceChargeReport($start, $end){

        echo "<table border=1 width=100% >";
        
        $names = $this->DB->runQuery("SELECT Distinct UserID, Name FROM plunk.servicechargestaff INNER JOIN plunk.user WHERE servicechargestaff.StaffID=user.UserID;");
        $nameCol = array();
        $result = $this->DB->runQuery("SELECT Date, Name, Amount, Percentage FROM plunk.servicecharge INNER JOIN (SELECT * FROM plunk.servicechargestaff INNER JOIN plunk.user WHERE servicechargestaff.StaffID=user.UserID) as userServiceCharge WHERE servicecharge.ServiceChargeID=userServiceCharge.ServiceChargeID AND Date BETWEEN '$start' AND '$end' ORDER BY Date;");
        $cols = count($names);
        echo "<tr><td></td>";
        for ($col=0; $col<$cols; $col++) {
            $name = $names[$col]['Name'];
            array_push($nameCol, $name);
            $id = $names[$col]['UserID'];
            echo "<th> $name ($id)</th>";
        }
        echo "<th>Total</th></tr>";
        $date = "1";
        $tableRow = 0;
        for ($dataRow=0; $dataRow<count($result); $dataRow++) {
            $rowSum=0;
            if($date != $result[$dataRow]['Date']){
                $date = $result[$dataRow]['Date'];
                echo "<tr><td> $date </td>";
                $index = 0;
                for ($col=$dataRow; $col<$cols+$dataRow; $col++) {
                    if($date ==  $result[$col]['Date']){
                        $amount = $result[$col]['Amount'];
                        $per = $result[$col]['Percentage'];
                    }
                    else {
                        $amount = $per = 0;
                    }
                    $rowSum += $amount;
                    echo "<td> $amount ($per%) </td>";
                }
                echo "<td>$rowSum</td></tr>";
            }else{
                
            }
        }

        echo "</table>";
    }
}
?>