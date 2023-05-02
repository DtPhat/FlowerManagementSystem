<%-- 
    Document   : ManageLaptops
    Created on : Apr 19, 2023, 4:31:41 PM
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
                <h1>Laptops Management:</h1>
                <table class="table table-striped">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Description</th>
                        <th>status</th>
                        <th>Category</th>
                        <th>Action</th>
                    </tr>
                <c:forEach var="laptop" items="${requestScope.laptopList}">
                    <c:choose>
                        <c:when test="${param.updateId != laptop.getId()}">
                            <tr>
                                <td><c:out value="${laptop.getId()}"></c:out></td>
                                <td><c:out value="${laptop.getName()}"></c:out></td>
                                <td><c:out value="${laptop.getPrice()}"></c:out></td>
                                <td><img src="${laptop.getImgpath()}" width="64"></td>
                                <td><c:out value="${laptop.getDescription()}"></c:out></td>
                                    <td>
                                    <c:choose>
                                        <c:when test="${laptop.getStatus() eq 1}">available</c:when>
                                        <c:otherwise>unavailable</c:otherwise>
                                    </c:choose>
                                </td>
                                <td><c:out value="${laptop.getCatename()}"></c:out></td>
                                    <td>
                                        <a href="manageLaptopsServlet?updateId=${laptop.getId()}" class="btn btn-success">Update</a>
                                    <c:url var="deleteLaptop" value="mainController">
                                        <c:param name="lid" value="${laptop.getId()}"></c:param>
                                        <c:param name="action" value="deleteLaptop"></c:param>
                                    </c:url>
                                    <a href="${deleteLaptop}" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr>
                            <form action="mainController" method="post">
                                <input type="hidden" name="lid" value="${laptop.getId()}" >
                                <td> ${laptop.getId()}</td>
                                <td><input name="name" value="${laptop.getName()}"></td>
                                <td><input name="price" value="${laptop.getPrice()}"></td>
                                <td><input name="imgPath" value="${laptop.getImgpath()}"></td>
                                <td><input name="description" value="${laptop.getDescription()}"></td>
                                <td>
                                    <select name="status">
                                        <option value="1">available</option>
                                        <option value="0">unavailable</option>
                                    </select>
                                </td>
                                <td><select name="cateID">
                                        <c:forEach items="${requestScope.cateList}" var="cate">
                                            <option value="${cate.cateid}">${cate.catename}</option>
                                        </c:forEach>
                                    </select></td>
                                    <td>
                                        <input type="submit" name="action" value="submit updating laptop" class="btn btn-success">
                                        <a href="manageLaptopsServlet" class="btn btn-danger">X</a>
                                    </td>
                            </form>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </table>
            <h1 style="padding-top: 1rem;">Adding new laptop</h1>
            <form action="mainController" method="post">
                <table class="form-table">
                    <tr><td>Name:</td><td><input type="text" name="name" required=""></td></tr>
                    <tr><td>Price:</td><td><input type="text" name="price" required=""></td></tr>
                    <tr><td>Image url:</td><td><input type="file" name="img" required="" accept="image/png, image/gif, image/jpeg"></td></tr>
                    <tr><td>Description:</td><td><input type="text" name="description" required=""></td></tr>
                    <tr><td>Status:</td>
                        <td>
                            <select name="status" required="">
                                <option value="available">Available</option>
                                <option value="not available">Not available</option>
                            </select>

                        </td>
                    </tr>
                    <tr>
                        <td>Category:</td><td>
                            <select name="cateID">
                                <c:forEach items="${requestScope.cateList}" var="cate">
                                    <option value="${cate.cateid}">${cate.catename}</option>
                                </c:forEach>
                            </select>
                        </td></tr>
                    <tr><td colspan="2">
                            <input type="submit" value="create laptop" name="action" class="btn btn-success">
                            <input type="reset" value="clear" class="btn btn-success"/>
                        </td></tr>
                </table>
            </form>
        </section>
    </body>
</html>
