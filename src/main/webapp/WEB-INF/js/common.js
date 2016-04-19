
$(document).ready(function(){

    $(".cart").click(function(){
        $(this).parent(".products-main").find(".ok").css("display", 'block');
        $(this).css("display", "none");
        $(".cart").preventDefault();

    });



    $(".hover").click(function () {
        var data2 = {'toAdd[]': []};
        $(".item").each(function () {
            data2['toAdd[]'].push($(this).val());
        });
        $.post("/addtobasket", data2); });

    $('#send').click(function () {
            alert("dsa");
            var data2 = {'toAdd[]': []};
            $(":checked").each(function () {
                data2['toAdd[]'].push($(this).val());
            });
            $.post("/addtobasket", data2);

        }
    );

    $('#delete_product').click(function(){
        var data = { 'Delete[]' : []};
        $(":checked").each(function() {
            data['Delete[]'].push($(this).val());
        });
           alert('deleted!');
        $.post("/delproduct", data);

    });

});