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
                <h1>Accounts management:</h1>
                <form action="mainController" method="post" class="d-flex align-items-center gap-2 py-3" style="color:green; font-weight: bold;">
                    Name: <input placeholder="John Doe" type="text" name="txtsearch" class="p-1">
                    <input type="submit" value="search account" name="action" class="btn btn-success">
                </form>
                <table class="table table-striped">
                    <tr>
                        <th>ID</th>
                        <th>Email</th>
                        <th>Full name</th>
                        <th>Status</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                <c:forEach var="acc" items="${requestScope.accountList}">
                    <tr>
                        <td><c:out value="${acc.getAccID()}"></c:out></td>
                        <td><c:out value="${acc.getEmail()}"></c:out></td>
                        <td><c:out value="${acc.getFullname()}"></c:out></td>
                            <td>
                            <c:choose >
                                <c:when test="${acc.getStatus() eq 1}">Active</c:when>
                                <c:otherwise>Inactive</c:otherwise>
                            </c:choose>
                        </td>
                        <td><c:out value="${acc.getPhone()}"></c:out></td>
                        <td><c:choose>
                                <c:when test="${acc.getRole() eq 1}">admin</c:when>
                                <c:otherwise>user</c:otherwise>
                            </c:choose>
                        </td>
                        <td><c:if test="${acc.getRole() eq 0}">
                                <c:url var="mylink" value="mainController">
                                    <c:param name="email" value="${acc.getEmail()}"></c:param>
                                    <c:param name="status" value="${acc.getStatus()}"></c:param>
                                    <c:param name="action" value="updateStatusAccount"></c:param>
                                </c:url>
                                <a href="${mylink}">
                                    <c:choose>
                                        <c:when test="${acc.getStatus() eq 1}">Block</c:when>
                                        <c:otherwise>Unblock</c:otherwise>
                                    </c:choose>
                                </a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </section>

    </body>
</html>
