<%-- 
    Document   : productDetails
    Created on : Mar 9, 2023, 12:23:31 PM
    Author     : PHAT
--%>

<%@page import="sample.dao.PlantDAO"%>
<%@page import="sample.dto.Plant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <section>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
            <table class="form-table">
                <tr><td rowspan="8"><img src="${plantObj.imgpath}" class="plantimg" width="480"></td></tr>
                <tr><td>ID: ${plantObj.id}</td></tr>
                <tr><td>Product name: ${plantObj.name}</td></tr>
                <tr><td>Price: ${plantObj.price}</td></tr>
                <tr><td>Description: ${plantObj.description}</td></tr>
                <tr><td>Status: ${plantObj.status}</td></tr>
                <tr><td>Cate ID: ${plantObj.cateid}</td></tr>
                <tr><td>Category: ${plantObj.catename}</td></tr>
            </table>
        </body>
    </section>
</body>
</html>
