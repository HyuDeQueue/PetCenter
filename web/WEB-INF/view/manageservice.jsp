<%-- 
    Document   : manageservice
    Created on : Feb 25, 2024, 5:57:16 PM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                margin-top: 2%;
            }
        </style>
    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <div id="about_pettie">
                <h1>Dịch vụ chăm sóc thú cưng Pettie</h1>
                <p>Chào mừng bạn đến với Pettie Pet Center - nơi tốt nhất để chăm sóc và yêu thương người bạn bốn chân của bạn! Pettie không chỉ là một khách sạn thú cưng, mà là một trung tâm đa dịch vụ đầy đủ, mang đến cho thú cưng của bạn sự quan tâm toàn diện và chăm sóc hàng ngày. Tại Pettie, chúng tôi cung cấp một loạt các dịch vụ chất lượng, từ chăm sóc y tế đến dịch vụ làm đẹp, đảm bảo thú cưng của bạn luôn ở trạng thái tốt nhất. Đội ngũ bác sĩ thú y chuyên nghiệp và giàu kinh nghiệm của chúng tôi sẽ đảm bảo rằng mọi vấn đề về sức khỏe của thú cưng đều được giải quyết một cách tận tâm và chuyên nghiệp.</p>
            </div>
            
            <div id="foot">
                <%@include file="footer.jsp" %>
            </div>
        </div>
    </body>
</html>
