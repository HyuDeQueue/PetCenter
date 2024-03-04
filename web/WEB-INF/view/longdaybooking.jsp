<%-- 
    Document   : longdaybooking
    Created on : Feb 29, 2024, 11:01:41 PM
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
            }
            #bookingForm > div{
                background-color: white;
                border: 2px solid black;
                border-radius: 14px;
                margin: 1% auto;
                box-sizing: border-box;
                padding: 2%;
            }
            #bookingForm > div p{
                margin: 1%;
            }
            
            #choosingday{
                padding: 1% 2% 1% 2%;
                background-color: white;
                border-radius: 14px;
                border: 2px solid black;
                width: 20%;
            }
            
            #bookbutton{
                margin-top: 1%;
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
                <div id="bookingForm" class="row">
                    <c:forEach var="pet" items="${pickedPets}" varStatus="loop">
                        <div class="bookingforapet col-3">
                            <input type="hidden" name="bookpetId${loop.index}" value="${pet.petId}">
                            <p>Tên thú cưng: ${pet.petName}</p>
                            <p>
                                <select class="custom-select" name="selectedService${loop.index}" required>
                                    <option selected disabled>Chọn kiểu phòng</option>
                                    <c:forEach var="service" items="${allService}">
                                        <c:if test="${service.serviceType eq 'longtime'}">
                                            <option value="${service.serviceId}">${service.getServiceName()} -> ${service.getServicePrice()} đồng/ngày</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </p>
                        </div>
                    </c:forEach>
                </div>
                <div id="choosingday">
                    <p>Ngày checkin <input type="date" name="petCheckinDate" min="<%=java.time.LocalDate.now()%>"></p>
                    <p>Ngày checkout <input type="date" name="petCheckoutDate" min="<%=java.time.LocalDate.now()%>"></p>
                </div>`
                <div id="bookbutton">
                    <input type="submit" class="btn btn-success btn-lg" value="Đặt lịch ngay">
                </div>
            </form>
            <div id='foot'><%@include file="footer.jsp" %></div>
        </div>
        <script>
        </script>
    </body>
</html>
