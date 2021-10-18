function itemNameCheck(itemNames) {
   var ItemName = document.getElementById("ItemName");
   console.log(itemNames);
   var canAdd = true;

   itemNames.forEach(element => {
      if (element['ItemName'] == ItemName.value) {
         alert("Duplicate Item Name..");
         canAdd = false;
      }
  });

   if(canAdd){
      document.getElementById("add").disabled=false;
   }
   else{
      document.getElementById("add").disabled=true;
   }
};