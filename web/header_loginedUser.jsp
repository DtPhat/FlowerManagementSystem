<%-- 
    Document   : header_loginedUser
    Created on : Feb 27, 2023, 4:57:13 PM
    Author     : PHAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <nav class="navbar navbar-expand-sm">
            <div class="container-fluid">
                <ul class="navbar-nav navbar-user">
                    <li class="nav-item" style="width: 10%;"><a class="nav-link" href="personalPage.jsp">All orders</a></li>
                    <li class="nav-item"><a class="nav-link" href="searchOrdersByStatus?status=1">Processing orders</a></li>
                    <li class="nav-item"><a class="nav-link" href="searchOrdersByStatus?status=2">Completed orders</a></li>
                    <li class="nav-item"><a class="nav-link" href="searchOrdersByStatus?status=3">Canceled orders</a></li>
                    <li class="w-25 d-flex justify-content-end" style="color:green; font-weight: bold;">
                        <form action="mainController" method="post" class="nav-form d-flex align-items-center gap-2">
                            <span>From </span><input type="date" name="from">
                            <span>to </span><input type="date" name="to">
                            <input type="submit" name="action" value="search orders" class="btn btn-success">
                        </form>
                    </li>
                </ul>  
            </div>
        </nav>
                            
                            
    </body>
</html>
