<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ page isELIgnored ="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">

</HEAD>

<BODY>
    
    <div id = backs>

        <br>
        Существующие категории:
        </br>
        <select name = "category">
            <c:forEach items="${categories}" var="category">
                <option value="${category.id}">${category.category_name}</option>
            </c:forEach>
        </select>
        <br>
<div id = form>

<FORM name="contact_form"   action="/addgroup" method="post" >

<H2>Добавить продукт в базу данных</H2>

  Имя категории:
        </br>

    <INPUT type="text" name="category_name">
        
    </P><P><INPUT type="submit"  value="Добавить категорию!"></P>

</FORM>


                        </div>
    </div>

</BODY></HTML>