var prevTax = 0;

function addTax(){
    console.log(prevTax);
    var Total = document.getElementById("Total");
    var Tax = document.getElementById("Tax");

    var newTax = Tax.value; 
    var tot = parseInt(Total.value) - prevTax + parseInt(newTax);
    Total.setAttribute("value", tot); 

    prevTax = newTax;
}