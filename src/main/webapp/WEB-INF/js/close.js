$(document).ready(function(){

    $(".close").click(function(){
        var num = $(this).parent(".products-main").find("#irem").val();
        $.post('server.php', {irem:num}, function(data){
            $(".result").text(data);
        });
    });

});