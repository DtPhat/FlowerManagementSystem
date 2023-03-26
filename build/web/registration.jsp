<%-- 
    Document   : registration
    Created on : Feb 27, 2023, 4:20:13 PM
    Author     : PHAT
--%>

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
            <form action="mainController" method="post" class="form">
                <h1>Register</h1>
                <table class="form-table">
                    <tr><td>Email</td><td><input type="text" name="txtemail" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-zA-Z]{2,4}" required=""></td></tr>
                    <tr><td>Full name</td><td><input type="text" name="txtfullname" required=""></td></tr>
                    <tr><td>Password</td><td><input type="password" name="txtpassword" required=""></td></tr>
                    <tr>
                        <td>Phone</td>
                        <td><input type="text" name="txtphone" value="<%= (request.getAttribute("txtphone") == null) ? "" : request.getAttribute("txtphone")%>">
                            <font style = "color:red;" ><%= (request.getAttribute("ERROR") == null) ? "" : request.getAttribute("ERROR")%> </font>
                        </td>
                    </tr>
                    <tr><td colspan="2"><input type="submit" value="register" name="action" class="btn btn-success"></td></tr>
                </table>
            </form>
        </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
