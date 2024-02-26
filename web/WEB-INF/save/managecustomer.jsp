<%-- 
    Document   : managecustomer
    Created on : Feb 22, 2024, 7:03:10 PM
    Author     : Windows 10
--%>

<%@page import="DAO.AccountsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Accounts"%>
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
            #AccountStatus form button{
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
                
                <form id="namesearch">
                    <div class="input-group mb-3">
                        <input type="text" id="nameInput" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Nguyen Van A">
                    </div>
                </form>
                
                <form id="emailsearch">
                        <div class="input-group mb-3">
                            <input type="text" id="emailInput" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="abc@example.com">
                        </div>
                </form>
                
            </div>
            
            
            <div id="user_list_table" style="max-height: 400px; overflow-y: auto;">
                <table id="userTable" class="table table-bordered table-hover table-sm">
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
                    
                    <%
                        AccountsDAO accountsDAO = new AccountsDAO();
                        ArrayList<Accounts> allAccounts = accountsDAO.getAllAccounts();
                        session.setAttribute("list_accounts", allAccounts);
                    %>
                    
                    <c:if test="${list_accounts != null}">
                        <tbody id="userTableBody">
                            <c:forEach var="accounts" items="${list_accounts}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${accounts.firstName} ${accounts.lastName}</td>
                                <td>${accounts.sex}</td>
                                <td>${accounts.getPhone()}</td>
                                <td>${accounts.email}</td>
                                <td>${accounts.role}</td>
                                <td id="AccountStatus">
                                    <c:if test="${accounts.accountStatus == 'active'}"><form action="toggleuser" method="post"><input type="hidden" value="${accounts.email}" name="email"><input type="hidden" value="${accounts.accountStatus}" name="status"><button value="active" type="submit" class="btn btn-success" onclick="return window.confirm('Bạn có chắc muốn khóa tài khoản người này?')">Active</button></form></c:if>
                                    <c:if test="${accounts.accountStatus == 'blocked'}"><form action="toggleuser" method="post"><input type="hidden" value="${accounts.email}" name="email"><input type="hidden" value="${accounts.accountStatus}" name="status"><button value="blocked" type="submit" class="btn btn-danger" onclick="return window.confirm('Bạn có chắc muốn mở khóa tài khoản người này?')">Blocked</button></form></c:if>
                                </td>
                                <td><button type="button" class="btn btn-outline-primary">▼</button></td>
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
