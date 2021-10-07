<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="icon" href="images/bloomfieldlogo.png" sizes="32*32">
    <link rel="stylesheet" href="../style/crud.css">
    <script type="text/javascript" src="../script/addrow.js"></script>
    <script type="text/javascript" src="../script/maxQuantity.js"></script>
    <script type="text/javascript" src="../script/rowCount.js"></script>
    <title>Bloomfield</title>
</head>
<body>
    <?php
        require_once "../../model/database.php";
        $DB = new DB;
        $sql = "SELECT ItemID, Quantity, Price, Discount FROM plunk.item;";
        $result = $DB->runQuery($sql);
        setcookie("Items", json_encode($result));
    ?>
    <div class="main">
        <div class="left">
            <div class="form">
                <h2 class="center-text"><b>Add Order</b></h2>
                <form action="../../controller/CRUD.php" method="post">
                    <input name ="add-order" type="hidden" >
                    <table>
                        <div class="form-group">
                            <tr>
                                <td style="text-align: right"><label for="OrderDate">Order Date</label></td>
                                <td><input name ="OrderDate" id="OrderDate" type="date" value="<?php echo date("Y-m-d") ?>" required></td>
                                <td width=50px>&nbsp;</td>
                                <td style="text-align: right"><label for="OrderTime">Order Time</label></td>
                                <td><input name ="OrderTime" id="OrderTime" type="time" value="<?php echo date("h:m") ?>" required></td>
                            </tr>
                        </div>
                    </table>
                    <table>
                        <div class="form-group">
                            <br>
                            <tr>
                                <td><label for="OrderPlace">Order Place</label></td>
                                <td><select id="OrderPlace" name="OrderPlace" onchange="changeType(this);" required>
                                <!-- <option selected>Choose place...</option> -->
                                <option value="1">Lounge</option>
                                <option value="2">Table 1</option>
                                <option value="3">Table 2</option>
                                <option value="4">Table 3</option>
                                <option value="5">Table 4</option>
                                <option value="6">Table 5</option>
                                <option value="7">Table 6</option>
                                <option value="8">Table 7</option>
                                <option value="9">Table 8</option>
                                <option value="10">Table 9</option>
                                <option value="11">Table 10</option>
                                </select></td>
                            </tr>
                        </div>
                    </table>
                    <br>
                    <div class="form-group">
                        <div id="myform" onload="load()"> 
                            <b>Item details of the order:</b> 
                            <br>
                            <table>
                                <tr>
                                    <td>Item ID</td>
                                    <?php 
                                        echo "<td><input type=text id=ItemID onchange=maxQuantity(". $_COOKIE['Items'] .")></td>";
                                    ?>
                                </tr>
                                <tr>
                                    <td>Quantity</td>
                                    <td><input type=number id="Quantity" min=0 oninput="validity.valid||(value='');"> </td>
                                </tr>
                                <tr>
                                    <td><label for="Total">Total</label></td>
                                    <td><input name ="Total" id="Total" type="number" value=0 style="width:67%" readonly></td>
                                </tr>
                            </table>
                            <?php 
                                echo "<td><input type=button id=add value=Add onclick=addRowOrder(" . $_COOKIE['Items'] . ") disabled></td>";
                            ?> 
                        </div> 
                        <br>
                        <div id="mydata"> 
                            <b>Added Items:</b> 
                            <table id="myTableData" class="addrowtable"> 
                                <tr>
                                    <td><b>Item ID</b></td> 
                                    <td><b>Quantity</b></td> 
                                    <td><b>Price</b></td>
                                    <td>&nbsp;</td> 
                                </tr> 
                            </table>
                        </div> 
                    </div>
                    <br>
                    <input type="hidden" id="rowCount" name="rowCount" value=0>
                    <div class="form-group">
                        <button type="submit" name="submit" value="Submit" class="button submit" onclick="tableRowCount('myTableData')">Add</button>
                        <button type="reset" name="reset" value="Reset" class="button reset" >Reset</button>
                    </div>
                </form>
            </div>
        </div>
        <div class= right>
            <div class="righttable">
                <div class="itemtable">
                    <h3>ITEM TABLE</h3>
                    <iframe src="../items/itemtable.php" class="item"></iframe>
                </div>
            </div>
        </div>
    </div>
</body>
</html>