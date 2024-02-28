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

            .servicebooking-form{
                
                width: 40%;
                height: 360px;
                /*background: black;*/
                overflow: hidden;
                border-radius: 10px;
                background-color: white;
                /*box-shadow: 10px 20px 50px #111;*/
                border: 1px solid black;
                
                margin: 15px auto;
            }
            
            @media (max-width: 950px) { /* Điều chỉnh kích thước khi màn hình nhỏ hơn hoặc bằng 768px */
                .servicebooking-form {
                    width: 80%; /* Hoặc bất kỳ giá trị nào phù hợp với trang web của bạn */
                    height: auto; /* Cho phép nội dung mở rộng khi chiều cao không cố định */
                    max-height: 80vh; /* Giới hạn chiều cao tối đa để tránh tràn */
                }
            }

            h1{
                color: black;
                font-size: 3em;
                justify-content: center;
                margin: 40px auto;
                font-weight: bold;
                cursor: pointer;
                transition: .5% ease-in-out; 
                display: flex;

            }

            #cattia{
                margin-top: 10px;
                margin-left: 30% ;
                transform: translateX(-50%);
            }
            #tuvan{
                margin-top: 10px;
                margin-left: 30%;
                transform: translateX(-50%);
            }
            #kham{
                margin-top: 10px;
                margin-left: 30%;
                transform: translateX(-50%);
            }
            #tiem{
                margin-top: 10px;
                margin-left: 30%;
                transform: translateX(-50%);
            }
            #spa{
                
                margin-top: 10px;
                margin-left: 30%;
                transform: translateX(-50%);
            }

            .btn-success{
                margin-top: 20px;
                margin-left: 50%;
                transform: translateX(-50%);
                width: 150px;
                height: 40px;
                align-self: auto;
            }
            
            .option{
                text-align: center;
                
            }
            
            .option-heading{
    text-align: center;
    font-size: 1.2em; /* Increase font size */
    font-weight: bold; /* Make text bold */

            }
        </style>
    </head>
    <body>




        <div id="website-width">
            <%@include file="about.jsp" %>

            <div class="servicebooking-form">
                <h1>Book a service</h1>   

                <form action="servicebooking" method="post"> 
                    <div class="option">
                        Chọn thú cưng: <select name="petName">
                        
                    </select> <br>
                    
                    Ngày check in: <input type="date" name="checkinDate"> <br>
                    </div>
                    <div class="option-heading">Chọn dịch vụ: <br>
                    </div>
                    
                    <input type="checkbox" value="cattia" name="service" id="cattia"> Cắt tỉa lông <br>
                    <input type="checkbox" value="tuvan" name="service" id="tuvan"> Tư vấn y tế <br>
                    <input type="checkbox" value="khamchuabenh" name="service" id="kham"> Khám chữa bệnh <br>
                    <input type="checkbox" value="tiemphong" name="service" id="tiem"> Tiêm phòng <br>
                    <input type="checkbox" value="spa" name="service" id="spa"> Dịch vụ spa <br>
                    
                    <input type="submit" class='btn btn-success' value="Book" name="Book" />
                </form>
            </div>

            <div id='foot'>
                <%@include file="footer.jsp" %>
            </div>
        </div>




    </body>
</html>
