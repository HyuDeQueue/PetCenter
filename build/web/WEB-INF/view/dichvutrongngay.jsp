<%-- 
    Document   : dichvutrongngay
    Created on : Feb 29, 2024, 5:25:34 PM
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
            .bocuc{
                display: flex;
                flex-direction: row;
                justify-content: space-around;
                padding-bottom: 1%;
            }
            .anhnut {
                width: 50%; /* Add some space between buttons */
            }
            
            .anhnut img{
                border: none; /* Remove any border from the image */
                cursor: pointer;
                width: 100%; /* Make the image fill the button's width */
                max-width: 100%;
                border-radius: 10px;
                padding: 1%;
            }
            .anhnut button{
                width: 100%; /* Make the button fill its container's width */
                border: none; /* Remove button border */
                background: none; /* Remove button background */
                padding: 0; /* Remove any default padding */
                margin: 0; /* Remove any default margin */
                cursor: pointer;
                transition: box-shadow 0.3s ease;
            }
            
            .anhnut button:hover {
                transform: translateY(-2px); /* Move the button slightly upwards */
                box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2); /* Change shadow on hover */
            }
            
            .decorative-button {
                display: inline-block;
                padding: 10px 20px; /* Adjust padding as needed */
                font-size: 150%; /* Adjust font size as needed */
                font-weight: bold; /* Adjust font weight as needed */
                text-decoration: none; /* Remove default underline */
                color: #fff; /* Text color */
                background: linear-gradient(to right, #4CAF50, #2980B9); /* Gradient background */
                border: none; /* Remove border */
                border-radius: 25px; /* Rounded corners */
                cursor: pointer;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Shadow effect */
                transition: transform 0.2s ease, box-shadow 0.2s ease; /* Add transition effects */
            }

            /* Hover effect */
            .decorative-button:hover {
                transform: translateY(-2px); /* Move the button slightly upwards */
                box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2); /* Change shadow on hover */
                border-radius: 10px;
            }

            /* Active effect */
            .decorative-button:active {
                transform: translateY(0); /* Reset position on click */
                box-shadow: none; /* Remove shadow on click */
            }
            
            @keyframes wave {
                0% {
                    transform: translateY(0);
                }
                25% {
                    transform: translateY(-5px) rotate(-2deg);
                }
                50% {
                    transform: translateY(0);
                }
                75% {
                    transform: translateY(5px) rotate(2deg);
                }
                100% {
                    transform: translateY(0);
                }
            }

            .khucgolaclu{
                width: 85%;
                border-radius: 10px;
            }
            
            
            .khucgolaclu img {
                width: 100%;
                animation: wave 5s infinite; /* Apply the 'wave' animation */
                border-radius: 10px;
                
            }
            
            



            
        </style>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <div id="about_pettie">
                <h1>Dịch vụ trong ngày</h1>
                <p>Trong xã hội hiện đại, thú cưng không chỉ là động vật nuôi mà còn là thành viên thân thiết của gia đình. Với tình yêu và sự quan tâm không ngừng, dịch vụ chăm sóc thú cưng ngày càng trở nên quan trọng hơn bao giờ hết. Pettie là nơi đáng tin cậy cho các dịch vụ chăm sóc thú cưng, mang đến một loạt các dịch vụ đa dạng và chuyên nghiệp. Tại Pettie, chúng tôi cam kết mang lại sự thoải mái và hạnh phúc cho bạn và người bạn lông xù của bạn. Những dịch vụ mà chúng tôi cung cấp không chỉ giúp cải thiện sức khỏe và hạnh phúc của thú cưng mà còn mang lại sự an tâm cho chủ nhân. Hãy cùng Pettie khám phá những dịch vụ đặc biệt mà chúng tôi mang lại để tạo nên một cuộc sống hạnh phúc và trọn vẹn cho bạn và người bạn lông xù của mình.</p>
            </div>

            <div class="bocuc">
                <div class="anhnut">
                    <form action="spa.jsp">
                        <button type="submit">
                            <img src="resource/image/chomeospa.png" alt="Chuyển tới trang Spa">
                            <p>Spa</p>
                        </button>
                    </form>
                </div>

                <div class="anhnut">
                    <form action="cattialong.jsp">
                        <button type="submit">
                            <img src="resource/image/cattialongchomeo.png" alt="Chuyển tới trang Grooming">
                            <p>Cắt tỉa</p>
                        </button>
                    </form>
                </div>

                <div class="anhnut">
                    <form action="medicalconsultation">
                        <button type="submit">
                            <img src="resource/image/tuvanchomeo.png" alt="Chuyển tới trang Vet">
                            <p>Tư vấn</p>
                        </button>
                    </form>
                </div>

                <div class="anhnut">
                    <form action="treatment">
                        <button type="submit">
                            <img src="resource/image/tiemphongchomeo.png" alt="Chuyển tới trang Training">
                            <p>Khám bệnh, tiêm phòng</p>
                        </button>
                    </form>
                </div>
            </div>

            <div class="bocuc">
                <div class="khucgolaclu">
                    <img src="resource/image/khucgoriel.png" alt="wood">
                </div>
            </div>
            
            <div class="bocuc">
                <a class="decorative-button" href="petchoose">BOOK NGAY THÔI !</a>
            </div>
            
            <div id="foot">
                <%@include file="footer.jsp" %>
            </div>
        </div>
    </body>
</html>
