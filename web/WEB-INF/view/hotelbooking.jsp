<%-- 
    Document   : hotelbooking
    Created on : Jan 20, 2024, 9:53:54 PM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #website-width{
                width: 70%;
            }
            #website-width form{
                border: 1px black solid;
            }
            #foot{
                margin-top: 2%;
            }
        </style>
    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <h1>Khách sạn cho thú cưng</h1>
            <p>Book lồng</p>
            <form action="hotel" method="post">
                Chọn thú cưng: <select name="petName">

                </select> <br>
                Ngày check in: <input type="date" name="checkinDate"> <br>
                Ngày check out: <input type="date" name="checkoutDate"> <br>
                <%
                    String cage = (String) request.getAttribute("cageType");
                %>
                <p>Loại lồng: <%=cage%></p> <br>
                <input type="submit" class="btn btn-success" value="Book" name="Book" />
            </form>
                <div id='foot'>
                    <%@include file="footer.jsp" %>
                </div>
        </div>
    </body>
</html>
