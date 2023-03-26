<%-- 
    Document   : viewCart
    Created on : Mar 6, 2023, 9:05:11 PM
    Author     : PHAT
--%>


<%@page import="sample.dao.PlantDAO"%>
<%@page import="sample.dto.Plant"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
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
                String name = (String) session.getAttribute("name");
                if (name != null) {
            %>
            <h3>Welcome <%=session.getAttribute("name")%> | <a href="mainController?action=logout">Logout</a></h3>

            <h3> 🡆 <a href="personalPage.jsp">Personal page</a></h3>
            <%
                }
            %>
            <table class="table table-striped">
                <%
                    HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                    Plant plant = null;
                    int totalMoney = 0;
                    if (cart != null) {
                %>
                <thead><th>Product ID</th><th>Image</th><th>Price</th><th>Quantity</th><th colspan="2">Action</th></thead>
                <tbody>
                    <%
                        Set<String> pids = cart.keySet();
                        for (String pid : pids) {
                            int quantity = cart.get(pid);
                            plant = PlantDAO.getPlant(Integer.parseInt(pid));
                            totalMoney += plant.getPrice() * quantity;
                    %>
                <form action="mainController" method="post">
                    <tr>
                        <td><input type="hidden" value="<%= pid%>" name="pid"><a href="getPlantServlet?pid=<%=pid%>" style="font-weight:bold"><%= pid%></a></td>
                        <td><img class="cart-img" src="<%=plant.getImgpath()%>" alt="plantimg" /></td>
                        <td><%= plant.getPrice()%></td>
                        <td><input type="number" value="<%= quantity%>" name="quantity" min=1></td>
                        <td><input type="submit" value="update" name="action" class="btn btn-success"></td>
                        <td><input type="submit" value="delete" name="action" class="btn btn-success"></td>
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
                <div>Total money: <%=totalMoney%>$</div>
                <div>Order Date: <%= (new Date()).toString()%></div>
                <div>Ship Date: N/A</div>
                <form action="mainController" method="post">
                    <input type="submit" value="buy" name="action" class="btn btn-success px-4">
                </form>
            </div>
            <font style = "color:red; font-weight: 600;" > <%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%></font>

        </section>
        <footer>
            <%@ include file="footer.jsp" %>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
