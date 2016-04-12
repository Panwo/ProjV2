<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="js/jquery-1.11.1.min.js"> </script>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
    <script src="js/login.js"></script>

    <meta charset ="urf-8">
    <title>Корзина</title>


</head>
<body>


<div class="container">


    <div class="row" id = "header">
        <div class = "span12">
            <div class = "logo1">
                <img src="2.jpg" class="img-circle">
            </div>

            <div id="men">
                <a class="btn btn-primary"  href="html.html">Главная</a>
                <a class="btn btn-primary" href="top.html">Каталог</a>
                <a class="btn btn-primary" href="/%D0%BE%D0%BF%D1%82%D0%BE%D0%B2%D0%B8%D0%BA%D0%B0%D0%BC.html">Контакты</a>
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


                </ul>
            </div>


        </div>
        <div class="span8 text">
            <h1>Ваши заказы:</h1>
            <!----------------------------insert jsp here----------------------------------------------->

            <!------------------------------------------------------------------->
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

</body>

</html>