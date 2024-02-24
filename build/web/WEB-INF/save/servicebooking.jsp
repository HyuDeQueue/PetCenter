<%-- 
    Document   : servicebooking
    Created on : Jan 22, 2024, 12:36:36 AM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            <h1>Book a service</h1>
            <form action="servicebooking" method="post">
                Chọn thú cưng: <select name="petName">

                </select> <br>
                Ngày check in: <input type="date" name="checkinDate"> <br>
                Chọn dịch vụ: <br>

                <input type="checkbox" value="cattia" name="service"> Cắt tỉa lông <br>
                <input type="checkbox" value="tuvan" name="service"> Tư vấn y tế <br>
                <input type="checkbox" value="khamchuabenh" name="service"> Khám chữa bệnh <br>
                <input type="checkbox" value="tiemphong" name="service"> Tiêm phòng <br>
                <input type="checkbox" value="spa" name="service"> Dịch vụ spa <br>
                <input type="submit" class='btn btn-success' value="Book" name="Book" />
            </form>
            <div id='foot'>
                <%@include file="footer.jsp" %>
            </div>
        </div>
    </body>
</html>
