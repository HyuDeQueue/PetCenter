<%-- 
    Document   : addpet
    Created on : Jan 19, 2024, 3:38:07 PM
    Author     : Windows 10
--%>

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
            }   
            #foot{
                margin-top: 2%;
            }
        </style>
    </head>
    <body>
        <div id="website-width">
            <%@include file="about.jsp" %>
        <h1>Add Pet</h1>
        <form action="addpet" method="post">
            <input type="hidden" name="ownerEmail" value="${loggedInAccount.email}">
            <p>Tên thú cưng: <input type="text" name="petname" required="true"></p>
            <p>Giới tính thú cưng:
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="petSex" id="inlineRadio1" value="Đực" required>
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
        </form>
        <div id="foot"><%@include file="footer.jsp" %></div>
        </div>
    </body>
</html>
