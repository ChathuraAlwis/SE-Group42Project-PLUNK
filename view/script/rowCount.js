function tableRowCount(tableID){
    var Table = document.getElementById(tableID);
    var rowCount = Table.rows.length -1;

    document.getElementById("rowCount").value = rowCount;

    var rows = Table.getElementsByTagName("tr").innerHTML;
    console.log(rows);
}