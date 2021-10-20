function setBillTotal(){
    var Total = document.getElementById("Total");
    var BillTotal = document.getElementById("BillTotal");
    var Discount = document.getElementById("Discount");
    BillTotal.value = Total.value * (110 - Discount.value) / 100;
}