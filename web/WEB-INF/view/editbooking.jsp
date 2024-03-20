<%-- 
    Document   : editbooking
    Created on : Mar 19, 2024, 2:13:26 PM
    Author     : Windows 10
--%>

<%@page import="model.Service"%>
<%@page import="DAO.ServiceDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Accounts"%>
<%@page import="model.Booking"%>
<%@page import="DAO.BookingDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                display: flex;
                justify-content: center;
            }

            #website-width {
                width: 70%;
                background-color: #fff3de;
                text-align: center;
            }

            #website-width .mid {
                margin: 0 auto;
                padding-left: 0;
                padding-right: 0;
            }

            #website-width h2 {
                font-size: 130%;
            }

            #bookingTable {
                display: flex;
                justify-content: center;
                flex-direction: column;
            }

            #bookingTable > div {
                background-color: white;
                width: 100%;
                border-radius: 18px;
                border: 1px solid;
                margin-bottom: 1%;
                padding: 1%;
            }
        </style>
    </head>
    <body>
        <%
            ServiceDAO serviceDAO = new ServiceDAO();
            ArrayList<Service> allService = serviceDAO.GetAllServices();
            request.setAttribute("allService", allService);
        %>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <h1>Chỉnh sửa đơn hàng</h1>
            <div id="bookingTable">
                <form action="editbooking" method="post">
                    <div id="waiting">
                        <table class="table table-hover table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Tên thú cưng</th>
                                    <th>Tên dịch vụ</th>
                                    <th>Ngày booking</th>
                                    <th>Ngày checkin</th>
                                    <th>Ngày checkout</th>
                                    <th>Giá tiền</th>
                                </tr>
                            </thead>

                            <c:if test="${list_detail != null}">
                                <tbody>
                                    <c:forEach var="detail" items="${list_detail}" varStatus="loop">
                                        <tr>
                                    <input type="hidden" name="detailId" value="${detail.getDetailId()}">
                                            <td>${loop.index + 1}</td>
                                            <td>${detail.petName}</td>
                                            <td>
                                                <select name="selectedService">
                                                    <c:forEach var="service" items="${allService}">
                                                        <option value="${service.serviceId}" ${detail.serviceId eq service.serviceId ? 'selected' : ''}>${service.serviceName}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <td>${detail.bookingDate}</td>
                                            <td>${detail.checkinDate}</td>
                                            <td>${detail.checkoutDate}</td>
                                            <td><input type="number" value="${detail.currentPrice}" name="price" required></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </c:if>
                        </table>
                        <c:set var="sumPrice" value="0" />
                        <c:forEach var="detail" items="${list_detail}">
                            <c:set var="sumPrice" value="${sumPrice + detail.currentPrice}" />
                        </c:forEach>
                        <h4 style="red">Tổng số tiền: ${sumPrice} đồng</h4>
                        <input type="submit" class="btn btn-block btn-primary" value="Chỉnh sửa">
                    </div>
                </form>
            </div>
            <div id='foot'><%@include file="footer.jsp" %></div>
        </div>
    </body>
</html>
