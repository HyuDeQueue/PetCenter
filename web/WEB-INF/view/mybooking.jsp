<%-- 
    Document   : mybooking
    Created on : Mar 1, 2024, 3:35:53 PM
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
                display: flex;
                justify-content: center;
            }
            #bookingTable > div > div{
                background-color: white;
                width: 50%;
                margin: 2%;
                border-radius: 18px;
                border: 1px solid;
            }

        </style>
    </head>
    <body>
        <div id="website-width">
            <%
//                BookingDAO bookingDAO = new BookingDAO();
//                Accounts userAccounts = (Accounts) session.getAttribute("loggedInAccount");
//                ArrayList<Booking> userBooking = bookingDAO.getUserBooking(userAccounts.getEmail());
//                session.setAttribute("userBooking", userBooking);
            %>
            <%@include file="about.jsp" %>
            <h1>Đơn đặt hàng của bạn</h1>
            <div id="bookingTable">
                <div id="firstcolumn">
                    <div id="waiting">
                        <h3>Đang chờ duyệt</h3>
                        <table class="table table-sm table-hover table-striped table-bordered">
                            <thead>
                                <tr>
                                    <td>#</td>
                                    <td>Ngày booking</td>
                                    <td>Trạng thái</td>
                                    <td>Chi tiết</td>
                                    <td>Hủy đơn</td>
                                </tr>
                            </thead>
                            <c:if test="${userBooking != null}">
                                <tbody>
                                    <c:forEach var="Booking" items="${userBooking}" varStatus="loop">
                                        <c:if test="${Booking.status == 'waiting'}">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>${Booking.getBookingDate()}</td>
                                                <td>${Booking.status}</td>
                                                <td>
                                                    <form>
                                                        <input type="button" data-bookingid="${Booking.getBookingId()}" class="btn btn-info" value="Chi tiết" onclick="openPopup(this)">
                                                    </form>
                                                </td>
                                                <td><form action="cancelbooking" method="post"><input type="hidden" name="userEmail" value="${loggedInAccount.email}"><c:if test="${Booking.getBookingId() != null}"><input type="hidden" name="bookingId" value="${Booking.getBookingId()}"></c:if><input type="submit" class="btn btn-danger" value="Hủy đơn"></form></td>
                                                </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </c:if>
                        </table>
                    </div>

                    <div id="confirmed">
                        <h3>Đang hoạt động</h3>
                        <table class="table table-sm table-hover table-striped">
                            <thead>
                                <tr>
                                    <td>#</td>
                                    <td>Ngày booking</td>
                                    <td>Trạng thái</td>
                                    <td>Chi tiết</td>
                                </tr>
                            </thead>
                            <c:if test="${userBooking != null}">
                                <tbody>
                                    <c:forEach var="Booking" items="${userBooking}" varStatus="loop">
                                        <c:if test="${Booking.status == 'confirmed' || Booking.status == 'checkedin'}">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>${Booking.getBookingDate()}</td>
                                                <td>${Booking.status}</td>
                                                <td>
                                                    <form>
                                                        <input type="button" data-bookingid="${Booking.getBookingId()}" class="btn btn-info" value="Chi tiết" onclick="openPopup(this)">
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </c:if>
                        </table>
                    </div>
                </div>
                <div id="secondcolumn">
                    <div id="finished">
                        <h3>Đã hoàn thành</h3>
                        <table class="table table-sm table-hover table-striped">
                            <thead>
                                <tr>
                                    <td>#</td>
                                    <td>Ngày booking</td>
                                    <td>Trạng thái</td>
                                    <td>Chi tiết</td>
                                    <td>Feedback</td>
                                </tr>
                            </thead>
                            <c:if test="${userBooking != null}">
                                <tbody>
                                    <c:forEach var="Booking" items="${userBooking}" varStatus="loop">
                                        <c:if test="${Booking.status == 'finished'}">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>${Booking.getBookingDate()}</td>
                                                <td>${Booking.status}</td>
                                                <td>
                                                    <form>
                                                        <input type="button" data-bookingid="${Booking.getBookingId()}" class="btn btn-info" value="Chi tiết" onclick="openPopup(this)">
                                                    </form>
                                                </td>
                                                <td>
                                                    <button class="btn btn-warning" type="button" data-toggle="collapse" data-target="#collapse${loop.index}" aria-expanded="false" aria-controls="collapse${loop.index}">
                                                        Nhận xét
                                                    </button>
                                                    <div class="collapse" id="collapse${loop.index}">
                                                        <form action="sendFeedback" method="post" style="display: flex;">
                                                            <div class="form-group">
                                                                <textarea class="form-control" id="comment" name="sendFeedback" placeholder="Nhận xét" rows="2"></textarea>
                                                            </div>
                                                            <input type="hidden" name="bookingFeedback" value="${Booking.getBookingId()}">
                                                            <button type="submit" class="btn btn-primary btn-sm">Gửi</button>
                                                        </form>
                                                    </div>
                                                </td>
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
                            <c:if test="${userBooking != null}">
                                <tbody>
                                    <c:forEach var="Booking" items="${userBooking}" varStatus="loop">
                                        <c:if test="${Booking.status == 'cancelled'}">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>${Booking.getBookingDate()}</td>
                                                <td>${Booking.status}</td>
                                                <td>
                                                    <form>
                                                        <input type="button" data-bookingid="${Booking.getBookingId()}" class="btn btn-info" value="Chi tiết" onclick="openPopup(this)">
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </c:if>
                        </table>
                    </div>
                </div>
            </div>
            <div id='foot'><%@include file="footer.jsp" %></div>
        </div>
        <script>
            function openPopup(button) {
                // Lấy bookingId từ attribute 'data-bookingid' của button
                var bookingId = button.getAttribute('data-bookingid');

                // URL của trang servlet bookingdetail
                var url = "bookingdetail?bookingId=" + bookingId;

                // Các thuộc tính của cửa sổ popup
                var width = 800;
                var height = 600;
                var left = (screen.width - width) / 2;
                var top = (screen.height - height) / 2;

                // Mở cửa sổ popup
                window.open(url, "_blank", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);
            }
        </script>
    </body>
</html>
