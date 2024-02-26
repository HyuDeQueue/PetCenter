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
        <h1>Thông tin thú cưng</h1>
        <form action="addpet" method="post">
            <input type="hidden" name="ownerEmail" value="${loggedInAccount.email}">
            <p>Tên thú cưng: <input type="text" name="petname" required="true"></p>
            <p>Giới tính thú cưng:
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="petSex" id="inlineRadio1" checked value="Đực" required>
                    <label class="form-check-label" for="inlineRadio1">Đực</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="petSex" id="inlineRadio2" value="Cái" required>
                    <label class="form-check-label" for="inlineRadio2">Cái</label>
                </div>
            </p>
            Loại thú cưng: <select name="pettype" required>
            <option value="Chó" selected>Chó</option>
            <option value="Mèo">Mèo</option>
            <option value="Khác" selected="true">Khác</option>
        </select> <br>
            Cân nặng: <input type="number" step="0.01" name="petweight" required> <br>
            Chiều dài: <input type="number" step="0.01" name="petlength" required> <br>
            Chiều cao: <input type="number" step="0.01" name="petheight" required> <br>
            Tính cách thú cưng: <input type="text" name="petBehavior" placeholder="Không bắt buộc"> <br>
            Đồ ăn ưa thích: <input type="text" name="petFavFood" placeholder="Không bắt buộc"> <br>
            <input type="submit" class='btn btn-success' value="Thêm thú cưng" />
            <c:if test="${erroraddpetmsg != null}"><p style="color: red; font-weight: bold; font-size: 110%; text-align: center; background-color: yellow">${erroraddpetmsg}</p></c:if>
        </form>
    </div>
    <div id="foot"><%@include file="footer.jsp" %></div>
</div>
</body>
</html>