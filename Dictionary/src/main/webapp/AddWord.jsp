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
        <a href="/Word"><button>Back</button></a><br>
        <h1>Add A Word</h1>
        <form action="Word" method="post">
            English:<input type="text" name="Eng"/><br><!-- comment -->
            Vietnamese:<input type="text" name="Vn"/><br><!-- comment -->
            <input type="hidden" name="Word" value="AddWord"/>
            <input type="submit" name="Submit" value="Submit"/>
        </form>
        <a href="/Dictionary"><button>Back to Home</button></a>
    </body>
</html>
