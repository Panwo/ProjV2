
$(document).ready(function(){

    $(".cart").click(function(){
	$(this).parent(".products-main").find(".ok").css("display", 'block');
	$(this).css("display", "none");
	$(".cart").preventDefault();
	
});

  $(".hover").click(function(){


      var fnumb = $(this).parent(".cart").parent(".products-main").find("#item").val();
      $.post('/addtobasketnew', {item:fnumb}, function(data){
          $(".result").text(data);

      });
  });

    $('#send').click(function () {
            alert("dsa");
            var data2 = {'toAdd[]': []};
            $(":checked").each(function () {
                data2['toAdd[]'].push($(this).val());
            });
            $.post("/addtobasket", data2);

        }
    );

});