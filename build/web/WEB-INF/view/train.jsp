<%-- 
    Document   : train
    Created on : Jan 25, 2024, 1:56:29 AM
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
            #content{
                margin-top: 2%;
                margin-left: 0;
                margin-right: 0;
            }
            #content div{
                padding: 2%;
                border: 2px black solid;
                display: flex;
                justify-content: center;
                align-content: center;
                flex-direction: column;
                text-align: center;
            }
            #content div img{
                width: 100%;
                border-radius: 20px;
            }
            #content div h4{
                text-align: center;
            }
            #content div p{
                text-align: justify;
                padding-left: 2%;
                padding-right: 2%;
            }
            #content div form input{
                width: 100%;
                font-weight: bold;
            }
            #hero h1{
                text-align: center;
            }
            #hero h2{
                font-size: 130%;    
            }
        </style>
    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <div id="hero">
                <h1>Dịch vụ huấn luyện thú cưng</h1>
                <h2>Pettie là một dịch vụ chuyên nghiệp về huấn luyện thú cưng, mang đến cho bạn và người bạn lông xù của mình những trải nghiệm học tập tích cực và giao tiếp tốt. Chúng tôi tự hào với đội ngũ huấn luyện viên chất lượng cao, đam mê và có kinh nghiệm, luôn sẵn sàng hỗ trợ để giúp thú cưng của bạn trở thành thành viên nhà bạn hoàn hảo.</h2>
            </div>
            <div id="content" class="row">
                <div id="goiA" class="col-12 col-md-6">
                    <img src="resource/image/DogA.jpg">
                    <h4>Gói A</h4>
                    <p>Thú cưng của bạn sẽ phát triển khả năng tương tác cơ bản với con người, bao gồm việc lắng nghe lệnh như bắt tay, đứng ngồi, và nhảy. Chúng cũng sẽ hiểu cách duy trì vệ sinh bằng cách đi đúng chỗ, và hành xử một cách lịch sự khi ở trong môi trường công cộng.</p>
                    <p>Thời gian dự kiến: 3 tháng</p>
                    <form action="train" method="post">
                        <input type="hidden" value="PlanA" name="plan">
                        <input type="submit" value="Book" class="btn btn-success" name="Book">
                    </form>
                </div>
                <div id="goiB" class="col-12 col-md-6">
                    <img src="resource/image/dogB.jpg">
                    <h4>Gói B (Riêng của chó)</h4>
                    <p>Thú cưng của bạn sẽ dễ dàng thể hiện khả năng tương tác cao với chủ nhân, tham gia vào nhiều trò chơi hứng thú như bắt dĩa, tìm đồ, và rượt đuổi. Chúng cũng có khả năng canh nhà, giữ an ninh, trông nom trẻ em, và thậm chí hỗ trợ người mù và những công việc khác.</p>
                    <p>Thời gian dự kiến: 6 tháng</p>
                    <!--<p style="color: red; font-weight: bold">*Lưu ý: Gói B chỉ dành cho chó</p>-->
                    <form action="train" method="post">
                        <input type="hidden" value="PlanB" name="plan">
                        <input type="submit" value="Book" class="btn btn-success" name="Book">
                    </form>
                </div>
            </div>
            <div id="foot">
                <%@include file="footer.jsp" %>
            </div>
        </div>
    </body>
</html>
