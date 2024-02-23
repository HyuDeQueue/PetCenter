<%-- 
    Document   : managecustomer
    Created on : Feb 22, 2024, 7:03:10 PM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            #about_pettie{
                margin: 2%;
            }
            #foot{
                width: 100%;
                margin-top: 3%;
            }
            #search_bar{
                border: 1px black solid;
                padding-top: 1%;
                padding-left: 1%;
                padding-right: 1%;
                padding-bottom: 1%;
                width: 50%;
            }
            #user_list_table{
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <div id="about_pettie">
                <h1>Quản lý khách hàng</h1>
            </div>
            <div id="search_bar">
                
                <form id="namesearch" action="namesearch" method="post" >
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Nguyen Van A">
                    </div>
                </form>
                
                <form id="emailsearch" action="emailsearch" method="post" >
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="abc@example.com">
                        </div>
                </form>
                
            </div>
            
            
            <div id="user_list_table">
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Họ và tên</th>
                            <th>Giới tính</th>
                            <th>Số điện thoại</th>
                            <th>Email</th>
                            <th>Vai trò</th>
                            <th>Trạng thái</th>
                            <th>Chi tiết</th>
                        </tr>
                    </thead>
                    <c:if test="${list_accounts != null}">
                        <tbody>
                        <c:forEach var="accounts" items="${list_accounts}">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${accounts.firstName} ${accounts.lastName}</td>
                                <td>${accounts.sex}</td>
                                <td>${accounts.Phone}</td>
                                <td>${accounts.email}</td>
                                <td>${accounts.role}</td>
                                <td>${accounts.accountStatus}</td>
                                <td><button type="button" class="btn btn-outline-primary">Chi tiết</button></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </c:if>
                </table>
            </div>
            
            <div id="foot">
                <%@include file="footer.jsp" %>
            </div>
        </div>
    </body>
</html>
