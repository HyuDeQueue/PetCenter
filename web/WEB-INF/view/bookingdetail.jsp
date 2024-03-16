<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- 
    Document   : bookingdetail
    Created on : Mar 3, 2024, 3:36:41 PM
    Author     : Windows 10
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Accounts"%>
<%@page import="model.Booking"%>
<%@page import="DAO.BookingDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<div id="website-width">
    <%@include file="about.jsp" %>
    <h1>Chi tiết đơn hàng</h1>
    <div id="bookingTable">
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
                            <td>${loop.index + 1}</td>
                            <td>${detail.petName}</td>
                            <td>${detail.serviceName}</td>
                            <td>${detail.bookingDate}</td>
                            <td>${detail.checkinDate}</td>
                            <td>${detail.checkoutDate}</td>
                            <td>${detail.currentPrice} đồng</td>
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
        </div>
    </div>
    <div id='foot'><%@include file="footer.jsp" %></div>
</div>
</body>
</html>
