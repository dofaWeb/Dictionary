<%-- 
    Document   : Testing
    Created on : Aug 17, 2024, 9:41:51 PM
    Author     : NHAT
--%>

<%@page import="model.Dictionary"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="/Test">Back</a>
        <h1>Test!</h1>
        <%
            List<Integer> index = new ArrayList<>();
            ArrayList<Dictionary> dictList = (ArrayList<Dictionary>) session.getAttribute("dictList");
            if (session.getAttribute("index") != null) {
                index = (List<Integer>) session.getAttribute("index");
            }
            int i = (int) request.getAttribute("i");
            Dictionary dict = dictList.get(index.get(i));
        %>
        <form action="Test" method="post">
            English: <input type="text" value="<%= dict.getEng()%>" name="Eng" readonly/><br>
            Vietnamese: <input type="text" name="Vn"/><br><!-- comment -->
            <input type="hidden" value="<%=i%>" name="i"/><!-- comment -->
            <input type="hidden" value="<%=dict.getVn()%>" name="VnAnswer"/>
            <h3>${requestScope.error}</h3>
            <input type="hidden" value="Testing" name="key"/>
            <input type="submit" value="Submit" name="Check"/>
        </form>


    </body>
</html>
