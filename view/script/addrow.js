 var rows = 0;

 function addRow(itemPrice) {    
    rows++;     
    var ItemName = document.getElementById("ItemName"); 
    var Quantity = document.getElementById("Quantity");
    var Total = document.getElementById("Total");
    if (ItemName.value > 0 && Quantity.value > 0) {
        var table = document.getElementById("myTableData"); 
        var rowCount = table.rows.length; 
        var row = table.insertRow(rowCount); 
        row.insertCell(0).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRowOrder(this)">'; 
        row.insertCell(1).innerHTML= '<input type="text" value = "' + ItemName.value + '" name="ItemID'+ rows +'" style="border:none" size=5 readonly >'; 
        row.insertCell(2).innerHTML= '<input type="text" value = "' + Quantity.value + '" name="Quantity'+ rows +'" style="border:none" size=5 readonly >';

        itemPrice.forEach(element => {
            // console.log(element['ItemID'], ItemID);
            if (element['ItemID'] == ItemName.value) {
                var tot = element['Price'] * Quantity.value;
                var Tot = parseInt(Total.value) + tot;
                row.insertCell(3).innerHTML= '<input type="text" value = "' + tot + '" id="Price'+ rows +'" style="border:none" size=5 readonly >';
                Total.setAttribute("value", Tot); 
            }
        });
        
    }
} 
 
function deleteRowOrder(obj) {    
    rows--; 
    var index = obj.parentNode.parentNode.rowIndex; 
    var table = document.getElementById("myTableData");
    var Total = document.getElementById("Total");
    var price = document.getElementById("Price" + index).value;
    // console.log(price.value);
    var Tot = Total.value - price;
    Total.setAttribute("value", Tot);
    table.deleteRow(index);    
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




 
