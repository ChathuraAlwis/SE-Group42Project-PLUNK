function myFunction() {
  var x = document.getElementById("panel");
  if (x.style.display === "none") {
    x.style.display = "block";
    x.style.width = "15%";
    document.getElementById("mainpages").style.marginLeft = "15%";

  } else {
    x.style.display = "none";
    x.style.width = "0";
    document.getElementById("mainpages").style.marginLeft = "0";

  }
}
// function openNav() {
// document.getElementById("panel").style.width = "10%";
// document.getElementById("main").style.marginLeft = "10%";
//             }
// function closeNav() {
// document.getElementById("panel").style.width = "0";
// document.getElementById("main").style.marginLeft = "0";
// }
