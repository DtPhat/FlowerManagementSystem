<%-- 
    Document   : header
    Created on : Feb 27, 2023, 4:07:42 PM
    Author     : PHAT
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <nav class="navbar navbar-expand-sm ">
            <div class="container-fluid">
                <ul class="navbar-nav d-flex justify-content-between">
                    <li class="h2"><a href="index.jsp"><img src="images/logo2.jpg" class="logo"></a></li>
                    <li class="nav-searchbar d-flex justify-content-center">
                        <form action="mainController" method="post" class="d-flex align-items-center gap-2">
                            <label for="txtsearch" style="cursor: pointer;">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" style="width: 2.5rem; color: green">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
                                </svg>
                            </label>
                            <input id="txtsearch" type="text" name="txtsearch" class="form-control nav-txtsearch" placeholder="Search..." value="<%= (request.getParameter("txtsearch") == null ? "" : request.getParameter("txtsearch"))%>">
                            <select name="searchby" class="form-select">
                                <option value="byname">by name</option>
                                <option value="bycate">by category</option>s
                            </select >
                            <input type="submit" class="btn btn-success" value="search" name="action" >
                        </form>
                        <a class="nav-link d-flex" href="mainController?action=viewcart" style="margin-left:3rem; padding-top: 0.5rem">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor" style="width: 3rem;">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z" />
                            </svg>
                            <%
                                HashMap<String, Integer> headerCart = (HashMap<String, Integer>) session.getAttribute("cart");
                                int cartSize = 0;
                                if (headerCart != null && headerCart.size() > 0) {
                                    for (int quantity : headerCart.values()) {
                                        cartSize += quantity;
                                    }
                                }
                            %>
                            <p style="color:darkgreen;"><%= cartSize%></p>
                        </a>
                    </li>
                    <li class="d-flex justify-content-end"><a class="nav-link" href="registration.jsp">Register</a><span class="nav-link">|</span><a class="nav-link" href="login.jsp">Login</a></li>
                </ul>  
            </div>
        </nav>                            
    </body>
</html>


