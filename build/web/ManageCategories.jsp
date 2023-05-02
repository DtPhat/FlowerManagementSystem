<%-- 
    Document   : ManageCategories
    Created on : Apr 23, 2023, 3:20:28 PM
    Author     : PHAT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <table class="table table-striped">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Action</th>
                    </tr>
                <c:forEach items="${requestScope.cateList}" var="cate">
                    <c:choose>
                        <c:when test="${cate.getCateid() == param.updateId}">
                            <form action="mainController" method="post">
                                <input type="hidden" name="cateid" value="${cate.getCateid()}">
                                <tr>
                                    <td>${cate.getCateid()}</td>
                                    <td><input type="text" name="catename" value="${cate.getCatename()}"></td>
                                    <td>
                                        <input type="submit" name="action" value="submit updating category" class="btn btn-success">
                                        <a href="manageCategoriesServlet" class="btn btn-danger">X</a>
                                    </td>
                                </tr>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td>${cate.getCateid()}</td>
                                <td>${cate.getCatename()}</td>
                                <td>
                                    <a href="manageCategoriesServlet?updateId=${cate.getCateid()}" class="btn btn-success">Update</a>
                                    <a href="deleteCategoryServlet?cateid=${cate.getCateid()}" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </table>
            <p style = "color:red; font-weight: 600; height: 12px;" ><%= (request.getAttribute("warning") == null) ? "" : request.getAttribute("warning")%> </p>
            <h1>Adding new category:</h1>
            <form action="mainController" method="post">
                <table class="form-table">
                    <tr><td>Name:</td><td><input type="text" name="catename" required=""></td></tr>
                    <tr><td colspan="2">
                            <input type="submit" value="create category" name="action" class="btn btn-success">
                            <input type="reset" value="clear" class="btn btn-success"/>
                        </td></tr>
                </table>
            </form>
        </section>
    </body>
</html>
