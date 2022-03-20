 
 function addRowOrder(itemPrice) {    
    // console.log(itemPrice) ;  
    var ItemID = document.getElementById("ItemID");
    var Quantity = document.getElementById("Quantity");
    var Total = document.getElementById("Total");
    if (ItemID.value > 0 && Quantity.value > 0) {
        var table = document.getElementById("myTableData"); 
        var rowCount = table.rows.length; 
        var row = table.insertRow(rowCount); 
        row.insertCell(0).innerHTML= '<input type="text" value = "' + ItemID.value + '" name="ItemID'+ rowCount + '" id="ItemID' + rowCount + '" style="border:none" size=5 readonly >'; 
        itemPrice.forEach(element => {
            // console.log(element['ItemID'], ItemID);
            if (element['ItemID'] == ItemID.value) {
                row.insertCell(1).innerHTML= '<input type="text" value = "' + element['ItemName'] + '" name="ItemName'+ rowCount + '" id="ItemName' + rowCount + '" style="border:none" size=5 readonly >'; 
            }
        });
        row.insertCell(2).innerHTML= '<input type="text" value = "' + Quantity.value + '" name="Quantity'+ rowCount + '" style="border:none" size=5 readonly >';
        
        itemPrice.forEach(element => {
            // console.log(element['ItemID'], ItemID);
            if (element['ItemID'] == ItemID.value) {
                var tot = element['SellingPrice'] * Quantity.value * (100 - element['Discount']) / 100;
                row.insertCell(3).innerHTML= '<input type="text" class="SellingPrice" value = "' + tot + '" id="SellingPrice'+ rowCount +'" style="border:none" size=5 readonly >';
                var Tot = parseInt(Total.value) + tot;
                Total.setAttribute("value", Tot); 
            }
        });
        
        row.insertCell(4).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRowOrder(this)">'; 
        document.getElementById("add").setAttribute("disabled", true);

        var BillTotal = document.getElementById("BillTotal");
        var Discount = document.getElementById("Discount");
        BillTotal.value = Total.value * (110 - Discount.value) / 100;
    }
} 
 
function deleteRowOrder(obj) {  
    var index = obj.parentNode.parentNode.rowIndex;   
    var Table = document.getElementById("myTableData");
    var Total = document.getElementById("Total");
    var SellingPrice = Table.rows[index].getElementsByClassName("SellingPrice")[0].value;
    var Tot = Total.value - SellingPrice;
    Total.setAttribute("value", Tot);
    Table.deleteRow(index);

    var BillTotal = document.getElementById("BillTotal");
    var Discount = document.getElementById("Discount");
    BillTotal.value = Total.value * (110 - Discount.value) / 100;
} 

function addRowGRN(itemgrn) { 
    console.log(itemgrn) ;     
    var ItemID = document.getElementById("ItemID"); 
    var Quantity = document.getElementById("Quantity");
    var Total = document.getElementById("Total");

    if (ItemID.value > 0) {
        var table = document.getElementById("myTableData"); 
        var rowCount = table.rows.length; 
        var row = table.insertRow(rowCount); 
        row.insertCell(0).innerHTML= '<input type="text" value = "' + ItemID.value + '" name="ItemID'+ rowCount + '" id="ItemID' + rowCount + '" style="border:none" size=5 readonly >'; 
        
        itemgrn.forEach(element => {
            // console.log(element['ItemID'], ItemID);
            if (element['ItemID'] == ItemID.value) {
                row.insertCell(1).innerHTML= '<input type="text" class="ItemName" value = "' + element['ItemName'] + '"name="ItemName" id="ItemName'+ rowCount +'" style="border:none"  size=10 readonly >';
            
            }
        });
        row.insertCell(2).innerHTML= '<input type="text" value = "' + Quantity.value + '" name="Quantity'+ rowCount + '" style="border:none" size=5 readonly >';
        
        itemgrn.forEach(element => {
            // console.log(element['ItemID'], ItemID);
            if (element['ItemID'] == ItemID.value) {
                var tot = element['PurchasePrice'] * Quantity.value;
                row.insertCell(3).innerHTML= '<input type="text" class="PurchasePrice" value = "' + tot + '" id="PurchasePrice'+ rowCount +'" style="border:none" size=5 readonly >';
                var Tot = parseInt(Total.value) + tot;
                Total.setAttribute("value", Tot); 
            }
        });
        
        row.insertCell(4).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRowGRN(this)">'; 
        document.getElementById("add").setAttribute("disabled", true);
    }
} 
 
function deleteRowGRN(obj) {  
    var index = obj.parentNode.parentNode.rowIndex;   
    var Table = document.getElementById("myTableData");
    var Total = document.getElementById("Total");
    var PurchasePrice = Table.rows[index].getElementsByClassName("PurchasePrice")[0].value;
    var Tot = Total.value - PurchasePrice;
    Total.setAttribute("value", Tot);
    Table.deleteRow(index);
} 

// function addRowInvoice(itemPrice) {    
//     var ItemID = document.getElementById("ItemID"); 
//     var Quantity = document.getElementById("Quantity");
//     var Total = document.getElementById("Total");

//     if (ItemID.value > 0 && Quantity.value > 0) {
//         var table = document.getElementById("myTableData"); 
//         var rowCount = table.rows.length; 
//         var row = table.insertRow(rowCount); 
//         row.insertCell(0).innerHTML= '<input type="text" value = "' + ItemID.value + '" name="ItemID'+ rowCount + '" id="ItemID' + rowCount + '" style="border:none" size=5 readonly >'; 
        
//         itemPrice.forEach(element => {
//             // console.log(element['ItemID'], ItemID);
//             if (element['ItemID'] == ItemID.value) {
//                 row.insertCell(1).innerHTML= '<input type="text" class="Name" value = "' + element['ItemName'] + '" id="Name'+ rowCount +'" name="ItemName'+ rowCount + '" style="border:none" size=10 readonly >';
//             }
//         });
        
//         row.insertCell(2).innerHTML= '<input type="text" value = "' + Quantity.value + '" name="Quantity'+ rowCount + '" style="border:none" size=5 readonly >';
//         itemPrice.forEach(element => {
//             // console.log(element['ItemID'], ItemID);
//             if (element['ItemID'] == ItemID.value) {
//                 var tot = element['ItemCost'] * Quantity.value;
//                 row.insertCell(3).innerHTML= '<input type="text" class="Price" value = "' + tot + '" id="Price'+ rowCount +'" style="border:none" size=5 readonly >';
//                 var Tot = parseInt(Total.value) + tot;
//                 Total.setAttribute("value", Tot); 
//             }
//         });
//         row.insertCell(4).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRowOrder(this)">'; 
//         document.getElementById("add").setAttribute("disabled", true);
//     }
// } 

// function deleteRowInvoice(obj) {    
//     var index = obj.parentNode.parentNode.rowIndex;   
//     var Table = document.getElementById("myTableData");
//     var Total = document.getElementById("Total");
//     var Price = Table.rows[index].getElementsByClassName("Price")[0].value;
//     var Tot = Total.value - Price;
//     Total.setAttribute("value", Tot);
//     Table.deleteRow(index); 
// } 




 
