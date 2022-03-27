<?php
require_once "../../model/database.php";


class Report{

    private $DB;
    private $ReportName;

    function __construct($report){
        $this->DB = new DB;
        $this->ReportName = $report;
    }

    function salaryReport($start, $end, $own=1){

        if($own){
            $names = $this->DB->runQuery("SELECT UserID, Name FROM plunk.user WHERE UserID=$_SESSION[UserID];");
            $result = $this->DB->runQuery("SELECT Date, Total FROM plunk.salary INNER JOIN (SELECT * FROM plunk.salarystaff INNER JOIN plunk.user WHERE salarystaff.StaffID=user.UserID) as userSalary WHERE salary.SalaryID=userSalary.SalaryID AND UserID=$_SESSION[UserID] AND Date BETWEEN '$start' AND '$end' ORDER BY Date;");
        }
        else{
            $names = $this->DB->runQuery("SELECT UserID, Name FROM plunk.user WHERE UserType NOT IN ('Life Member', 'HL Member', 'Ordinary Member');");
            $result = $this->DB->runQuery("SELECT Date, Total FROM plunk.salary INNER JOIN (SELECT * FROM plunk.salarystaff INNER JOIN plunk.user WHERE salarystaff.StaffID=user.UserID) as userSalary WHERE salary.SalaryID=userSalary.SalaryID AND Date BETWEEN '$start' AND '$end' ORDER BY Date;");
        }
        $cols = count($names);
        echo "<table border=1 width=100% >";
        echo "<tr><td></td>";
        for ($col=0; $col<$cols; $col++) {
            $name = $names[$col]['Name'];
            $id = $names[$col]['UserID'];
            echo "<th> $name ($id)</th>";
        }
        if(!$own){echo "<th>Total</th>";}
        echo "</tr>";
        
        $totSum=0;
        for ($row=0; $row<count($result)/$cols; $row++) {
            $rowSum=0;
            echo "<tr>";
            $month = substr($result[$row+$cols-1]['Date'],0,7);
            echo "<td> $month </td>";
            for ($col=0; $col<$cols; $col++) {
                $total = $result[$col]['Total'];
                $rowSum += $total;
                if(!$own){echo "<td> $total </td>";}
            }
            $totSum += $rowSum;
            echo "<td>$rowSum</td></tr>";
        }
        $cols++;
        if($own){
            echo "<tr><td><b>Total Salary</b></td><td><b>$totSum</b></td></tr>";
        }else{
            echo "<tr><td colspan=$cols><b>Total Salary Amount</b></td><td><b>$totSum</b></td></tr>";
        }
        echo "</table>";
    }

