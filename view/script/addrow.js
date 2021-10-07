 function addRowOrder(itemPrice) {       
    var ItemID = document.getElementById("ItemID"); 
    var Quantity = document.getElementById("Quantity");
    var Total = document.getElementById("Total");
    if (ItemID.value > 0 && Quantity.value > 0) {
        var table = document.getElementById("myTableData"); 
        var rowCount = table.rows.length; 
        var row = table.insertRow(rowCount); 
        row.insertCell(0).innerHTML= '<input type="text" value = "' + ItemID.value + '" name="ItemID'+ rowCount + '" id="ItemID' + rowCount + '" style="border:none" size=5 readonly >'; 
        row.insertCell(1).innerHTML= '<input type="text" value = "' + Quantity.value + '" name="Quantity'+ rowCount + '" style="border:none" size=5 readonly >';
        
        itemPrice.forEach(element => {
            // console.log(element['ItemID'], ItemID);
            if (element['ItemID'] == ItemID.value) {
                var tot = element['Price'] * Quantity.value;
                var Tot = parseInt(Total.value) + tot;
                row.insertCell(2).innerHTML= '<input type="text" class="Price" value = "' + tot + '" id="Price'+ rowCount +'" style="border:none" size=5 readonly >';
                Total.setAttribute("value", Tot); 
            }
        });
        
        row.insertCell(3).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRowOrder(this)">'; 
        document.getElementById("add").setAttribute("disabled", true);
    }
} 
 
function deleteRowOrder(obj) {  
    var index = obj.parentNode.parentNode.rowIndex;   
    var Table = document.getElementById("myTableData");
    var Total = document.getElementById("Total");
    var Price = Table.rows[index].getElementsByClassName("Price")[0].value;
    var Tot = Total.value - Price;
    Total.setAttribute("value", Tot);
    Table.deleteRow(index);
} 


var rows = 0;

function addRow() {    
   rows++;     
   var ItemID = document.getElementById("ItemID"); 
   var Quantity = document.getElementById("Quantity"); 
   var table = document.getElementById("myTableData"); 
   var rowCount = table.rows.length; 
   var row = table.insertRow(rowCount); 
   row.insertCell(0).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRowInvoice(this)">'; 
   row.insertCell(1).innerHTML= '<input type="text" value = "' + ItemID.value + '" name="ItemID'+ rows +'" style="border:none" size=5 readonly >'; 
   row.insertCell(2).innerHTML= '<input type="text" value = "' + Quantity.value + '" name="Quantity'+ rows +'" style="border:none" size=5 readonly >'; 
} 

function deleteRowInvoice(obj) {    
   rows--; 
   var index = obj.parentNode.parentNode.rowIndex; 
   var table = document.getElementById("myTableData"); 
   table.deleteRow(index);    
} 




 
