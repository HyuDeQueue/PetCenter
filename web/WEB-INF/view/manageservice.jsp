<%-- 
    Document   : manageservice
    Created on : Feb 25, 2024, 5:57:16 PM
    Author     : Windows 10
--%>

<%@page import="DAO.ServiceDAO"%>
<%@page import="model.Service"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                text-align: justify;
            }
            #manage-board{
                border: 2px solid black;
                background-color: wheat;
                border-radius: 18px;
            }

            #foot{
                margin-top: 2%;
            }
            #manage-board{
                padding: 2%;
            }
            #manage-board > div > h4{
                margin: 1%;
            }
            #manage-board > div:first-child{
                border: 2px solid black;
                background-color: white;
                border-radius: 12px;
                text-align: center;
                margin: 1%;
            }   
            #manage-board > div > table{
                width: 98%;
                margin: 1% auto;
            }
            #manage-board > div > table *{
                /*width: 10%;*/
                font-size: 85%;
            }
            #createservicebutton{
                display: flex;
                justify-content: center;
                margin-bottom: 0%;
            }
        </style>
    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <div id="about_pettie">
                <h1>Quản lý dịch vụ</h1>
            </div>
            <div id="manage-board">
                <div>
                    <%
                    ServiceDAO serviceDAO = new ServiceDAO();
                    ArrayList<Service> service_list = serviceDAO.GetAllServices();
                    session.setAttribute("list_service", service_list);
                %>
                <table class="table table-bordered table-hover table-sm">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Tên dịch vụ</th>
                            <th>Giá tiền dịch vụ</th>
                            <th>Chiều dài lồng(optional)</th>
                            <th>Chiều rộng lồng(optional)</th>
                            <th>Chiều cao lồng(optional)</th>
                            <th>Trạng thái</th>
                            <th>Chỉnh sửa</th>
                            <th>Xóa dịch vụ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="service" items="${list_service}">
                            <tr>
                                <td>${service.getServiceId()}</td>
                                <td>${service.getServiceName()}</td>
                                <td>${service.getServicePrice()}đ</td>
                                <td>${service.getCageLength()}</td>
                                <td>${service.getCageWidth()}</td>
                                <td>${service.getCageHeight()}</td>
                                <c:if test="${service.getServiceStatus() == 'active'}"><td><input class="btn btn-outline-success" type="submit" value="Hoạt động"></td></c:if>
                                <c:if test="${service.getServiceStatus() == 'disabled'}"><td><input class="btn btn-outline-danger" type="submit" value="Tạm ngưng"></td></c:if>
                                <td><form><input type="hidden" value="${service.getServiceId()}" name="toggleServiceId"><input class="btn btn-outline-primary" type="submit" name="chinhsua" value="Chỉnh sửa"></form></td>
                                <td><form><input type="hidden" value="${service.getServiceId()}" name="deleteServiceId"><input class="btn btn-danger" type="submit" name="chinhsua" value="Xóa"></form></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                </div>
                <div id="createservicebutton">
                    <form>
                        <input type="submit" class="btn btn-info" name="" value="Tạo thêm dịch vụ">
                    </form>
                </div>
            </div>
                
            <div id="foot">
                <%@include file="footer.jsp" %>
            </div>
        </div>
    </body>
</html>
