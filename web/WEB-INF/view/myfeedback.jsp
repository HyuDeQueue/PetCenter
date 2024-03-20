<%-- 
    Document   : myfeedback
    Created on : Mar 1, 2024, 3:35:53 PM
    Author     : Windows 10
--%>

<%@page import="DAO.FeedbackDAO"%>
<%@page import="model.Feedback"%>
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
            #feedbackTable{
                background-color: #F5DEB3;
                border-radius: 18px;
                border: 2px solid black;
                padding: 2%;
                margin-bottom: 1%;
                margin-top: 1%;
            }
            #feedbackTable > div{
                background-color: white;
                border-radius: 18px;
                border: 2px solid black;
                padding: 2%;
                margin-bottom: 1%;
                margin-top: 1%;
            }
            
            #feedbackTable > div > table{
                width: 100%;

            }

        </style>
    </head>
    <body>
        <div id="website-width">
            <%
//                Accounts userAccounts = (Accounts) session.getAttribute("loggedInAccount");
//                FeedbackDAO feedbackDAO = new FeedbackDAO();
//                ArrayList<Feedback> userFeedback = feedbackDAO.getUserFeedback(userAccounts.getEmail());
//                session.setAttribute("userFeedback", userFeedback);
            %>

            <%@include file="about.jsp" %>

            <div id="feedbackTable">
                <h1>Phản hồi của bạn</h1>
                <div>
                    <table class="table table-sm table-hover table-striped table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 5%;">Booking</th>
                                <th style="width: 15%;">Ngày nhận xét</th>
                                <th style="width: 40%;">Nhận xét</th>
                                <th style="width: 40%;">Phản hồi</th>
                            </tr>
                        </thead>
                        <c:if test="${userFeedback != null}">
                            <tbody>
                                <c:forEach var="Feedback" items="${userFeedback}" varStatus="loop">
                                    <tr>
                                        <td>${Feedback.getBookingId()}</td>
                                        <td>${Feedback.getFeedbackDate()}</td>
                                        <td>${Feedback.getMessage()}</td>
                                        <td>${Feedback.getReplyMessage()}</td>
                                    </tr>
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
