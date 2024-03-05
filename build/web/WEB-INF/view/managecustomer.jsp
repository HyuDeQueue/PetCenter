<%-- 
    Document   : managecustomer
    Created on : Feb 22, 2024, 7:03:10 PM
    Author     : Windows 10
--%>

<%@page import="model.Pet"%>
<%@page import="DAO.PetDAO"%>
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
            body {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-content: center;
                align-items: center;
            }

            #website-width {
                width: 70%;
                background-color: #fff0de;
            }

            .managecustomer-form {
                width: 100%;
                max-width: 700px;
                background-color: white;
                border-radius: 10px;
                border: 1px solid black;
                margin: 15px auto;
                padding: 20px;
                overflow-x: auto; /* Enable horizontal scrolling */

            }

            .managecustomer-form h1 {
                text-align: center;
                margin-bottom: 20px;
            }

            .managecustomer-form form {
                width: 100%;
            }

            #search_bar {
                padding: 1%;
                width: 100%;
                margin-bottom: 20px;
            }

            #foot {
                width: 70%; /* Adjust width of footer to match website width */
                margin-top: 3%;
            }

            #user_list_table {
                width: 100%;
                max-width: 100%;
                overflow-x: auto; /* Add horizontal scroll if needed */
            }

            #userTable {
                width: 100%;
                border-collapse: collapse;
            }

            #userTable th,
            #userTable td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            #userTable th {
                background-color: #f2f2f2;
            }

            #userTable tbody tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            #foot{
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
            <div class="managecustomer-form">
                <h1>Quản lý khách hàng</h1>
                <div id="search_bar">
                    <form id="nameSearchForm" onsubmit="return false;">
                        <div class="input-group mb-3">
                            <input type="text" id="nameInput" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Nguyen Van A">
                        </div>
                    </form>
                    <hr>
                    <form id="emailSearchForm" onsubmit="return false;">
                        <div class="input-group mb-3">
                            <input type="text" id="emailInput" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="abc@example.com">
                        </div>
                    </form>
                </div>
            </div>
            <div id="user_list_table" style="height: 250px; overflow: auto">
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

                    <% AccountsDAO accountsDAO = new AccountsDAO();
                        ArrayList<Accounts> allAccounts = accountsDAO.getAllAccounts();
                        session.setAttribute("list_accounts", allAccounts);
                    %>
                    <tbody id="userTableBody">
                        <c:if test="${list_accounts != null}">
                            <c:forEach var="accounts" items="${list_accounts}" varStatus="loop">
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td>${accounts.firstName} ${accounts.lastName}</td>
                                    <td>${accounts.sex}</td>
                                    <td>${accounts.getPhone()}</td>
                                    <td>${accounts.email}</td>
                                    <td>${accounts.role}</td>
                                    <td id="AccountStatus">
                                        <c:if test="${accounts.accountStatus == 'active'}">
                                            <form action="toggleuser" method="post">
                                                <input type="hidden" value="${accounts.email}" name="email">
                                                <input type="hidden" value="${accounts.accountStatus}" name="status">
                                                <button value="active" type="submit" class="btn btn-success" onclick="return window.confirm('Bạn có chắc muốn khóa tài khoản người này?')">Active</button>
                                            </form>
                                        </c:if>
                                        <c:if test="${accounts.accountStatus == 'blocked'}">
                                            <form action="toggleuser" method="post">
                                                <input type="hidden" value="${accounts.email}" name="email">
                                                <input type="hidden" value="${accounts.accountStatus}" name="status">
                                                <button value="blocked" type="submit" class="btn btn-danger" onclick="return window.confirm('Bạn có chắc muốn mở khóa tài khoản người này?')">Blocked</button>
                                            </form>
                                        </c:if>
                                    </td>
                                    <td>
                                        <form action="petdetail" method="get">
                                            <input type="hidden" value="${accounts.email}" name="email">
                                            <button type="button" class="btn btn-outline-primary detail-button" data-email="${accounts.email}">Xem chi tiết</button>
                                        </form>
                                    </td>
                                </tr>            
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
            </div>
            <div id="foot">
                <%@include file="footer.jsp" %>
            </div>

        </div>


        <!--    <script>
        // Bắt sự kiện khi người dùng click vào nút "Xem chi tiết"
        document.addEventListener("DOMContentLoaded", function() {
            const detailButtons = document.querySelectorAll(".detail-button");
        
            detailButtons.forEach(button => {
                button.addEventListener("click", function() {
                    const email = button.dataset.email; // Lấy giá trị email từ trường data-email của nút
                    window.location.href = "petdetail?email=" + email; // Chuyển hướng đến trang "petdetail" với tham số email
                });
            });
        });
            </script>-->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const nameInput = document.getElementById("nameInput");
                const emailInput = document.getElementById("emailInput");
                const nameSearchForm = document.getElementById("nameSearchForm");
                const emailSearchForm = document.getElementById("emailSearchForm");
                const userTableBody = document.getElementById("userTableBody").getElementsByTagName("tr");

                let activeSearchInput = nameInput; // Biến để theo dõi thanh tìm kiếm đang được sử dụng

                // Hàm ẩn đi thanh tìm kiếm không được chọn và hiển thị thanh tìm kiếm đang được sử dụng
                function toggleSearchInput(activeInput, inactiveInput) {
                    activeInput.parentElement.style.display = ""; // Hiển thị thanh tìm kiếm đang được sử dụng
                    // inactiveInput.parentElement.style.display = "none"; // Loại bỏ dòng này để không ẩn thanh tìm kiếm không được sử dụng
                }

                // Hàm lọc và sắp xếp các hàng trong bảng dựa trên từ khóa tìm kiếm
                function filterAndSort() {
                    const keyword = activeSearchInput.value.trim().toUpperCase();

                    for (let i = 0; i < userTableBody.length; i++) {
                        const rowData = userTableBody[i].textContent.trim().toUpperCase();
                        if (rowData.includes(keyword)) {
                            userTableBody[i].style.display = ""; // Hiển thị hàng nếu chứa từ khóa tìm kiếm
                        } else {
                            userTableBody[i].style.display = "none"; // Ẩn hàng nếu không chứa từ khóa tìm kiếm
                        }
                    }
                }

                // Bắt sự kiện khi người dùng chọn thanh tìm kiếm tên
                nameInput.addEventListener("focus", function () {
                    activeSearchInput = nameInput;
                    toggleSearchInput(nameInput, emailInput); // Chọn thanh tìm kiếm tên, ẩn thanh tìm kiếm email
                    filterAndSort(); // Lọc và sắp xếp dữ liệu dựa trên thanh tìm kiếm tên
                });

                // Bắt sự kiện khi người dùng chọn thanh tìm kiếm email
                emailInput.addEventListener("focus", function () {
                    activeSearchInput = emailInput;
                    toggleSearchInput(emailInput, nameInput); // Chọn thanh tìm kiếm email, ẩn thanh tìm kiếm tên
                    filterAndSort(); // Lọc và sắp xếp dữ liệu dựa trên thanh tìm kiếm email
                });

                // Bắt sự kiện khi người dùng gõ vào thanh tìm kiếm
                nameInput.addEventListener("input", filterAndSort);
                emailInput.addEventListener("input", filterAndSort);
            });
            document.addEventListener("DOMContentLoaded", function () {
                const detailButtons = document.querySelectorAll(".detail-button");

                detailButtons.forEach(button => {
                    button.addEventListener("click", function () {
                        const email = button.dataset.email; // Lấy giá trị email từ trường data-email của nút
                        const detailDiv = document.getElementById(`hiddendetail_${email}`);
                        if (detailDiv.style.display === "block") {
                            detailDiv.style.display = "none";
                        } else {
                            detailDiv.style.display = "block";
                        }
                    });
                });
            });
///////////////////////
            document.addEventListener("DOMContentLoaded", function () {
    const detailButtons = document.querySelectorAll(".detail-button");
    detailButtons.forEach(button => {
        button.addEventListener("click", function () {
            const email = button.dataset.email; // Lấy giá trị email từ trường data-email của nút
            const url = "petdetail?email=" + email; // Tạo URL cho trang petdetail với tham số email
            const options = "width=800,height=600";

            window.open(url, "popup", options); // Mở cửa sổ mới với URL và tùy chọn đã chỉ định
        });
    });
});




        </script>
    </body>
</html>
