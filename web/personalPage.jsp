<%-- 
    Document   : personalPage
    Created on : Feb 27, 2023, 5:02:28 PM
    Author     : PHAT
--%>

<%@page import="java.sql.Date"%>
<%@page import="sample.dto.Account"%>
<%@page import="sample.dao.AccountDAO"%>
<%@page import="sample.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <header>
        <%@include file="header.jsp" %> 
        <%@include file="header_loginedUser.jsp" %> 
    </header>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            Date fromDate = (Date) request.getAttribute("fromDate");
            Date toDate = (Date) request.getAttribute("toDate");
            int statusParam = (request.getParameter("status") != null) ? Integer.parseInt(request.getParameter("status")) : -1;
            if (name!= null) {
        %>
        <section class="pt-3">
            <h3 style="padding-left: 1%;">Welcome <%= name%> | <a href="mainController?action=logout">Logout</a></h3>
        </section>
        <section>
            <%
                ArrayList<Order> list = new ArrayList<>();
                if (fromDate != null && toDate != null) {
                    list = OrderDAO.getOrders(email, fromDate, toDate);
                } else if (statusParam > 0) {
                    list = OrderDAO.getOrders(email, statusParam);
                } else {
                    list = OrderDAO.getOrders(email);
                }
                String[] statuses = {"", "processing", "completed", "canceled"};
                if (list != null && !list.isEmpty()) {
                    for (Order ord : list) {
            %>
            <table class="order">
                <tr>
                    <td>Order ID</td><td>Order Date</td><td>Ship Date</td><td>Order's status</td><td>Action</td>
                </tr>
                <tr>
                    <td><%= ord.getOrderID()%></td>
                    <td><%= ord.getOrderDate()%></td>
                    <td><%= ord.getShipDate() == null ? "N/A" : ord.getShipDate()%></td>   
                    <td style="color:darkgreen;font-weight: 600;"><%= statuses[ord.getStatus()]%>
                        <br/><% if (ord.getStatus() == 1) {%><a href="cancelOrderServlet?orderid=<%=ord.getOrderID()%>">Cancel order </a>
                        <% } else if (ord.getStatus() == 3) {%><a href="orderAgainServlet?orderid=<%=ord.getOrderID()%>">Order again </a> <%}%>
                    </td>
                    <td style="color:darkgreen;font-weight: 600;"><a href="orderDetail.jsp?orderid=<%= ord.getOrderID()%>">View detail</a></td>
                </tr>
            </table>
            <%
                }
            } else {
            %>
            <p style="color:green; font-weight: bold; padding-left: 1%;" >No orders founded</p>
            <% } %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <%
        } else {
        %>
        <p><font color='red'>you must login to view your orders</font></p>
            <% }%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
