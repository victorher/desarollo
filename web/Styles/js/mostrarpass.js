$(document).ready(function(){
    $('#show').mousedown(function(){
        $('#pass').removeAttr('type');
        $('#show').addClass('fa-eye-slash').removeClass('fa-eye');
    });
    
    $('#show').mouseup(function() {
        $('#pass').attr('type', 'password');
        $('#show').addClass('fa-eye').removeClass('fa-eye-slash');
    });
});

