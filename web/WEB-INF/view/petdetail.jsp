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
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                font-family: Arial, sans-serif;
            }

            .addpet-form {
                width: 70%;
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
                <h1>Thông tin về thú cưng của bạn:</h1>
                <c:set var="email" value="${param.email}" />
                <c:choose>
                    <c:when test="${email!=null && !email.isEmpty()}">
                        <c:set var="pets" value="${petDao.getAllPet(email)}"/>
                        <c:out value="${pets}" />
                        <c:choose>
                            <c:when test="${empty pets}">
                                <p>Không có thông tin về thú cưng nào được tìm thấy với email ${param.email}</p>
                            </c:when>
                            <c:when test="${not empty pets}">
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
                                    </tr>
                                    <c:forEach var="pet" items="${pets}">
                                        <tr>
                                            <td>${pet.petname}</td>
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
                        </c:choose>

                    </c:when>
                    <c:otherwise><p>Không có thông tin về thú cưng nào được tìm thấy với email ${param.email}.</p>
                    </c:otherwise>
                </c:choose>
            </div>

            <%/*
            // Nhận email từ yêu cầu HTTP
            String email = request.getParameter("email");

            // Kiểm tra xem email có tồn tại không
            if (email != null && !email.isEmpty()) {
                // Tạo một đối tượng PetDAO
                PetDAO petDAO = new PetDAO();
        
                // Lấy danh sách thú cưng của người dùng dựa trên email
                ArrayList<Pet> pets = petDAO.getAllPet(email);

                // Hiển thị thông tin về thú cưng
                out.println("<div class=\"addpet-form\">");
                out.println("<h1>Thông tin về thú cưng của bạn:</h1>");
                if (pets.isEmpty()) {
                    out.println("<p>Không có thông tin về thú cưng nào được tìm thấy với email " + email + ".</p>");
                } else {
                    out.println("<table>");
                    out.println("<tr><th>Tên</th><th>Giới Tính</th><th>Loại</th><th>Cân Nặng</th><th>Chiều Cao</th><th>Chiều Rộng</th><th>Tính Cách</th><th>Đồ Ăn Ưa Thích</th></tr>");
                    for (Pet pet : pets) {
                        out.println("<tr>");
                        out.println("<td>" + pet.getPetName() + "</td>");
                        out.println("<td>" + pet.getPetSex()+ "</td>");
                        out.println("<td>" + pet.getPetType() + "</td>");
                        out.println("<td>" + pet.getPetWeight()+ "</td>");
                        out.println("<td>" + pet.getPetHeight()+ "</td>");
                        out.println("<td>" + pet.getPetLength()+ "</td>");
                        out.println("<td>" + pet.getPetBehavior()+ "</td>");
                        out.println("<td>" + pet.getPetFavoriteFood()+ "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                }
                out.println("</div>");
            } else {
                out.println("<p>Bạn hiện không có thú cưng nào hết.</p>");
            }
                 */
            %>

            <div id="foot"><%@include file="footer.jsp" %></div>
        </div>
    </body>
</html>
