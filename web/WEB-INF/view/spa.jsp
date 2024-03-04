<%-- 
    Document   : spa
    Created on : Feb 27, 2024, 7:01:06 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>
            body{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-content: center;
                align-items: center;
            }
            #website-width{
                width: 70%;
                background-color: #fff0de;
            }
            #about_pettie p{
                background-color: white;
                text-align: justify;
            }
            #foot{
                width: 100%;
                margin-top: 3%;
            }
            #bookbutton{
                margin-top: 1%;
                text-align: center;
            }
            #bookbutton input{
                padding: 1% 8%;
                font-size: 200%;
                font-weight: bold   ;
                border-radius: 18px;
            }
            .anhspa img{
                width: 100%;
            }
            
        </style>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <div id="about_pettie">
                <h1>Dịch vụ spa</h1>
                <p>Chào mừng đến với Pettie! Chúng tôi cung cấp dịch vụ tư vấn y tế miễn phí cho thú cưng của bạn. Đội ngũ chuyên gia của chúng tôi sẽ hỗ trợ bạn với mọi vấn đề liên quan đến sức khỏe và chăm sóc thú cưng của bạn. Hãy đến với Pettie để nhận được sự tư vấn chuyên nghiệp và tận tình nhất cho người bạn đáng yêu của bạn!</p>
            </div>
            
            <div class="anhspa">
                <img src="resource/image/spaandshit1.png" alt="alt"/>
                <img src="resource/image/spaandshit2.png" alt="alt"/>
            </div>
            
             <div id="bookbutton">
                <form action="petchoose" method="post">
                    <input type="hidden" value="smallBooking" name="booktype">
                    <input type="submit" value="Book Now" class="btn btn-success" name="Book">
                </form>
            </div>
            
           
            
            <div id="foot">
                <%@include file="footer.jsp" %>
            </div>
        </div>
    </body>
</html>
