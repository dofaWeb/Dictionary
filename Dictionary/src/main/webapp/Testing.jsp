<%-- 
    Document   : Testing
    Created on : Aug 17, 2024, 9:41:51 PM
    Author     : NHAT
--%>

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
        <a href="/Dictionary" >Back</a>
        <h1>Test!</h1>
        <%
        List<Integer> index = new ArrayList<>();
        if(request.getAttribute("testingList")!=null)
            index = (List<Integer>)request.getAttribute("testingList");
        for(int i = 0; i < index.size(); i ++){
            %>
            <%= index.get(i) %> ,
            <%
            }
        %>
        
       
    </body>
</html>
