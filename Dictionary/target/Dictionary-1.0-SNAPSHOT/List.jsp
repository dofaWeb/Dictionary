<%-- 
    Document   : List
    Created on : Aug 15, 2024, 6:59:48 PM
    Author     : NHAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>List!</h1>
        <table>
            <tr>
                <th>No.</th>
                <th>Eng</th>
                <th>Vn</th>
            </tr>
            <c:set var="i" value="1"/>
            <c:forEach var="dict" items="${requestScope.dictList}">
                <tr>
                    <td>${i}</td>
                    <td>${dict.Eng}</td>
                    <td>${dict.Vn}</td>
                    <c:set var="i" value="${i+1}"/>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
