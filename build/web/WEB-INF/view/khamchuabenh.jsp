

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
           .description {
                display:flex;
                text-align: center; /* Canh giữa nội dung trong .description */
                background-color: #d5a750ab;
                border: 2px solid #000; /* Đường viền đen với độ dày là 2px */
                padding: 10px; /* Khoảng cách giữa nội dung và border */
                border-radius: 10px; /* Bo tròn các góc của border */
                justify-content: center;
                align-content: center;
            }
            
            .description h5 {
                font-size: 200%; /* Kích thước chữ tăng lên */
                font-weight: bold; /* Đậm chữ */
                margin-right: 2%;
            }
            .description div{
                display: flex;
                flex-direction: column;
                width: 95%;
                padding-left: 10%;
            }
            .description img{
                width: 10%;
                text-align: right;
            }
            .container {
                width: 100%;
                overflow-x: auto;
                white-space: nowrap;
                border: dotted pink;
            }
            .pet {
                display: inline-block;
                width: 50%;
                margin: 1%;
                text-align: center;
                
            }
            .pet img {
                width: 40%;
                height: auto;
                border: 10px solid pink; /* Độ dày và màu sắc của border */
                border-radius: 10px; /* Bo tròn các góc của border */
                
            }
            .container p{
                font-family: 'Comic Sans MS', cursive, sans-serif; /* Chọn một font chữ dễ thương */
                color: #b08615; 
                font-size: 120%; 
                text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
            }
            
                        /* width */
            .container::-webkit-scrollbar {
                width: 12px;
                height: 50px;
            }

            /* Track */
            .container::-webkit-scrollbar-track {
                box-shadow: inset 0 0 10px greenyellow; 
                border-radius: 5px;
                border-color: pink;
            }

            /* Handle */
            .container::-webkit-scrollbar-thumb {
                background: url('resource/image/chodungco.png'); 
                background-size: contain;
                border-radius: 5px;
                border: solid;
                border-color: #40dc38;

            }

            .container::-webkit-scrollbar-thumb:hover {
                background: url('resource/image/chochayco.png'); 
                background-size: contain;
                border-radius: 5px;
            }
        </style>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <div id="about_pettie">
                <h1>Dịch vụ khám chữa bệnh và tiêm phòng</h1>
                <p>Chăm sóc sức khỏe cho thú cưng tại Pettie! Dịch vụ khám chữa bệnh và tiêm phòng chuyên nghiệp, an toàn. Đội ngũ bác sĩ thú y tận tình, kỹ thuật tiên tiến. Hãy đồng hành cùng Pettie để đảm bảo sức khỏe tốt nhất cho người bạn đồng hành của bạn!</p>
            </div>
            
            <div class="description">
                <div>
                    <h5>Khám chữa bệnh</h5>
                    <p>Tại Pettie, chúng tôi cam kết cung cấp dịch vụ khám chữa bệnh chất lượng cao và chu đáo cho thú cưng của bạn.</p>
                </div>
                <img src="resource/image/khamchuabenh.jpg" alt="thuoc">
            </div>
                
            <div class="container">
                <div class="pet">
                    <img src="resource/image/cho5kgkb.png" alt="Cat">
                    <p>Chăm sóc răng miệng</p>
                    
                </div>
                <div class="pet">
                    <img src="resource/image/cho10kgkb.png" alt="Dog">
                    <p>Xét nghiệm máu </p>
                    
                </div>
                <div class="pet">
                    <img src="resource/image/meo15kgkb.png" alt="Rabbit">
                    <p>Chăm sóc da và lông </p>
                    
                </div>
                <div class="pet">
                    <img src="resource/image/meo20kgkb.png" alt="Hamster">
                    <p>Phẫu thuật </p>
                    
                </div>
                <div class="pet">
                    <img src="resource/image/meobeophikb.png" alt="Bird">
                    <p>Xổ giun </p>
                    
                </div>
            </div>
            
            <div class="description">
                <div>
                    <h5>Tiêm phòng</h5>
                    <p>Dịch vụ tiêm phòng cho thú cưng là một phần quan trọng của chăm sóc sức khỏe định kỳ để bảo vệ thú cưng của bạn khỏi các bệnh truyền nhiễm nguy hiểm.</p>
                </div>
                <img src="resource/image/khamchuabenh.jpg" alt="thuoc">
            </div>
                
            <div class="container">
                <div class="pet">
                    <img src="resource/image/cho5kgtiem.png" alt="Cat">
                    <p>Tiêm ngừa dại</p>
                    
                </div>
                <div class="pet">
                    <img src="resource/image/cho10kgtiem.png" alt="Dog">
                    <p>Tiêm phòng viêm gan </p>
                    
                </div>
                <div class="pet">
                    <img src="resource/image/meo15kgtiem.png" alt="Rabbit">
                    <p>Tiêm phòng tả </p>
                    
                </div>
                <div class="pet">
                    <img src="resource/image/meo20kgtiem.png" alt="Hamster">
                    <p>Tiêm phòng giun sán </p>
                    
                </div>
                <div class="pet">
                    <img src="resource/image/meobeophitiem.png" alt="Bird">
                    <p>Tiêm phòng viêm đường hô hấp </p>
                    
                </div>
            </div>
            
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
