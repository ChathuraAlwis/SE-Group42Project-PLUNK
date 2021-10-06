function maxQuantity(itemQuantity){
    var ItemID = document.getElementById("ItemID").value;
    var max = 0;
    itemQuantity.forEach(element => {
        // console.log(element['ItemID'], ItemID);
        if (element['ItemID'] == ItemID) {
            max = element['Quantity'];
        }
    });
    var Quantity = document.getElementById("Quantity");
    Quantity.setAttribute("max", max);
    // console.log(max);
}