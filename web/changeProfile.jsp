<%-- 
    Document   : changeProfile
    Created on : Mar 2, 2023, 1:23:35 AM
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
            <h1>Change your profile: </h1>
            <form action="mainController" method="post" class="formlogin">
                <table class="form-table">
                    <tr><!-- comment -->
                        <td>Fullname:</td>
                        <td><input type="text" name="newfullname" value="${sessionScope.name}"/></td></tr>
                    <tr>
                        <td>Phone:</td>
                        <td><input type="text" name="newphone" value="${sessionScope.phone}"/></td></tr>
                    <tr><td colspan="2"><input type="submit" value="change profile" name="action" class="btn btn-success"></td></tr>
                </table>
            </form>
            <p class="text-success" style="font-weight: bold; padding-left: 5px;"><%= request.getAttribute("prompt") != null ? request.getAttribute("prompt") : ""%></p>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        </section>
    </body>
</html>
