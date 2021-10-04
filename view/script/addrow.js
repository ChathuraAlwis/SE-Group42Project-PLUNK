 var rows = 0;

 function addRow() {    
    rows++;     
    var ItemName = document.getElementById("ItemName"); 
    var Quantity = document.getElementById("Quantity"); 
    var table = document.getElementById("myTableData"); 
    var rowCount = table.rows.length; 
    var row = table.insertRow(rowCount); 
    row.insertCell(0).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRow(this)">'; 
    row.insertCell(1).innerHTML= '<input type="text" value = "' + ItemName.value + '" name="ItemID'+ rows +'" style="border:none" readonly >'; 
    row.insertCell(2).innerHTML= '<input type="text" value = "' + Quantity.value + '" name="Quantity'+ rows +'" style="border:none" readonly >'; 
} 
 
function deleteRow(obj) {    
    rows--; 
    var index = obj.parentNode.parentNode.rowIndex; 
    var table = document.getElementById("myTableData"); 
    table.deleteRow(index);    
} 

 
