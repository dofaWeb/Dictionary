<%-- 
    Document   : List
    Created on : Aug 15, 2024, 6:59:48 PM
    Author     : NHAT
--%>

<%@page import="dao.IOStream"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Dictionary"%>
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
            
            <%
                IOStream io = new IOStream();
                int a = io.Trigger();
            ArrayList<Dictionary> dict = new ArrayList<>();
            dict = (ArrayList<Dictionary>)session.getAttribute("dictList");
            for(int i = 1; i <= dict.size(); i ++){
            %>
            <tr>
                <td><%= i %></td>
                <td><%= dict.get(i-1).getEng() %></td>
                <td><%= dict.get(i-1).getVn()%></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
