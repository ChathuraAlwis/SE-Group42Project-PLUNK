 function addRow() {         
    var ItemName = document.getElementById("ItemName"); 
    var Quantity = document.getElementById("Quantity"); 
    var table = document.getElementById("myTableData"); 
    var rowCount = table.rows.length; 
var row = table.insertRow(rowCount); 
    row.insertCell(0).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRow(this)">'; 
    row.insertCell(1).innerHTML= ItemName.value; 
    row.insertCell(2).innerHTML= Quantity.value; 
} 
 
function deleteRow(obj) {     
    var index = obj.parentNode.parentNode.rowIndex; 
    var table = document.getElementById("myTableData"); 
    table.deleteRow(index);    
} 

 
