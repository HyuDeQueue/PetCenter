<%-- 
    Document   : samedaybooking
    Created on : Feb 29, 2024, 11:01:27 PM
    Author     : Windows 10
--%>

<%@page import="DAO.ServiceDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>

            #website-width{
                width: 70%;
                background-color: #fff3de;
            }
            #website-width h1{
                text-align: center;
            }

            #about_pettie p{
                background-color: white;
                text-align: justify;
            }
            #foot{
                width: 100%;
                margin-top: 3%;
            }
            #bookingForm{
                width: 100%;
                display: flex;
                justify-content: center;
                margin: 0;

            }
            #bookingForm > div{
                background-color: white;
                border: 2px solid black;
                border-radius: 14px;
                box-sizing: border-box;
                padding: 1% 2% 1% 2%;
                margin-left: 1%;
                margin-right: 1%;
            }
            #bookingForm > div p{
                margin: 1%;
                text-align: center;
            }

            #choosingday{
                text-align: center;
                padding: 1%;
                margin: 1% auto;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-content: center;
                background-color: white;
                border-radius: 14px;
                border: 2px solid black;
                width: 30%;
            }
            #choosingday *{
                width: 100%;
            }

            #bookbutton{
                text-align: center;
            }

        </style>
    </head>
    <body>
        <%
            ServiceDAO serviceDAO = new ServiceDAO();
            ArrayList<Service> allService = serviceDAO.GetAllServices();
            session.setAttribute("allService", allService);
        %>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <h1>Book dịch vụ cho thú cưng</h1>
            <form action="book" method="post">
                <input type="hidden" name="userEmail" value="${loggedInAccount.getEmail()}">
                <input type="hidden" name="bookType" value="short">
                <div id="bookingForm" class="row">
                    <c:forEach var="pet" items="${pickedPets}" varStatus="loop">
                        <div class="bookingforapet col-3">
                            <input type="hidden" name="bookpetId${loop.index}" value="${pet.petId}">
                            <p>Tên thú cưng: ${pet.petName}</p>
                            <p>
                                <select class="custom-select" name="selectedService${loop.index}" required>
                                    <option disabled>Chọn dịch vụ</option>
                                    <c:forEach var="service" items="${allService}">
                                        <c:if test="${service.serviceType eq 'shortime' && service.getServiceStatus() eq 'active'}">
                                            <option data-price="${service.getServicePrice()}" value="${service.serviceId}">${service.getServiceName()} -> ${service.getServicePrice()} đồng/ngày</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </p>
                        </div>
                    </c:forEach>
                </div>
                <div id="choosingday">
                    <p>Ngày checkin <input type="date" name="petCheckinDate" id="petCheckinDate" min="<%=java.time.LocalDate.now()%>" max="<%=java.time.LocalDate.now().plusDays(30)%>" required></p>
                </div>`
                <div id="bookbutton">
                    <input type="submit" class="btn btn-success btn-lg" value="Đặt lịch ngay">
                </div>
            </form>
            <div id='foot'><%@include file="footer.jsp" %></div>
        </div>
        <script>
            // Lấy tham chiếu đến các trường ngày
            var checkinDateField = document.getElementById('petCheckinDate');
            var checkoutDateField = document.getElementById('petCheckoutDate');

            // Đặt ngày tối thiểu cho trường ngày checkout là ngày hiện tại
            checkoutDateField.min = new Date().toISOString().split('T')[0];

            // Thiết lập sự kiện onchange cho trường ngày checkin
            checkinDateField.onchange = function () {
                // Lấy ngày checkin được chọn
                var checkinDate = new Date(this.value);

                // Tối thiểu ngày checkout là ngày sau ngày checkin
                var minCheckoutDate = new Date(checkinDate);
                minCheckoutDate.setDate(minCheckoutDate.getDate() + 1);

                // Tối đa ngày checkout là 30 ngày sau ngày checkin
                var maxCheckoutDate = new Date(checkinDate);
                maxCheckoutDate.setDate(maxCheckoutDate.getDate() + 30);

                // Đặt giá trị min và max cho trường ngày checkout
                checkoutDateField.min = minCheckoutDate.toISOString().split('T')[0];
                checkoutDateField.max = maxCheckoutDate.toISOString().split('T')[0];

                // Reset giá trị trường ngày checkout nếu nó không hợp lệ với ràng buộc mới
                if (new Date(checkoutDateField.value) < minCheckoutDate || new Date(checkoutDateField.value) > maxCheckoutDate) {
                    checkoutDateField.value = minCheckoutDate.toISOString().split('T')[0];
                }
            };
        </script>
    </body>

</html>
