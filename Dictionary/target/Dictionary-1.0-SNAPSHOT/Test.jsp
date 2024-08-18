<%-- 
    Document   : Test
    Created on : Aug 17, 2024, 8:27:35 PM
    Author     : NHAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function toggleRangeInputs() {
                var specificRange = document.getElementById("specificRange");
                var rangeInputs = document.getElementById("rangeInputs");
                if (specificRange.checked) {
                    rangeInputs.style.display = "block";
                } else {
                    rangeInputs.style.display = "none";
                }
            }

        </script>
    </head>
    <body>
        <h1>TEST</h1>
        <h2 style="color:red">${requestScope.error}</h2>
        <form action="Test" method="post">
            <input type="radio" value="Random" name="typeTest"/>Random<br><!-- comment -->
            <input type="radio" value="Linear" name="typeTest"/>Linear<br><!-- comment -->
            Question Range:<br><!-- comment -->
            <input type="radio" value="All" name="typeRange" onclick="toggleRangeInputs()"/>All<br><!-- comment -->
            <input type="radio" value="Specific" name="typeRange" id="specificRange" onclick="toggleRangeInputs()"/>Specific<br><!-- comment -->

            <!-- Range inputs, hidden by default -->
            <div id="rangeInputs" style="display:none;">
                <%
                    int n = (int) request.getAttribute("size");  // Assuming "size" is passed as a request attribute
                    int defaultRange = 30;  // The range to display
                    int fromFirst = 1;  // Default start value for the first option
                    int toFirst = defaultRange;  // Default end value for the first option

                    int fromLast = n - defaultRange + 1;  // Calculate start for the last option
                    int toLast = n;  // End value for the last option

                    if (fromLast < 1) {  // Adjust if fromLast is less than 1
                        fromLast = 1;
                    }
                    if (toFirst > n) {  // Adjust if the range is greater than the available size
                        toFirst = n;
                    }
                %>
                <input type="radio" name="rangeOption" value="1">1. From 
                <input type="number" name="from1" value="<%=fromFirst%>" min="1" max="<%=n%>" width="20px"/> 
                To 
                <input type="number" name="to1" value="<%=toFirst%>" min="1" max="<%=n%>" width="20px"/> <br><!-- comment -->

                <input type="radio" name="rangeOption" value="2">2. From 
                <input type="number" name="from2" value="<%=fromLast%>" min="1" max="<%=n%>" width="20px"/>
                To 
                <input type="number" name="to2" value="<%=toLast%>" min="1" max="<%=n%>" width="20px"/> <br><!-- comment -->
            </div>
            <input type="hidden" value="<%=n%>" name="size"/>
            <input type="submit" value="Submit" name="submit"/>
        </form>
    </body>
</html>
