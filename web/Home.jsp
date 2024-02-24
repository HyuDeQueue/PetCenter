<%-- 
    Document   : Home
    Created on : Jan 24, 2024, 1:56:59 AM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            #services{
                display: flex;
                justify-content: space-around;
            }
            #services div img{
                width: 100%;
                border: 3px #FA68E4 solid;
                border-radius: 200px;
            }
            #services div{
                text-align: center;
            }
            #foot{
                width: 100%;
                margin-top: 3%;
            }
        </style>
    </head>
    <body>
        <div id="website-width">
            <%@include file="WEB-INF/view/about.jsp" %>
            <div id="about_pettie">
                <h1>Dịch vụ chăm sóc thú cưng Pettie</h1>
                <p>Chào mừng bạn đến với Pettie Pet Center - nơi tốt nhất để chăm sóc và yêu thương người bạn bốn chân của bạn! Pettie không chỉ là một khách sạn thú cưng, mà là một trung tâm đa dịch vụ đầy đủ, mang đến cho thú cưng của bạn sự quan tâm toàn diện và chăm sóc hàng ngày. Tại Pettie, chúng tôi cung cấp một loạt các dịch vụ chất lượng, từ chăm sóc y tế đến dịch vụ làm đẹp, đảm bảo thú cưng của bạn luôn ở trạng thái tốt nhất. Đội ngũ bác sĩ thú y chuyên nghiệp và giàu kinh nghiệm của chúng tôi sẽ đảm bảo rằng mọi vấn đề về sức khỏe của thú cưng đều được giải quyết một cách tận tâm và chuyên nghiệp.</p>
            </div>
            <div id="services" class="row">
                <div class="col-12 col-md-2">
                    <img src="resource/image/petclinic.jpg">
                    <p>Khám chữa bệnh</p>
                    <a href="petchoose" class="btn btn-success">Tìm hiểu ngay</a>
                </div>
                <div class="col-12 col-md-2">
                    <img src="resource/image/pettrain.jpg">
                    <p>Huấn luyện thú cưng</p>
                    <a href="train" class="btn btn-success">Tìm hiểu ngay</a>
                </div>
                <div class="col-12 col-md-2">
                    <img src="resource/image/heo.jpg">
                    <p>Khách sạn chó mèo</p>
                    <a href="hotel" class="btn btn-success">Tìm hiểu ngay</a>
                </div>
                <div class="col-12 col-md-2">
                    <img src="resource/image/petspa.jpg">
                    <p>Dịch vụ SPA</p>
                    <a href="petchoose" class="btn btn-success">Tìm hiểu ngay</a>
                </div>
                <div class="col-12 col-md-2">
                    <img src="resource/image/petgrooming.jpg">
                    <p>Cắt tỉa lông</p>
                    <a href="petchoose" class="btn btn-success">Tìm hiểu ngay</a>
                </div>
                <div class="col-12 col-md-2">
                    <img src="resource/image/petdoctor.jpg">
                    <p>Tư vấn y tế miễn phí</p>
                    <a href="petchoose" class="btn btn-success">Tìm hiểu ngay</a>
                </div>
            </div>
            <div id="foot">
                <%@include file="WEB-INF/view/footer.jsp" %>
            </div>
        </div>
    </body>
</html>
