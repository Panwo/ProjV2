<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta charset ="urf-8">
     <!----------------классический-------------------------------->
    <link rel ="stylesheet" href = "/WEB-INF/pages/style/bootstrap.min.css">
    <link rel ="stylesheet" href = "/WEB-INF/pages/style/style.css">
    <link rel="stylesheet" href="/WEB-INF/pages/style/styleff.css" />
        
    <script src="/webapp/static/style/js/jquery-1.11.1.min.js"> </script>
    <script src="/res/http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
    <script src="/webapp/static/style/js/login.js"></script>

    <title>Подарки</title>

    <!-------- 2 способ - ------------------------------------>
    <link href="<c:url value="/WEB-INF/pages/style/style.css" />" rel="stylesheet">
    <link href="<c:url value="/WEB-INF/pages/style/bootstrap.min.css" />" rel="stylesheet">


</head>

<body>
    

<div class="container">

    <div class="row" id = "header">
       <div class = "span12">
           <div class = "logo1">
           <img src="img/2.jpg" class="img-circle">
           </div>
           
 <div id="men">
 <a class="btn btn-primary"  href="html.html">Главная</a>
    <a class="btn btn-primary" href="/top/7">Топ</a>


 <a class="btn btn-primary" href="/%D0%BE%D0%BF%D1%82%D0%BE%D0%B2%D0%B8%D0%BA%D0%B0%D0%BC.html">Контакты</a>
  <div id="bar">
        <div id="container">
            <!-- Login Starts Here -->
            <div id="loginContainer">
                <a href="#" id="loginButton"><span>Login</span><em></em></a>
                <div style="clear:both"></div>
                <div id="loginBox">                
                    <form id="loginForm">
                        <fieldset id="body">
                            <fieldset>
                                <label for="email">Email Address</label>
                                <input type="text" name="email" id="email" />
                            </fieldset>
                            <fieldset>
                                <label for="password">Password</label>
                                <input type="password" name="password" id="password" />
                            </fieldset>
                            <input type="submit" id="login" value="Sign in" />
                            <label for="checkbox"><input type="checkbox" id="checkbox" />Remember me</label>
                        </fieldset>
                        <span><a href="#">Forgot your password?</a></span>
                    </form>
                </div>
            </div>
            <!-- Login Ends Here -->
        </div>
    </div>
       </div>
       </div>
    </div>  
         
    <div class="row" id = "content">

        <div class="span3 sidebar">
          
          <div class="side1">

        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" id = "smenu">
          <li><a tabindex="-1" href="/top/1">Для девушек</a></li>
            <li><a tabindex="-1" href="/top/2">Для мужчин</a></li>
             <li><a tabindex="-1" href="/top/3">Для детей </a></li>
             <li class="dropdown-submenu">
                 <a tabindex="-1" href="#">Для праздника</a>
                  <ul class="dropdown-menu">
                  <li><a tabindex="-1" href="/top/4">День рождения</a></li>
                      <li><a tabindex="-1" href="/top/6">Новый год</a></li>

                
    </ul>
             <li><a tabindex="-1" href="#">Праздничные акции</a></li>
            <li><a tabindex="-1" href="#"></a></li>
                 
</ul>
          </div>
          

   </div>
        <div class="span8 text">

          <h5>BACKET HERE!!!!!     </h5>
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