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
                    Name: <input placeholder="Tester" type="text" name="txtsearch" class="p-1">
                    <input type="submit" value="search account" name="action" class="btn btn-success">
                </form>
                <table class="table table-striped">
                    <tr>
                        <th>ID</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Full name</th>
                        <th>Status</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                <c:forEach var="acc" items="${requestScope.accountList}">
                    <c:choose>
                        <c:when test="${param.updateId != acc.getAccID()}">
                            <tr>
                                <td><c:out value="${acc.getAccID()}"></c:out></td>
                                <td><c:out value="${acc.getEmail()}"></c:out></td>
                                <td><c:out value="${acc.getPassword()}"></c:out></td>
                                <td><c:out value="${acc.getFullname()}"></c:out></td>
                                    <td>
                                    <c:choose >
                                        <c:when test="${acc.getStatus() eq 1}">active</c:when>
                                        <c:otherwise>inactive</c:otherwise>
                                    </c:choose>
                                </td>
                                <td><c:out value="${acc.getPhone()}"></c:out></td>
                                <td><c:choose>
                                        <c:when test="${acc.getRole() eq 1}">admin</c:when>
                                        <c:otherwise>user</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:if test="${acc.getEmail() != sessionScope.email}">
                                        <a href="manageAccountsServlet?updateId=${acc.getAccID()}" class="btn btn-success">Update</a>
                                        <c:url var="deleteAccount" value="mainController">
                                            <c:param name="email" value="${acc.getEmail()}"></c:param>
                                            <c:param name="action" value="deleteAccount"></c:param>
                                        </c:url>
                                        <a href="${deleteAccount}" class="btn btn-danger">Delete</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr>
                            <form action="mainController" method="post">
                                <input type="hidden" name="accID" value="${acc.getAccID()}" >
                                <td>${acc.getAccID()}</td>
                                <td><input name="email" value="${acc.getEmail()}"></td>
                                <td><input name="password" value="${acc.getPassword()}"></td>
                                <td><input name="fullname" value="${acc.getFullname()}"></td>
                                <td>
                                    <select name="status">
                                        <option value="1">active</option>
                                        <option value="0">inactive</option>                                        
                                    </select>
                                </td>
                                <td><input name="phone" value="${acc.getPhone()}"></td>
                                <td>
                                    <select name="role">
                                        <option value="0">user</option>
                                        <option value="1">admin</option>
                                    </select>
                                </td>
                                <td><input type="submit" name="action" value="submit updating account" class="btn btn-success">
                                    <a href="manageAccountsServlet" class="btn btn-danger">X</a>
                                </td>
                            </form>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </table>
            <hr>
            <h1 style="padding-top: 5rem;">Adding new account: </h1>

            <form action="mainController" method="post" class="form">
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
                            <input type="submit" value="create account" name="action" class="btn btn-success">
                            <input type="reset" value="clear" class="btn btn-success"/>
                        </td></tr>
                </table>
            </form>
            <p style = "color:red; font-weight: 600;" ><%= (request.getAttribute("warning") == null) ? "" : request.getAttribute("warning")%> </p>
        </section>
    </body>
</html>