    function serviceChargeReport($start, $end){

        echo "<table border=1 width=100% >";
        
        $names = $this->DB->runQuery("SELECT Distinct UserID, Name FROM plunk.servicechargestaff INNER JOIN plunk.user WHERE servicechargestaff.StaffID=user.UserID;");
        $nameCol = array();
        $userTot = array();
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
                        if(count($userTot)<$cols){
                            array_push($userTot, $amount);
                        }else{
                            $userTot[$col-$dataRow]+=$amount;
                        }
                        $per = $result[$col]['Percentage'];
                    }
                    else {
                        $amount = $per = 0;
                    }
                    $rowSum += $amount;
                    echo "<td> $amount ($per%) </td>";
                }
                echo "<td>$rowSum</td></tr>";
            }

        }
        echo "<tr><td><b>Total</b></td>";
        foreach ($userTot as $tot){
            echo "<td><b>$tot</b></td>";
        }
        $finalTot = array_sum($userTot);
        echo "<td><b>$finalTot</b></td></tr>";
        echo "</table>";
    }

    function returnGRNreport($start, $end){
        $sql = "SELECT returngrn.GRNID, CompanyName, AddDate, ItemType, ItemID, ItemName, Quantity, ReturnDate, Reason, Accepted AS 'Acceptance Status' FROM plunk.returngrnitem INNER JOIN plunk.returngrn WHERE returngrnitem.GRNID=returngrn.GRNID AND ReturnDate BETWEEN '$start' AND '$end';";
        $result = $this->DB->runQuery($sql);
        $recordCount = count($result);
        $heading = false;
        echo "<table border=1 width=100% >";
        for ($row=0; $row<$recordCount; $row++) {
            echo "<tr>";
            foreach ($result[$row] as $column=>$data){
                if (!$heading){
                    echo "<th>$column</th>";
                }
                else{
                    echo "<td>$data</td>";
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

    function leaveReport($start, $end, $own=1){
        if($own){
            $result = $this->DB->runQuery("SELECT LeaveType as 'Leave Type', sum(NoOfdays) as Leaves FROM plunk.leave INNER JOIN plunk.user WHERE plunk.leave.UserID=User.UserID AND plunk.leave.UserID=$_SESSION[UserID] AND Accepted='Yes' AND LeaveDate BETWEEN '$start' AND '$end' GROUP BY plunk.leave.UserID, plunk.leave.LeaveType;");
        }else{
            $result = $this->DB->runQuery("SELECT user.UserId, Name, UserType, sum(NoOfdays) as 'Total Leaves' FROM plunk.leave INNER JOIN plunk.user WHERE plunk.leave.UserID=User.UserID AND Accepted='Yes' AND LeaveDate BETWEEN '$start' AND '$end' GROUP BY plunk.leave.UserID;");
        }
        $totalLeaves = 0;
        $recordCount = count($result);
        $heading = false;
        echo "<table border=1 width=100% >";
        for ($row=0; $row<$recordCount; $row++) {
            echo "<tr>";
            foreach ($result[$row] as $column=>$data){
                if (!$heading){
                    echo "<th>$column</th>";
                }
                else{
                    if($column=="Total Leaves"){$totalLeaves+=$data;}
                    echo "<td>$data</td>";
                }
            }
            echo "</tr>";
            if (!$heading){
                $row--;
                $heading = true;
            }
        }
        if(!$own){echo "<tr><td colspan=3><b>Total Leaves</b></td><td><b>$totalLeaves</b></td></tr>";}
        echo "</table>";
    }

    function DailySalesReport($today, $monthly=0,$serviceCharge=FALSE){
        if($monthly){
            $date = explode("-",$today);
            $year = $date[0];
            $month = $date[1];
            $yearMonth = $year . "-" . $month . "-__";
            $result = $this->DB->runQuery("SELECT item.ItemID, ItemName, ItemType, SellingPrice, SoldQuantity, (SellingPrice*SoldQuantity) as Revenue FROM plunk.item INNER JOIN (SELECT ItemID, sum(Quantity) as SoldQuantity FROM plunk.order INNER JOIN plunk.orderitem WHERE plunk.order.OrderID=orderitem.OrderID AND OrderDate LIKE '$yearMonth' GROUP BY ItemID) as ItemQuantity WHERE item.ItemID=ItemQuantity.ItemID;");
        }else{
            $result = $this->DB->runQuery("SELECT item.ItemID, ItemName, ItemType, SellingPrice, SoldQuantity, (SellingPrice*SoldQuantity) as Revenue FROM plunk.item INNER JOIN (SELECT ItemID, sum(Quantity) as SoldQuantity FROM plunk.order INNER JOIN plunk.orderitem WHERE plunk.order.OrderID=orderitem.OrderID AND OrderDate='$today' GROUP BY ItemID) as ItemQuantity WHERE item.ItemID=ItemQuantity.ItemID;");
        }
        $totRevenue = 0;
        $recordCount = count($result);
        $heading = false;
        echo "<table border=1 width=100% >";
        for ($row=0; $row<$recordCount; $row++) {
            if(!$serviceCharge) echo "<tr>";
            foreach ($result[$row] as $column=>$data){
                if (!$heading){
                    if(!$serviceCharge) echo "<th>$column</th>";
                }
                else{
                    if($column=="Revenue"){
                        $totRevenue += $data;
                    }
                    if(!$serviceCharge) echo "<td>$data</td>";
                }
            }
            if(!$serviceCharge) echo "</tr>";
            if (!$heading){
                $row--;
                $heading = true;
            }
        }
        $colspan = $serviceCharge ? 1 : 5;
        echo "<tr><td colspan=$colspan><b>Total Revenue</b></td><td><b>$totRevenue</b></td></tr>";
        echo "</table>";
    }
}
?>