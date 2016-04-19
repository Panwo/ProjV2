<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel ="stylesheet" href = "/style/bootstrap.min.css">
    <link rel ="stylesheet" href = "/style/style.css">
    <link rel ="stylesheet" href = "/style/reveal.css">
    <link rel ="stylesheet" href = "/style/form-open.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script src=" /js/jquery-1.4.4.min.js"></script>
    <script src=" /js/jquery.reveal.js"></script>
    <script src=" /js/common.js"></script>

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

            <div id="men">
                <a class = "btn btn-danger" href="/logout"> Logout</a>

            </div>

        </div>
    </div>

    <div class="row" id = "content">
        <div class="span3 sidebar">

            <div class="side1">
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" id = "smenu">
                    <li><a tabindex="-1" href="/admin" >Все товары</a></li>
                    <li><a tabindex="-1" href="/pruductpp" data-reveal-id="myModal1">Добавить товары</a></li>
                    <li><a tabindex="-1" id="delete_product"  href="#">Удалить выбранные</a></li>
                    <li><a tabindex="-1" href="/grouppp" data-reveal-id="myModal">Добавить группу </a></li>
                    <li><a tabindex="-1" href="/showall">Список юзеров </a></li>
                    <li><a tabindex="-1" href="/showorders">Список заказов </a></li>
                    <li class="dropdown-submenu">
                        <a tabindex="-1" href="#">Категории:</a>
                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#">День рождения</a></li>
                            <li><a tabindex="-1" href="#">Корпоратив</a></li>
                            <li><a tabindex="-1" href="#">Новый год</a></li>
                            <li><a tabindex="-1" href="#">Женский день</a></li>
                            <li><a tabindex="-1" href="#">Мужской день</a></li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Для праздника</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="#">День рождения</a></li>

                                    <li><a tabindex="-1" href="#">Новый год</a></li>


                                </ul>
                        </ul>

                </ul>

            </div>


        </div>
        <div class="span9 text">





            <div class="catalog">


                <!----------------------------insert here ---------------------------------------->


                <c:if test="${not empty users}">
                    <h2  align ="center">Список юзеров</h2>
                <table class="table table-striped" id = "usertable"   >
                    <thead>
                    <tr>
                        <td><b>Name</b></td>
                    </tr>
                    </thead>
                    <c:forEach items="${users}" var = "users">
                        <tr>
                            <td>${users.username}</td>

                        </tr>
                    </c:forEach>


                </table>
                </c:if>

                <c:if test="${not empty orderlist}">
                    <h2  align ="center">Список заказов</h2>
                <table class="table table-striped"  id = "ordertable">
                    <thead>
                    <tr>
                        <td><b>Имя </b></td>
                        <td><b>Телефон</b></td>
                        <td><b>Товары</b></td>
                        <td><b>Стоимость</b></td>
                        <td><b>Время</b></td>
                    </tr>
                    </thead>

                    <c:forEach items="${orderlist}" var = "orders">
                    <tr>
                        <td>${orders.name}</td>
                        <td>${orders.phone}</td>

                        <td>
                            <textarea rows="3">${orders.list}</textarea>
                        </td>
                        <td>${orders.amount}</td>
                        <td>${orders.creationtime}</td>
                    </tr>
                    </c:forEach>
                </table>
</c:if>


                <div id="myModal" class="form-open reveal-modal">
                    <div id = "backs">

                        <br>
                        Существующие категории:
                        </br>
                        <select name = "category">
                            <c:forEach items="${categories}" var="category">
                                <option value="${category.id}">${category.category_name}</option>
                            </c:forEach>
                        </select>
                        <br>
                        <div id = "form">

                            <FORM name="contact_form"   action="/addgroup" method="post" >

                                <H2>Добавить продукт в базу данных</H2>

                                Имя категории:
                                </br>

                                <INPUT type="text" name="category_name">

                                <P><INPUT type="submit"  value="Добавить категорию!"></P>

                            </FORM>


                        </div>
                    </div>

                </div>

                <div id="myModal1" class="form-open reveal-modal">
                    <div id = "backs">
                        <div id = "form">

                            <FORM name="contact_form"  enctype="multipart/form-data" action="/addproduct"  method="post" >

                                <H2>Добавить продукт в базу данных</H2>
                                <br>
                                Категория:
                                </br>
                                <select name = "category">
                                    <c:forEach items="${categories}" var="category">
                                        <option value="${category.id}">${category.category_name}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                Описание:
                                </br>
                                <INPUT type="text" name="description">

                                <P>
                                    Цена
                                </p>

                                <INPUT type="text" name="price">
                                <br>
                                Изображение:
                                </br>
                                <input type="file" name="photo"  />

                                </br>
                                <P><INPUT type="submit"  value="Добавить товар!"></P>

                            </FORM>


                        </div>
                    </div>
                </div>




                <!---------------------  end of main div--------------------------------------------------------->


            </div>



            <a href="#" title="Вернуться к началу" class="topbutton">^Наверх</a>
        </div>

        <div class="pagination" id = "navbar">
            <ul>
                <li><a href="#">Prev</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">Next</a></li>
            </ul>
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