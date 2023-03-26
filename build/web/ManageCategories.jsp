<%-- 
    Document   : ManageAccounts
    Created on : Mar 10, 2023, 11:07:47 AM
    Author     : PHAT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:import url="header_loginedAdmin.jsp"></c:import>
            <section class="wrapper">
                <h1>Categories management:</h1>
                <form action="mainController" method="post">
                    <table class="table table-striped">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Action</th>
                        </tr>
                    <c:forEach var="cate" items="${requestScope.cateList}">
                        <c:choose>
                            <c:when test="${requestScope.updateid == cate.getCateid()}">
                                <tr>
                                    <td><c:out value="${cate.getCateid()}"></c:out></td>
                                    <td><input type="text" name="catename" value="${cate.getCatename()}"></td>
                                <input type="hidden" name="updateid" value="${cate.getCateid()}" >
                                <td><input type="submit" name="action" value="save updating category" class="btn btn-success" required></td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td><c:out value="${cate.getCateid()}"></c:out></td>
                                    <td><c:out value="${cate.getCatename()}"></c:out></td>
                                    <td><a class="btn btn-success" href="mainController?action=updateCategory&updateid=${cate.getCateid()}">update</a></td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </table>
            </form>
            <form action="mainController" method="post">
                <h2 style="color:darkgreen;">Create new category</h2>
                <table class="form-table">
                    <tr><td>Category name: </td><td><input type="text" name="name" required=""></td></tr>
                    <tr><td><input type="submit" value="create category" name="action" class="btn btn-success"></td></tr>
                </table>
            </form>
        </section>
    </body>
</html>
