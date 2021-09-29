$(document).ready(function() {
    $('#table_id').DataTable();
    } );

    function changeType(sel) {
         var p = document.getElementById('Quantity');
         

         var choice = sel.value;

         if(choice == 'No')
         {
            p.style.display = 'block';
         }
         
    };