function drop(){
  var dropdown = document.getElementsByClassName("button");
  var i;

  for (i = 0; i < dropdown.length; i++) {
    dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
    dropdownContent.style.display = "none";
    } else {
    dropdownContent.style.display = "block";
    }
    });
  }
}

function colorchange() {
  var btn = document.getElementById("open");
  var msg = document.getElementById("idmsg");
  
	if(msg.innerHTML == "The restaurant is closed now."){
      btn.innerHTML = "Close";
  	  msg.innerHTML = "The restaurant is opened now.";
      btn.style.backgroundColor =  "#cc0000";
		}
  else{
      btn.innerHTML = "Open";
      msg.innerHTML = "The restaurant is closed now.";
      btn.style.backgroundColor =  "#000000";
    }
  }
       