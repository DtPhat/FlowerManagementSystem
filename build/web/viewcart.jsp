<%-- 
    Document   : viewcart
    Created on : Apr 18, 2023, 2:11:41 PM
    Author     : PHAT
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="sample.dao.LaptopDAO"%>
<%@page import="sample.dto.Laptop"%>
<%@page import="java.util.HashMap"%>
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
        <section class="wrapper">
            <%
                int totalMoney = 0;
                String name = (String) session.getAttribute("name");
                if (name != null) {
            %>
            <h3>Welcome <%=session.getAttribute("name")%> | <a href="mainController?action=logout">Logout</a></h3>
            <h3> 🡆 <a href="personalPage.jsp">Order History</a></h3>
            <%
                }
            %>
            <table class="table table-striped">
                <%
                    HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                    Laptop laptop = null;
                    if (cart != null) {
                %>
                <thead><th>Product ID</th><th>Image</th><th>Price</th><th>Quantity</th><th colspan="2">Action</th></thead>
                <tbody>
                    <%
                        for (String lid : cart.keySet()) {
                            int quantity = cart.get(lid);
                            laptop = LaptopDAO.getLaptop(Integer.parseInt(lid));
                            totalMoney += laptop.getPrice() * quantity;
                    %>
                <form action="mainController" method="post">
                    <tr>
                        <td><input type="hidden" value="<%= lid%>" name="lid"><a href="" style="font-weight:bold"><%=lid%></a></td>
                        <td><img class="cart-img" src="<%=laptop.getImgpath()%>" alt="laptopimg" /></td>
                        <td><%= laptop.getPrice()%></td>
                        <td><input type="number" value="<%= quantity%>" name="quantity" min=1></td>
                        <td>
                            <input type="submit" value="update" name="action" class="btn btn-success">
                            <input type="submit" value="delete" name="action" class="btn btn-success">
                        </td>
                    </tr>
                </form>
                <%
                    }
                } else {
                %>
                <tr><td style="color:green; font-weight: bold">Your cart is empty</td></tr>
                <% }
                %>
                </tbody>    
            </table>
            <div class="cart-form">
                <h4>Total money: <%=totalMoney%>$</h4>
                <% SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                    Date today = new Date();%>
                <div>Order Date: <%= formatter.format(today)%></div>
                <div>Ship Date: N/A</div>
                <form action="mainController" method="post">
                    <input type="hidden" name="total" value="<%= totalMoney%>">
                    <input type="submit" value="check out" name="action" class="btn btn-success my-3" style="font-size: 1.4rem;">
                </form>
            </div>
            <p style = "color:red; font-weight: 600;" > <%= (request.getAttribute("warning") == null) ? "" : (String) request.getAttribute("warning")%></p>
        </section>
        <footer>
            <%@ include file="footer.jsp" %>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
