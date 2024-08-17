<%-- 
    Document   : Edit
    Created on : Aug 17, 2024, 5:38:15 PM
    Author     : AnhNLCE181837
--%>

<%@page import="dao.DictionaryDAO"%>
<%@page import="model.Dictionary"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edit!</h1>
        <form action='Word' method='post'>
            <%
                String Id = "";
                Dictionary dict = new Dictionary();
                if (request.getAttribute("EditWord") != null) {
                    Id = (String) request.getAttribute("EditWord");

                    DictionaryDAO dictDAO = new DictionaryDAO();
                    dict = dictDAO.getDictionaryByID(Id);
                }
            %>
            Eng: <input type='txt' value='<%= dict.getEng() %>' name='engTxt'/> <br/>
            Vn: <input type='txt' value='<%= dict.getVn() %>' name='vnTxt'/> <br/>
            <input type='hidden' value="<%= dict.getId() %>" name='idTxt'/>
            <input type='submit' name='editBtn' value='Edit'/>
        </form>
        <a href="/List">Back</a>
    </body>
</html>
