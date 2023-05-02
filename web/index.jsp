<%-- 
    Document   : index
    Created on : Feb 27, 2023, 4:14:18 PM
    Author     : PHAT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.dao.LaptopDAO"%>
<%@page import="sample.dto.Laptop"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body class="bg-light">
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section class="wrapper">
            <div>
                <%
                    String name = (String) session.getAttribute("name");
                    if (name != null) {
                %>
                <h3>Welcome <%= name%> | <a href="mainController?action=logout">Logout</a></h3>
                <%}%>
            </div>
            <div class="row gap-5">
                <c:set var="laptopList" value="${requestScope.laptopList}" />
                <c:if test="${laptopList == null}">
                    <c:set var="laptopList" value="${LaptopDAO.getLaptops('','')}" />
                </c:if>
                <c:forEach items="${laptopList}" var="l">
                    <div class="card my-4">
                        <img src="${l.getImgpath()}" class='card-img-top laptopimg'/>
                        <div class="card-body font-weight-bold">
                            <h1 class="card-title text-center">${ l.getName()}</h5>
                                <p class="card-text">Price: ${ l.getPrice()}</p>
                                <p class="card-text"> Status:
                                    <c:choose>
                                        <c:when test="${l.getStatus() == 1}">available</c:when>
                                        <c:otherwise>not available</c:otherwise>  
                                    </c:choose>
                                </p>
                                <p class="card-text">Category: ${ l.getCatename()}</p>
                                <a class="btn btn-success w-100" href="addToCartServlet?lid=${l.getId()}">Add to cart</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>    
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
