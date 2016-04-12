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
<div id = form>

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
    </P><P><INPUT type="submit"  value="Добавить товар!"></P>

</FORM>


                        </div>
    </div>

</BODY></HTML>