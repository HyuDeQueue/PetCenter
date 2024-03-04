<%-- 
    Document   : Cattialong
    Created on : Feb 25, 2024, 5:08:17 PM
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
                font-size: 200%;
                margin-right: 1.5%;
                margin-bottom: -0.1%;
                color: #dc304e;
                text-align: right;
                font-weight: bold;
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
    </head>
    <body>
         <div id="website-width">
            <%@include file="about.jsp" %>
            <div id="about_pettie">
                <h1>Dịch  vụ cắt tỉa thú cưng Pettie</h1>
                <p style="font-size: 200%;">Pettie cung cấp dịch vụ cắt tỉa lông chuyên nghiệp, đảm bảo sự thoải mái và đáng yêu cho thú cưng của bạn. Đội ngũ giàu kinh nghiệm và tận tâm của chúng tôi cam kết mang đến kết quả tốt nhất, sử dụng sản phẩm chăm sóc da lông cao cấp. Hãy đến với Pettie để thú cưng của bạn luôn trông thật xinh đẹp và khỏe mạnh.</p>
                <p></p>
            </div>
            
            <div class="cho">
                <div id="cho-hinh">
                <img src="resource/image/choduoi5kg.jpg" alt="Ảnh con chó" ">
               </div>
                <div class="description">
                    <h5>Nâng cao sự thoải mái:</h5>
                    <p>Cắt tỉa nhẹ nhàng, giữ lông gọn gàng và thoải mái, phản ánh phong cách thân thiện và dễ thương của chúng.</p>         
                    <p></p>
               </div>
            </div>
            
           <div class="cho">
                <div id="cho-hinh">
                <img src="resource/image/duoi10kg.jpg" alt="Ảnh con chó" ">
               </div>
                <div class="description">
                    <h5>Tạo hình dáng:</h5>
                    <p>Cắt tỉa lông giúp tạo ra hình dáng và kiểu dáng cho lông thú cưng, làm cho chúng trở nên gọn gàng và hài hòa với ngoại hình tổng thể của chúng.</p>  
                    <p></p>
               </div>
            </div>
            
            <div class="cho">
                <div id="cho-hinh">
                <img src="resource/image/duoi15kg.jpg" alt="Ảnh con chó" ">
               </div>
                <div class="description">
                    <h5>Phòng tránh bệnh truyền nhiễm:</h5>
                    <p>Bằng cách giảm bớt lượng lông, vi khuẩn và các vi sinh vật có thể tồn tại trong lớp lông cũng sẽ giảm đi, giúp giảm nguy cơ mắc các bệnh truyền nhiễm cho thú cưng.</p>
                    <p></p>
               </div>
            </div>
            
            <div class="cho">
                <div id="cho-hinh">
                <img src="resource/image/duoi20kg.jpg" alt="Ảnh con chó" ">
               </div>
                <div class="description">
                    <h5>Dễ dàng vệ sinh:</h5>
                    <p>Lông cắt tỉa giúp cho việc vệ sinh trở nên dễ dàng hơn, không gây cản trở cho việc tắm và chải lông, giúp cho việc duy trì vệ sinh cho thú cưng dễ dàng hơn..</p>   
                    <p></p>
               </div>
            </div>
            
            <div class="cho">
                <div id="cho-hinh">
                <img src="resource/image/sieubeophi.png" alt="Ảnh con chó" ">
               </div>
                <div class="description">
                    <h5>Tăng cường sự tự tin:</h5>
                    <p>Khi thú cưng được cắt tỉa một cách gọn gàng và sạch sẽ, họ thường cảm thấy thoải mái hơn và tự tin hơn trong giao tiếp với con người và các thú cưng khác.</p> 
                    <p></p>
               </div>
            </div>
            
            <div id="bookbutton">
                <a href="petchoose" class="btn btn-success">Book Now</a>
            </div>
             <div id="foot">
                <%@include file="footer.jsp" %>
            </div>
    </body>
   
</html>
