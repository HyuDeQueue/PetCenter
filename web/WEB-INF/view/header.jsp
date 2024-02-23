<%-- 
    Document   : header
    Created on : Jan 17, 2024, 4:04:36 PM
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
                background-color: #FFF3DE;
            }
           .navbar {
                position: absolute;
                top: 0;
                width: 98%;
                background-color: rgba(255, 105, 180, 0); /* Pink background color with 20% opacity */
                z-index: 1000; /* Ensure the navbar is on top of other elements */
            }

          .navbar-nav .nav-link {
            color: #fff; /* White text color */
            font-weight: bold; /* Bold text */
          }

          .sign-in-btn {
            background-color: #ffa500; /* Orange button color */
            color: #fff; /* White text color */
            font-weight: bold; /* Bold text */
          }
          .navbar-nav .nav-item {
            margin-right: 15px; /* Adjust the value as needed */
        }
          #pt{
              font-weight: bold;
              color: white;
          }
        </style>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg">
            <a class="navbar-brand" href="Home" id="pt">
                <img src="resource/image/kitty.png" width="30" height="30" class="d-inline-block align-top" alt="">
                PETTIE 
            </a>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dịch vụ
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="hotel">Khách sạn thú cưng</a>
                            <a class="dropdown-item" href="train">Huấn luyện chó mèo</a>
                            <a class="dropdown-item" href="servicebooking">Cắt tỉa lông</a> 
                            <a class="dropdown-item" href="servicebooking">Tư vấn y tế miễn phí</a>
                            <a class="dropdown-item" href="servicebooking">Khám chữa bệnh, tiêm phòng</a>
                            <a class="dropdown-item" href="servicebooking">Dịch vụ spa</a>
                        </div>
                    </li>
                    <c:if test="${loggedInAccount == null}"><li class="nav-item">
                       <a href="signin" class="btn btn-outline-warning sign-in-btn">Login/Signup</a>
                    </li>
                    </c:if>
                    <c:if test="${loggedInAccount != null}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle btn btn btn-outline-info" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${loggedInAccount.firstName} ${loggedInAccount.lastName}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="profile">Thông tin cá nhân</a>
                                <a class="dropdown-item" href="addpet">Thêm thú cưng</a>
                                <a class="dropdown-item" href="#">Thông tin Booking</a>
                                <div class="dropdown-divider"></div>
                                <c:if test="${loggedInAccount.role == 'admin'}">
                                    <a class="dropdown-item" href="managecustomer">Quản lý người dùng</a>
                                    <a class="dropdown-item" href="#">Quản lý đơn hàng</a>
                                    <a class="dropdown-item" href="#">Quản lý dịch vụ</a>
                                    <a class="dropdown-item" href="#">Quản lý phản hồi</a>
                                    <div class="dropdown-divider"></div>
                                </c:if>
                                <a class="dropdown-item" href="logout">Logout</a>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
