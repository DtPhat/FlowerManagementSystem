<%-- 
    Document   : OrderDetail
    Created on : Feb 27, 2023, 10:00:20 PM
    Author     : PHAT
--%>

<%@page import="sample.dao.OrderDAO"%>
<%@page import="sample.dto.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
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
        <header>
            <%@include file="header.jsp" %>
        </header>
    <body>
        <section class="wrapper">
            <h1>Order <%= request.getParameter("orderid")%> details:</h1>
            <%
                String orderid = request.getParameter("orderid");
                if (orderid != null) {
                    int orderID = Integer.parseInt(orderid.trim());
                    ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderID);
                    if (list != null && !list.isEmpty()) {
                        int money = 0;
                        for (OrderDetail detail : list) {
            %>
            <table class="order">
                <tr><td>Order ID</td><td>Laptop ID</td><td>Laptop Name</td><td>Image</td><td>Price</td><td>Quantity</td></tr>
                <tr>
                    <td><%=detail.getOrderID()%></td><td><%=detail.getLaptopID()%></td>
                    <td><%=detail.getLaptopName()%></td>
                    <td><img src='<%= detail.getImgPath()%>' class='cart-img  m-1' /></td>
                    <td><%=detail.getPrice()%></td>
                    <td><%=detail.getQuantity()%></td>
                    <% money = money + detail.getPrice() * detail.getQuantity();%>
                </tr>
            </table>
            <% }%>
            <h3>Total money: <%=money%>$</h3>
            <% } else { %>
            <p>You don't have any order</p>
            <%
                    }
                }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</html>
