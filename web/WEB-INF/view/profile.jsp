    <%-- 
    Document   : profile
    Created on : Jan 20, 2024, 2:39:04 PM
    Author     : Windows 10
--%>

<%@page import="model.Accounts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>
            #website-width{
                width: 70%;
            }
            #foot{
                
            }
            #profile-pic{
                width: 100%;
                border: 1px black solid;
                border-radius: 200%;
            }
            #profile-page{
                margin-left: 0px;
                margin-right:0px;
            }
            #profile-pic-side{
                padding-top: 2%;
                background-color: white;
                border: 1px black solid;
                display: flex;
                align-content: center;
                flex-direction: column;
                text-align: center;
            }
            #profile-pic-side h5{
                font-size: 80%;
                color: #545454;
            }
            #profile-pic-side p{
                font-size: 110%;
                color: black;
                font-weight: bold;
            }
            #profile-info-side{
                background-color: #63adf7;
                border: 1px black solid;
                display: flex;
                justify-content: center;
                flex-direction: column;
            }
            #profile-info{
                margin-top: 3%;
                border-radius: 20px;
                background-color: whitesmoke;
                border: 1px black solid;
                padding: 1%;
                padding-left: 3%;
            }
            #profile-info form input{
                border-radius: 40px;
            }
            #profile-pet{
                border-radius: 20px;
                background-color: whitesmoke;
                border: 1px black solid;
                padding: 1%;
                padding-left: 3%;
                margin-top: 10%;
                
            }
            
            #profile-pet table{
                width: 100%;
                padding-right: 2%;
            }
            
            
            #profile-pet table, th, td{
                border: 1px black solid;
                font-size: 80%;
                text-align: center;
            }
            
            #profile-pet table th{
                padding-top: 1%;
                padding-bottom: 1%;
                font-size: 85%;
            }
            
            .pet-form button{
                font-size: 90%;
                font-weight: bold;
            }
            #profile-pet p{
                font-size: 110%;
                color: black;
                font-weight: bold;
            }
            
        </style>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <div class="row" id="profile-page">
                <div class="col-12 col-md-3" id="profile-pic-side">
                    <%
                        Accounts accounts = (Accounts) session.getAttribute("loggedInAccount");
                    %>
                    
                    <c:choose>
                        <c:when test="${loggedInAccount.getSex() == 'Male'}"><img src="resource/image/male.jpg" id="profile-pic"></c:when>
                        <c:when test="${loggedInAccount.getSex() == 'Female'}"><img src="resource/image/female.jpg" id="profile-pic"></c:when>
                        <c:otherwise><img src="resource/image/default.jpg" id="profile-pic"></c:otherwise>
                    </c:choose>
                    <h6>${loggedInAccount.email}</h6>
                    <p>${loggedInAccount.firstName} ${loggedInAccount.lastName}</p>
                </div>
                <div class="col-12 col-md-9" id="profile-info-side">
                    <div id="profile-info">
                        <h4>Thông tin cá nhân:</h4>
                        <p>Email: ${loggedInAccount.email} </p>
                        <p>Họ: ${loggedInAccount.firstName}</p>
                        <p>Tên: ${loggedInAccount.lastName}</p>
                        <p>Giới tính: <c:choose>
                                <c:when test="${loggedInAccount.getSex() == 'Male'}">Nam</c:when>
                                <c:when test="${loggedInAccount.getSex() == 'Female'}">Nữ</c:when>
                                <c:otherwise>Giới tính khác</c:otherwise>
                            </c:choose></p>
                        <p>Số điện thoại: ${loggedInAccount.getPhone()}</p>
                        <p>Vai trò: ${loggedInAccount.role}</p>
<!--                        <form>
                            <input type="hidden" value="${loggedInAccount.email}" name="email">
                            <input type="submit" value="Cập nhật thông tin" class="btn btn-primary" />
                        </form>-->
                    </div>
                    
                    <div id="profile-pet">
                        <h4>Danh sách thú cưng của bạn:</h4>
                        <table>
                            <tr>
                                <th>Tên thú cưng</th>
                                <th>Giới tính thú cưng</th>
                                <th>Loại thú cưng</th>
                                <th>Cân nặng</th>
                                <th>Chiều cao</th>
                                <th>Chiều dài</th>
                                <th>Tính cách</th>
                                <th>Món ưa thích</th>
                                <th>Trạng thái</th>
                                <th>Chỉnh sửa</th>
                                <th>Xóa thú cưng</th>
                            </tr>
                            
                            <c:if test="${userPet != null}">
                                <c:forEach var="pet" items="${userPet}">
                                    <c:if test="${pet.petStatus != 'hidden'}">
                                        <tr>
                                            <td>${pet.petName}</td>
                                            <td>${pet.petSex}</td>
                                            <td>${pet.petType}</td>
                                            <td>${pet.petWeight}</td>
                                            <td>${pet.petHeight}</td>
                                            <td>${pet.petLength}</td>
                                            <td>${pet.petBehavior}</td>
                                            <td>${pet.petFavoriteFood}</td>
                                            <td>
                                                <c:if test="${pet.petStatus == 'active'}"><form action="togglepet" method="post" class="pet-form"><input type="hidden" name="petId" value="${pet.petId}"><input type="hidden" name="petStatus" value="${pet.petStatus}"><button type="submit" class="btn btn-success">Hoạt động</button></form></c:if>
                                                <c:if test="${pet.petStatus == 'disable'}"><form action="togglepet" method="post" class="pet-form"><input type="hidden" name="petId" value="${pet.petId}"><input type="hidden" name="petStatus" value="${pet.petStatus}"><button type="submit" class="btn btn-secondary">Nghỉ ngơi</button></form></c:if>
                                            </td>
                                            <td><form action="editpet" method="post" class="pet-form"><input type="hidden" name="petId" value="${pet.petId}"><button type="submit" class="btn btn-warning">Chỉnh sửa</button></form></td>
                                            <td><form action="deletepet" method="post" class="pet-form"><input type="hidden" name="petId" value="${pet.petId}"><button type="submit" class="btn btn-danger" onclick="return window.confirm('Bạn có chắc muốn xóa thú cưng này?')">Xóa thú cưng</button></form></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </table>
                    </div>
                </div>
            </div>
            <div id="foot"><%@include file="footer.jsp" %></div>
        </div>
    </body>
</html>
