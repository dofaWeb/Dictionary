<%-- 
    Document   : newjsp
    Created on : Aug 15, 2024, 6:08:11 PM
    Author     : NHAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add A Word</h1>
        <%
        if(request.getAttribute("Add Word Error")!=null) {
            String msg = (String) request.getAttribute("Add Word Error");
            %>
            <p style='color:red'><%=msg%></p>
            <%
            }
        %>
        <form action="Word" method="post">
            English:<input type="text" name="Eng"/><br><!-- comment -->
            Vietnamese:<input type="text" name="Vn"/><br><!-- comment -->
            <input type="hidden" required="" name="Word" value="AddWord"/>
            <input type="submit" required="" name="Submit" value="Submit"/>
        </form>
        <a href="/Dictionary"><button>Back to Home</button></a>
    </body>
</html>
