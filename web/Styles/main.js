//dom son etiquetas de html
$(document).ready(function(){
    $('.dos').hide();
    $('.tres').hide();
    $('.cuatro').hide();
    $('.cinco').hide();
    $('.uno').on('click',function(){
       $('.tres').hide();
       $('.cuatro').hide();
       $('.cinco').hide();
       $('.dos').slideToggle(800);//slideToggle: este metodo es para ver u ocultar (800) dentro se coloca el tiempo de respues 
    });
    $('.dos').on('click',function(){
        //$('.datos').slideToggle(800);
        var x = $('.dos').index(this);//indica a cual le va a dar el indice
        var y = $('.tres').eq(x);//la propiedad eq carga los datos de x
        y.slideToggle();
    });
    $('.tres').on('click',function(){
        var a = $('.tres').index(this);
        var b = $('.cuatro').eq(a);
        b.slideToggle();
    });
    $('.cuatro').on('click',function(){
        var a = $('.cuatro').index(this);
        var b = $('.cinco').eq(a);
        b.slideToggle();
    });
} );


