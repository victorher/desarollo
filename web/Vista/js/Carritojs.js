$(document).ready(function (){
    
    $('.EliminarPed').on('click',function(e){
      
       e.preventDefault();
         
        
        var elemento = $(this);
        var Iddiseno = elemento.parent().find('.diseno').text();  
       
        /*var btn =$('.EliminarPed').index(this);
        var Iddiseno =$('.diseno').eq(btn);
        alert(btn);
        
        var Iddiseno = Iddiseno.val();
        alert(Iddiseno);*/
       
       $.ajax({
            type: 'POST',
            url:'ServletEliCarrito',
            data:{
                Iddiseno:Iddiseno,
                
            },
            success:function(){
                elemento.parent().parent().remove();
               
            } 
        });
        
        
        
        
   });
    
});




