$(document).ready(function() {
    $('#table_id').DataTable();
    } );

    function changeType(sel) {
         var p = document.getElementById('kitchenitems');
         var b = document.getElementById('beverageitems');

         var choice = sel.value;

         if(choice == 'kitchenitems')
         {
            p.style.display = 'block';
            b.style.display = 'none';
         }
         else if(choice == 'beverageitems')
         {
             p.style.display = 'none';
             b.style.display = 'block';

         }
    };