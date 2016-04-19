$(document).ready(function(){

$(".close").click(function(){
  	var num = $(this).parent(".products-main").find("#item-rem").val();
   $.post('server.php', {item-rem:num}, function(data){
    $(".result").text(data);
    });
   });

});