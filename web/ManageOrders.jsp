<%-- 
    Document   : ManageAccounts
    Created on : Mar 10, 2023, 11:07:47 AM
    Author     : PHAT
--%>

<%@page import="sample.dao.AccountDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">        
    </head>    
    <body>
        <c:import url="header_loginedAdmin.jsp"></c:import>
            <section class="wrapper">
                <h1>Orders management:</h1>
                <div class="py-3 d-flex" style="color:green; font-weight: bold;">
                    <form action="mainController" method="post" class="nav-form d-flex align-items-center gap-2">
                        <span>From: </span><input type="date" name="from">
                        <span>to </span><input type="date" name="to">
                        <input type="submit" name="action" value="filter orders by date" class="btn btn-success">
                    </form>
                </div>
                <div class="py-3 d-flex" style="color:green; font-weight: bold;">
                    <form action="mainController" method="post" class="nav-form d-flex align-items-center gap-2">
                        Email: <input type="text" placeholder="customer@gmail.com" name="email"/>
                        <input type="submit" name="action" value="filter orders by email" class="btn btn-success">
                    </form>
                </div>
                <table class="table table-striped">
                    <tr>
                        <th>ID</th>
                        <th>Order date</th>
                        <th>Ship date</th>
                        <th>Status</th>
                        <th>Account ID</th>
                        <th>User name</th>
                    </tr>
                <c:forEach var="ord" items="${requestScope.orderList}">
                    <tr>
                        <td><c:out value="${ord.getOrderID()}"></c:out></td>
                        <td><c:out value="${ord.getOrderDate()}"></c:out></td>
                        <td><c:out value="${ord.getShipDate()}"></c:out></td>
                        <td><c:out value="${ord.getStatus()}"></c:out></td>
                        <td><c:out value="${ord.getAccID()}"></c:out></td>
                        <td><c:out value="${AccountDAO.getName(ord.getAccID())}"></c:out></td>
                    </tr>
                </c:forEach>
            </table>
        </section>
    </body>
</html>
