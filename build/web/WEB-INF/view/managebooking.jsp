<%-- 
    Document   : managebooking
    Created on : Mar 3, 2024, 2:51:01 PM
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
            body{
                display: flex;
                justify-content: center;

            }
            #website-width{
                width: 70%;
                background-color: #fff3de;
                text-align: center;
            }   
            #website-width .mid{
                margin: 0 auto;
                padding-left: 0;
                padding-right: 0;
            }
            #website-width h2{
                font-size: 130%;
            }
            #bookingTable{
                display: flex;
                justify-content: center;
                flex-direction: column;
            }
            #bookingTable > div{

                background-color: white;
                width: 100%;
                margin: 2%;
                border-radius: 18px;
                border: 1px solid;
            }

        </style>
    </head>
    <body>
        <div id="website-width">
            <%
                BookingDAO bookingDAO = new BookingDAO();
                Accounts userAccounts = (Accounts) session.getAttribute("loggedInAccount");
                ArrayList<Booking> allBooking = bookingDAO.GetAllBooking();
                session.setAttribute("allBooking", allBooking);
            %>
            <%@include file="about.jsp" %>
            <h1>Quản lý đơn hàng</h1>
            <div id="bookingTable">
                <div id="waiting">
                    <h3>Đang chờ duyệt</h3>
                    <table class="table table-sm table-hover table-striped table-bordered">
                        <thead>
                            <tr>
                                <td>BookingId</td>
                                <td>Email</td>
                                <td>Ngày booking</td>
                                <td>Trạng thái</td>
                                <td>Chi tiết</td>
                                <td>Xác nhận</td>
                                <td>Chỉnh sửa đơn</td>
                                <td>Hủy đơn</td>
                            </tr>
                        </thead>
                        <c:if test="${allBooking != null}">
                            <tbody>
                                <c:forEach var="Booking" items="${allBooking}">
                                    <c:if test="${Booking.status == 'waiting'}">
                                        <tr>
                                            <td>${Booking.getBookingId()}</td>
                                            <td>${Booking.getEmail()}</td>
                                            <td>${Booking.getBookingDate()}</td>
                                            <td>${Booking.status}</td>
                                            <td><form><input type="submit" class="btn btn-info" value="Chi tiết"></form></td>
                                            <td><form action="proceedbooking" method="post"><input type="hidden" name="status" value="confirmed"><input type="hidden" name="bookingId" value="${Booking.getBookingId()}"><input type="submit" class="btn btn-success" value="Xác nhận đơn"></form></td>
                                            <td><form><input type="submit" class="btn btn-warning" value="Chỉnh sửa đơn"></form></td>
                                            <td><form action="cancelbooking" method="post"><input type="hidden" name="userEmail" value="${loggedInAccount.email}"><c:if test="${Booking.getBookingId() != null}"><input type="hidden" name="bookingId" value="${Booking.getBookingId()}"></c:if><input type="submit" class="btn btn-danger" value="Hủy đơn"></form></td>
                                            </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </c:if>
                    </table>
                </div>

                <div id="confirmed">
                    <h3>Đã xác nhận</h3>
                    <table class="table table-sm table-hover table-striped table-bordered">
                        <thead>
                            <tr>
                                <td>BookingId</td>
                                <td>Email</td>
                                <td>Ngày booking</td>
                                <td>Trạng thái</td>
                                <td>Chi tiết</td>
                                <td>Check in</td>
                                <td>Hủy đơn</td>
                            </tr>
                        </thead>
                        <c:if test="${allBooking != null}">
                            <tbody>
                                <c:forEach var="Booking" items="${allBooking}">
                                    <c:if test="${Booking.status == 'confirmed'}">
                                        <tr>
                                            <td>${Booking.getBookingId()}</td>
                                            <td>${Booking.getEmail()}</td>
                                            <td>${Booking.getBookingDate()}</td>
                                            <td>${Booking.status}</td>
                                            <td><form><input type="submit" class="btn btn-info" value="Chi tiết"></form></td>
                                            <td><form action="proceedbooking" method="post"><input type="hidden" name="status" value="checkedin"><input type="hidden" name="bookingId" value="${Booking.getBookingId()}"><input type="submit" class="btn btn-success" value="Đã checkin"></form></td>
                                            <td><form action="cancelbooking" method="post"><input type="hidden" name="userEmail" value="${loggedInAccount.email}"><c:if test="${Booking.getBookingId() != null}"><input type="hidden" name="bookingId" value="${Booking.getBookingId()}"></c:if><input type="submit" class="btn btn-danger" value="Hủy đơn"></form></td>
                                            </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </c:if>
                    </table>
                </div>
                <div id="checkedin">
                    <h3>Đang xử lý</h3>
                    <table class="table table-sm table-hover table-striped table-bordered">
                        <thead>
                            <tr>
                                <td>BookingId</td>
                                <td>Email</td>
                                <td>Ngày booking</td>
                                <td>Trạng thái</td>
                                <td>Chi tiết</td>
                                <td>Hoàn thành đơn</td>
                            </tr>
                        </thead>
                        <c:if test="${allBooking != null}">
                            <tbody>
                                <c:forEach var="Booking" items="${allBooking}">
                                    <c:if test="${Booking.status == 'checkedin'}">
                                        <tr>
                                            <td>${Booking.getBookingId()}</td>
                                            <td>${Booking.getEmail()}</td>
                                            <td>${Booking.getBookingDate()}</td>
                                            <td>${Booking.status}</td>
                                            <td><form><input type="submit" class="btn btn-info" value="Chi tiết"></form></td>
                                            <td><form action="proceedbooking" method="post"><input type="hidden" name="status" value="finished"><input type="hidden" name="bookingId" value="${Booking.getBookingId()}"><input type="submit" class="btn btn-success" value="Hoàn thành"></form></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </c:if>
                    </table>
                </div>
                <div id="finished">
                    <h3>Đã hoàn thành</h3>
                    <table class="table table-sm table-hover table-striped table-bordered">
                        <thead>
                            <tr>
                                <td>BookingId</td>
                                <td>Email</td>
                                <td>Ngày booking</td>
                                <td>Trạng thái</td>
                                <td>Chi tiết</td>
                                <td>Feedback</td>
                            </tr>
                        </thead>
                        <c:if test="${allBooking != null}">
                            <tbody>
                                <c:forEach var="Booking" items="${allBooking}">
                                    <c:if test="${Booking.status == 'finished'}">
                                        <tr>
                                            <td>${Booking.getBookingId()}</td>
                                            <td>${Booking.getEmail()}</td>
                                            <td>${Booking.getBookingDate()}</td>
                                            <td>${Booking.status}</td>
                                            <td><form><input type="submit" class="btn btn-info" value="Chi tiết"></form></td>
                                            <td><input type="button" class="btn btn-warning" value="Nhận xét"></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </c:if>
                    </table>
                </div>
                <div id="cancelled">
                    <h3>Đơn đã bị hủy</h3>
                    <table class="table table-sm table-hover table-striped">
                        <thead>
                            <tr>
                                <td>#</td>
                                <td>Ngày booking</td>
                                <td>Trạng thái</td>
                                <td>Chi tiết</td>
                            </tr>
                        </thead>
                        <c:if test="${allBooking != null}">
                            <tbody>
                                <c:forEach var="Booking" items="${allBooking}" varStatus="loop">
                                    <c:if test="${Booking.status == 'cancelled'}">
                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td>${Booking.getBookingDate()}</td>
                                            <td>${Booking.status}</td>
                                            <td><form><input type="submit" class="btn btn-info" value="Chi tiết"></form></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </c:if>
                    </table>
                </div>
            </div>
            <div id='foot'><%@include file="footer.jsp" %></div>
        </div>
    </body>
</html>
