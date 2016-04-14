<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel ="stylesheet" href = "/style/bootstrap.min.css">
    <link rel ="stylesheet" href = "/style/style.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <meta charset ="urf-8">
    <title>Подарки</title>
</head>
<body>


<div class="container">


    <div class="row" id = "header">
        <div class = "span12">
            <div class = "logo1">
                <img src="img/2.jpg" class="img-circle">
            </div>

            <div id="men"> <a class="btn btn-primary"  href="index.html">Главная</a>
                <a class="btn btn-primary"  href="/pruductpp"> Добавить товары</a>
                <a class="btn btn-primary" id="delete_product"  >Удалить выбранные</a>
                 <a class = "btn-primary" href = "/grouppp"> Добавить группу  </a>
                <a class = "btn-primary" href = "/showall"> Список юзеров  </a>
                <a class = "btn btn-" href="javascript:formSubmit()"> Logout</a>

            </div>

        </div>
    </div>

    <div class="row" id = "content">
        <div class="span3 sidebar">

            <div class="side1">
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" id = "smenu">
                    <li><a tabindex="-1" href="#">Для девушек</a></li>
                    <li><a tabindex="-1" href="#">Для мужчин</a></li>
                    <li><a tabindex="-1" href="#">Для детей </a></li>
                    <li class="dropdown-submenu">
                        <a tabindex="-1" href="#">Для праздника</a>
                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#">День рождения</a></li>
                            <li><a tabindex="-1" href="#">Корпоратив</a></li>
                            <li><a tabindex="-1" href="#">Новый год</a></li>
                            <li><a tabindex="-1" href="#">Женский день</a></li>
                            <li><a tabindex="-1" href="#">Мужской день</a></li>

                        </ul>
                    <li><a tabindex="-1" href="#">Праздничные акции</a></li>
                    <li><a tabindex="-1" href="#"></a></li>

                </ul>
            </div>


        </div>
        <div class="span9 text">
            <h2  align ="center">Топ продаж</h2>


            <div class="catalog">


                <!----------------------------insert here ---------------------------------------->
                <c:forEach items="${products}" var = "products">

                    <div class="products-main">
                        <input type="checkbox" name="toDelete[]" value="${products.id}" id="checkbox_${products.id}"/>
                        <div class="product">
                            <h2><a href = "#">${products.description}</a></h2>
                            <div class="product-img"><a href = "#"><img src="111.jpg" width="320" height="240" align="middle" /></a> </div>
                            <p class="price">${products.price}<span> грн</span>
                        </div>
                        <p class="bot-dot"></p>
                    </div>


                </c:forEach>

                <!---------------------  end of main div--------------------------------------------------------->


            </div>



            <a href="#" title="Вернуться к началу" class="topbutton">^Наверх</a>
        </div>




    </div>

    <div id = "footer">

        <div class="fam"> Парамонов Владимир


        </div>

        <script type="text/javascript">(function() {
            if (window.pluso)if (typeof window.pluso.start == "function") return;
            if (window.ifpluso==undefined) { window.ifpluso = 1;
                var d = document, s = d.createElement('script'), g = 'getElementsByTagName';
                s.type = 'text/javascript'; s.charset='UTF-8'; s.async = true;
                s.src = ('https:' == window.location.protocol ? 'https' : 'http')  + '://share.pluso.ru/pluso-like.js';
                var h=d[g]('body')[0];
                h.appendChild(s);
            }})();</script>

        <div class="pluso" data-background="none;" data-options="medium,square,line,horizontal,counter,sepcounter=1,theme=14" data-services="vkontakte,facebook,google,email"></div>

        <div class="adressa">
            <a class="c__w_y" href="/content/7-contacts/"     rel="nofollow">Ждём Вас по адресу</a>
            <div class  = "blockkon">
                <span class="b">Ул. Банковая, 6</span>
                , 2-й этаж

                Тел.:
                <span class="b">+38(093)9866036</span>
                <br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="b">+38(095) 740-78-37</span>
                <br>
                Пн–Сб: 10:00-20:00, Вс: 10:00-19:00

            </div>
        </div>
        <div class="logo">
            <div class="logos">
                <img src="logo.png" height="70px">
            </div>
        </div>
    </div>


</div>





<script>
    $('#delete_product').click(function(){
        var data = { 'toDelete[]' : []};
        $(":checked").each(function() {
            data['toDelete[]'].push($(this).val());
        });

        $.post("/delproduct", data);
        location.reload();
    })



</script>
</body>

</html>