<%-- 
    Document   : trainbooking
    Created on : Jan 25, 2024, 4:33:01 PM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            #website-width{
                width: 70%;
            }
            #foot{
                margin-top: 2%;
            }
        </style>
    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <h1>Book dịch vụ huấn luyện:</h1>
            <form action="trainBooking" method="post">
                Chọn thú cưng: <select name="petName">

                </select> <br>
                Ngày check in: <input type="date" name="checkinDate"> <br>
                Ngày xuất trại: null <br>
                <%
                    String plan = (String) request.getAttribute("plan");
                %>
                <p>Gói huấn luyện: <%=plan%></p> <br>
                <input type="submit" class="btn btn-success" value="Book" name="Book" />
            </form>
            
            
            <div id="foot">
                <%@include file="footer.jsp" %>
            </div>
        </div>
    </body>
</html>
