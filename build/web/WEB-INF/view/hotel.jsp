<%-- 
    Document   : khachsan1
    Created on : Mar 4, 2024, 11:48:56 AM
    Author     : ASUS
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
            .description {
                display:flex;
                flex-direction:column;
                margin-left: 0.1%; /* Cách chữ ra khỏi ảnh 10px */
                font-family: Arial, sans-serif; /* Chọn font chữ */
                width: 60%;
                font-size: 180%;
            }

            .description h5:first-child {
                color: #aa8f20;
                font-family: Arial, sans-serif;
                font-size: 200%;
                font-weight: bold;
            }

            .description p{
                text-align: justify;
            }

            .description p:last-child{
                bottom: 0;
                right: 0;
                font-size: 80%;
                margin-right: 1.5%;
                margin-bottom: -0.1%;
                text-align: left;
            }



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
            .cho {
                display: flex;
                justify-content: center;
                border-style: inset; /* Make the border inset */
                border-width: 5px; /* Set border width */
                border-color: #FFCC66; /* Set border color */
                margin: 0 auto;
                width: 100%;
                padding: 0.5%;
                margin-bottom: 1%;
                background-color: #FEECE2;
                border-radius: 18px;
            }

            .cho img{
                border: 1px black solid;
/*                box-shadow: 5px 10px;*/
                width: 80%;
            }

            .cho div {
                width: 100%;
            }
            
            #cho-hinh{
                display: flex;
                justify-content: center;
                align-content: center;
                width: 40%;
                text-align: center;
            }
        </style>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    </head>
    <body>
         <div id="website-width">
            <%@include file="about.jsp" %>
            <div id="about_pettie">
                <h1>Dịch  vụ khách sạn Pettie</h1>
                <p style="font-size: 200%;"> Dịch vụ khách sạn cho thú cưng cung cấp phòng riêng và chăm sóc chuyên nghiệp, bao gồm tắm, cạo lông, và spa. Chúng giúp thú cưng cảm thấy thoải mái khi đi du lịch.</p>
            </div>
            
            <div class="cho">
                <div id="cho-hinh">
                <img src="resource/image/khachsan.png" alt="Ảnh con chó" ">
               </div>
                <div class="description">
                    <h5>Khách sạn kiểu cách</h5>
                    <p>Khách sạn kiểu cách dành cho thú cưng thường có kiến trúc hiện đại và tiện nghi, với phòng riêng cho thú cưng được trang bị đầy đủ tiện ích và dịch vụ chăm sóc chuyên nghiệp như tắm, cạo lông. Không gian chung thường được thiết kế rộng rãi, thoáng đãng và có sàn lát gạch dễ dàng vệ sinh.</p>         
               </div>
            </div>
            
           <div class="cho">
                <div id="cho-hinh">
                <img src="resource/image/bontam.png" alt="Ảnh con chó" ">
               </div>
                <div class="description">
                    <h5>Bồn tắm thoải mái</h5>
                    <p>Bồn tắm trong khách sạn kiểu cách cho thú cưng thường được thiết kế với kích thước phù hợp và chất liệu dễ vệ sinh. Chúng thường được trang bị vòi sen hoặc vòi nước có thể điều chỉnh để tạo ra dòng nước êm dịu và thoải mái cho thú cưng khi tắm.</p>         
               </div>
            </div>
            
            <div class="cho">
                <div id="cho-hinh">
                <img src="resource/image/trochoi.png" alt="Ảnh con chó" ">
               </div>
                <div class="description">
                    <h5>Trò chơi giải trí</h5>
                    <p>Trò chơi giải trí trong khách sạn kiểu cách cho thú cưng thường được thiết kế để kích thích hoạt động vận động và trí tuệ của thú cưng. Đó có thể là các đồ chơi như bóng, đồ chơi nạp bóng, hoặc đồ chơi gắn trên cánh cửa.</p>         
               </div>
            </div>
            
            <div class="cho">
                <div id="cho-hinh">
                <img src="resource/image/giuong.png" alt="Ảnh con chó" ">
               </div>
                <div class="description">
                    <h5>Giường bông êm ái</h5>
                    <p>Giường bông êm ái là một phần quan trọng của dịch vụ khách sạn kiểu cách dành cho thú cưng. Được thiết kế từ các chất liệu mềm mại và thoáng khí, giường bông đảm bảo cung cấp một nơi thoải mái và ấm áp cho thú cưng nghỉ ngơi. Chúng thường có kích thước phù hợp với kích thước của thú cưng và được trang bị lớp đệm êm ái để hỗ trợ giấc ngủ của thú cưng.</p>   
               </div>
            </div>
            
            
            <div id="bookbutton">
                <a href="petchoose" class="btn btn-success" name="Book">Book Now</a>
            </div>
             <div id="foot">
                <%@include file="footer.jsp" %>
            </div>
    </body>
   
</html>