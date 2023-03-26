<%-- 
    Document   : login
    Created on : Mar 3, 2023, 10:28:32 AM
    Author     : PHAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <form action="mainController" method="post" class="formlogin">
                <font style="color:red;"> <%=(request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%></font>
                <table class="form-table">
                    <tr><td>Email</td><td><input type="text" name="txtemail"/></td></tr>
                    <tr><td>Password</td><td><input type="password" name="txtpassword"/></td></tr>
                    <tr><td colspan="2"><input type="submit" value="login" name="action" class="btn btn-success"></td></tr>
                    <tr><td colspan="2"><input type="checkbox" value="savelogin" name="savelogin"> Stay signed in</td></tr>
                </table>
        </section>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
                
</body>
</html>
