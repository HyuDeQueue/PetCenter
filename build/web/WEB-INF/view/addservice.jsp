<%-- 
    Document   : addservice.jsp
    Created on : Feb 27, 2024, 4:08:35 PM
    Author     : Windows 10
--%>

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
            }

            .addpet-form {
                width: 70%;
                max-width: 70%;
                height: auto; /* Allow the form to expand vertically */
                padding: 20px; /* Add padding to the form */
                overflow: auto; /* Enable scrolling if content exceeds container */
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

            .form-check {
                margin-bottom: 5px;
            }

            /* Adjust margin-bottom for gender selection */
            .gender-selection {
                margin-bottom: 5px;
            }

            select,
            input[type="number"],
            input[type="text"],
            input[type="submit"] {
                width: calc(100% - 10px); /* Adjust width to fit within container */
                margin-bottom: 10px;
                padding: 5px;
                box-sizing: border-box;
            }
        </style>


</head>
<body>
<div id="website-width">
    <%@include file="about.jsp" %>
    <div class="addpet-form">
        <h1>Thông tin dịch vụ</h1>
        <form action="addservice" method="post">
            <p>Tên dịch vụ: <input type="text" name="servicename" required="true"></p>
            <p>Loại dịch vụ:
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="serviceType" id="inlineRadio1" onchange="toggleInputs()" value="shorttime" required>
                    <label class="form-check-label" for="inlineRadio1">Trong ngày</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="serviceType" id="inlineRadio2" value="longtime" onchange="toggleInputs()" required>
                    <label class="form-check-label" for="inlineRadio2">Dài ngày</label>
                </div>
            </p>
            Giá tiền: <input type="number" name="servicePrice" required min="0" max="9999999"><br>
            <div id="longServiceInputs">
                Chiều dài lồng(cm): <input type="number" step="0.01" name="cagelength" min="0"> <br>
                Chiều rộng lồng(cm): <input type="number" step="0.01" name="cagewidth" min="0"> <br>
                Chiều cao lồng(cm): <input type="number" step="0.01" name="cageheight" min="0"> <br>
            </div>
            <input type="submit" class="btn btn-success" value="Thêm dịch vụ" />
        </form>
    </div>
    <div id="foot"><%@include file="footer.jsp" %></div>
</div>
<script>
        function toggleInputs() {
            var shortRadio = document.getElementById("inlineRadio1");
            var inputGroup = document.getElementById("longServiceInputs");

            if (shortRadio.checked) {
                // Ẩn inputGroup khi chọn dịch vụ trong ngày
                inputGroup.style.display = "none";
            } else {
                // Hiển thị inputGroup khi chọn dịch vụ dài ngày
                inputGroup.style.display = "block";
            }
        }
    </script>
</body>
</html>
