<%-- 
    Document   : hotel
    Created on : Jan 21, 2024, 3:13:33 PM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/bootstrap.css" rel="stylesheet">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <style>
            body{
                display: flex;
                justify-content: center;
                
            }
            #website-width{
                width: 70%;
                background-color: #fff3de;
                text-align: center;
            }   
            #website-width .mid{
                margin: 0 auto;
                padding-left: 0;
                padding-right: 0;
            }
            #website-width h2{
                font-size: 130%;
            }
            .cage{
                border: 1px black solid;
                display: flex;
                justify-content: center;
                align-content: center;
                flex-direction: column;
                text-align: center;
            }
            .cage img{
                width: 100%;
            }
            .cage input{
                margin-bottom: 5%;
                font-weight: bold;
                padding: 2% 8%;
            }
            .cage h4{
                font-weight: bold;
                margin-top: 1%;
                margin-bottom: 0;
            }
            .cage p{
                font-weight: bold;
                margin: 1%;
                font-size: 110%;
            }
            #bookbutton{
                margin: 1%;
                
            }
            #bookbutton input{
                padding: 1% 8%;
                font-size: 200%;
                font-weight: bold   ;
                border-radius: 18px;
            }
            
        </style>
    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <h1>Bảng giá phòng khách sạn thú cưng</h1>
            <h2>Kích thước của chuồng, phòng chỉ có thể ước lượng và tham khảo. Bảng giá trông giữ thực tế có thể thay đổi tùy theo kích cỡ, trọng lượng và nhu cầu sử dụng thực tế của khách hàng và thú cưng</h2>
            <div class="mid row col-12">
                <div class="cage col-12 col-md-4" style="padding: 0 0;">
                    <img src="resource/image/c1.jpg">
                    <h4>Chuồng M</h4>
                    <p>Dành cho thú cưng tối đa 10kg</p>
                </div>
                <div class="cage col-12 col-md-4" style="padding: 0 0;">
                    <img src="resource/image/c2.png">
                    <h4>Chuồng L</h4>
                    <p>Dành cho thú cưng tối đa 20kg</p>
                </div>
                <div class="cage col-12 col-md-4" style="padding: 0 0;">
                    <img src="resource/image/c3.jpg">
                    <h4>Chuồng XL</h4>
                    <p>Dành cho thú cưng tối đa 30kg</p>
                </div>
            </div>
            <div class="mid row col-12">
                <div class="cage col-12 col-md-4" style="padding: 0 0;">
                    <img src="resource/image/r1.jpg">
                    <h4>Phòng Vip A</h4>
                    <p>Dành cho thú cưng tối đa 10kg</p>
                </div>
                <div class="cage col-12 col-md-4" style="padding: 0 0;">
                    <img src="resource/image/r2.jpg">
                    <h4>Phòng Vip B</h4>
                    <p>Dành cho thú cưng tối đa 20kg</p>
                </div>
                <div class="cage col-12 col-md-4" style="padding: 0 0;">
                    <img src="resource/image/r3.jpg">
                    <h4>Phòng Vip C</h4>
                    <p>Dành cho thú cưng tối đa 30kg</p>
                </div>
            </div>
            <div id="bookbutton">
                <form action="petchoose" method="post">
                    <input type="hidden" value="hotelBooking" name="booktype">
                    <input type="submit" class="btn btn-info" value="Book Now" />
                </form>
            </div>
            <div id='foot'><%@include file="footer.jsp" %></div>
        </div>
    </body>
</html>
