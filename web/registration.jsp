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
            <div class="card p-3 my-3" style="width: 25rem; margin:auto;">
                <form action="mainController" method="post" class="form">
                    <h1>Register</h1>
                    <table class="form-table">
                        <tr><td>Email:</td><td><input type="text" name="txtemail" required=""></td></tr>
                        <tr><td>Full name:</td><td><input type="text" name="txtfullname" required=""></td></tr>
                        <tr><td>Password:</td><td><input type="password" name="txtpassword" required=""></td></tr>
                        <tr>
                            <td>Phone:</td>
                            <td><input type="text" name="txtphone" required="">
                            </td>
                        </tr>
                        <tr><td></td>
                            <td colspan="2">
                                <input type="submit" value="register" name="action" class="btn btn-success">
                                <input type="reset" value="clear" class="btn btn-success"/>
                            </td></tr>
                    </table>
                </form>
                <font style = "color:red; font-weight: 600;" ><%= (request.getAttribute("warning") == null) ? "" : request.getAttribute("warning")%> </font>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
