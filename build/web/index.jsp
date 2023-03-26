<%-- 
    Document   : index
    Created on : Feb 27, 2023, 4:14:18 PM
    Author     : PHAT
--%>

<%@page import="sample.dao.PlantDAO"%>
<%@page import="sample.dto.Plant"%>
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
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section class="wrapper">
            <div class="row gap-5" style="padding-left: 2rem;">
            <%
                String name = (String) session.getAttribute("name");
                String keyword = (String) request.getParameter("txtsearch");
                String searchby = (String) request.getParameter("searchby");
                ArrayList<Plant> list;
                String[] statuses = {"out of stock", "available"};
                if (keyword == null && searchby == null) {
                    list = PlantDAO.getPlants("", "");
                } else {
                    list = PlantDAO.getPlants(keyword, searchby);
                }
                if (list != null && !list.isEmpty()) {
                    for (Plant p : list) {%>
                <div class="card my-5">
                    <img src="<%=p.getImgpath()%>" class='card-img-top plantimg' />
                    <div class="card-body font-weight-bold">
                        <h1 class="card-title text-center"><%= p.getName()%></h5>
                        <p class="card-text">Price: $<%= p.getPrice()%></p>
                        <p class="card-text">Status: <%= statuses[p.getStatus()]%></p>
                        <p class="card-text">Category: <%= p.getCatename()%></p>
                        <a class="btn btn-success w-100" href="mainController?action=addtocart&pid=<%= p.getId()%>">Add to cart</a>
                    </div>
                </div>
            <%    }
                } else{
            %>
            <h4 class="text-success" style="font-weight: 700;">No plants founded!</h4>
            <%
                }
            %>
            </div>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
