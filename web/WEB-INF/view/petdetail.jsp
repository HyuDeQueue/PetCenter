<%@page import="model.Pet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.PetDAO"%>
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

            .addpet-form {
                width: 100%;
                max-width: 800px;
                padding: 20px;
                overflow: auto;
                border-radius: 10px;
                background-color: white;
                border: 1px solid black;
                margin: 15px auto;
            }

            h1 {
                text-align: center;
            }

            p {
                margin-bottom: 10px;
            }

            select,
            input[type="number"],
            input[type="text"],
            input[type="submit"] {
                width: calc(100% - 10px);
                margin-bottom: 10px;
                padding: 5px;
                box-sizing: border-box;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }
        </style>


    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <div class="addpet-form">
                <h1>Thông tin về thú cưng của tài khoản:</h1>
                <%
                    String email = (String) request.getAttribute("email");
                %>
                        <c:choose>
                            <c:when test="${not empty thatUserPet}">
                                <table>
                                    <tr>
                                        <th>Tên</th>
                                        <th>Giới Tính</th>
                                        <th>Loại</th>
                                        <th>Cân Nặng</th>
                                        <th>Chiều Cao</th>
                                        <th>Chiều Rộng</th>
                                        <th>Tính Cách</th>
                                        <th>Đồ Ăn Ưa Thích</th>
                                        <th>Trạng th</th>
                                    </tr>
                                    <c:forEach var="pet" items="${thatUserPet}">
                                        <tr>
                                            <td>${pet.petName}</td>
                                            <td>${pet.petSex}</td>
                                            <td>${pet.petType}</td>
                                            <td>${pet.petWeight}</td>
                                            <td>${pet.petHeight}</td>
                                            <td>${pet.petLength}</td>
                                            <td>${pet.petBehavior}</td>
                                            <td>${pet.petFavoriteFood}</td>
                                            <td>${pet.petStatus}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:when>
                    <c:otherwise>
                        <p>Không có thông tin về thú cưng nào được tìm thấy với email ${email}.</p>
                    </c:otherwise>
                </c:choose>
            </div>
            <div id="foot"><%@include file="footer.jsp" %></div>
        </div>
    </body>
</html>
