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
                <h1>Plants management:</h1>
                <form action="mainController" method="post">
                    <table class="table table-striped">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Image</th>
                            <th>Description</th>
                            <th>Status</th>
                            <th>Category</th>
                            <th>Action</th>
                        </tr>
                    <c:forEach var="p" items="${requestScope.plantList}">
                        <c:choose>
                            <c:when test="${requestScope.updateid == p.getId()}">
                                <tr>
                                    <td><c:out value="${p.getId()}"></c:out></td>
                                    <td><input type="text" name="name" value="${p.getName()}" required></td>
                                    <td><input type="number" name="price" min="0" value="${p.getPrice()}" style="width: 6rem;" required></td>
                                    <td><img class="cart-img" src="<c:out value="${p.getImgpath()}"></c:out>" alt="alt"/></td>
                                    <td><input type="text" name="description" value="${p.getDescription()}" required></td>
                                    <td><select name="status" required="">
                                            <option value="available">Available</option>
                                            <option value="not available">Not available</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="cateID">
                                            <c:forEach items="${requestScope.cateList}" var="cate">
                                                <option value="${cate.cateid}">${cate.catename}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                <input type="hidden" name="updateid" value="${p.getId()}" >
                                <td><input type="submit" class="btn btn-success" name="action" value="save"></td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td><c:out value="${p.getId()}"></c:out></td>
                                    <td><c:out value="${p.getName()}"></c:out></td>
                                    <td><c:out value="${p.getPrice()}"></c:out></td>
                                    <td><img class="cart-img" src="<c:out value="${p.getImgpath()}"></c:out>" alt="alt"/></td>
                                    <td><c:out value="${p.getDescription()}"></c:out></td>
                                    <td><c:choose>
                                            <c:when test="${p.getStatus() eq 1}">Available</c:when>
                                            <c:otherwise>Not available</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td><c:out value="${p.getCatename()}"></c:out></td>
                                    <td><a class="btn btn-success" href="mainController?action=updatePlantWithAdmin&updateid=${p.getId()}">update</a></td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </table>
            </form>
            <hr>
            <form action="mainController" method="post">
                <h2 style="color:darkgreen;">Create new plant</h2>
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
                        <td>Category ID:</td><td>
                            <select name="cateID">
                                <c:forEach items="${requestScope.cateList}" var="cate">
                                    <option value="${cate.cateid}">${cate.catename}</option>
                                </c:forEach>
                            </select>
                        </td></tr>
                    <tr><td colspan="2"><input type="submit" value="create plant" name="action" class="btn btn-success"></td></tr>
                </table>
            </form>
    </body>
</html>
