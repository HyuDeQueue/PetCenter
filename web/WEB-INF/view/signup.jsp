<%-- 
    Document   : signup
    Created on : Jan 19, 2024, 12:10:53 PM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styleregister.css">
    </head>
    <style>
        form .form-field select {
            font-family: inherit;
            width: 100%;
            outline: none;
            background-color: #fff;
            border-radius: 4px;
            border: none;
            display: block;
            padding: 0.9rem 0.7rem;
            box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.16);
            font-size: 17px;
            color: #4A4A4A;
            /* Add left padding to push text after the image */
            padding-left: 48px;
        }
        form .form-field:nth-child(6)::before {
            background-image: url(resource/image/gender-icon.png);
            width: 16px;
            height: 16px;
        }
    </style>
    <body>
        <div id="bg"></div>
        <a href="Home" class="btn btn-warning" style="position: absolute; top: 10px; left: 10px;">Back to Homepage</a>
        <form action="signup" method="post">
            <div class="form-field">
                <input type="email" name="email" placeholder="Email / Username" required/>
            </div>

            <div class="form-field">
                <input type="password" name="password" placeholder="Password" required/>
            </div>

            <div class="form-field">
                <input type="text" name="firstName" placeholder="First Name" required/>
            </div>

            <div class="form-field">
                <input type="text" name="lastName" placeholder="Last Name" required/>
            </div>

            <div class="form-field">
                <input type="tel" name="phoneNumber" placeholder="Phone Number" required pattern="0\d{9}" title="Vui lòng nhập số điện thoại theo quy chuẩn (10 số)"/>
            </div>

            <div class="form-field">
                <select name="user_sex" required>
                    <option value="" disabled selected>Select Sex</option>
                    <option value="Male">Nam</option>
                    <option value="Female">Nữ</option>
                    <option value="Other">Giới tính khác</option>
                </select>
            </div>

            <div class="form-field">
                <button class="btn" type="submit">Register</button>
            </div>
            <c:if test="${errorsignupmsg != null}"><p style="color: red; font-weight: bold; font-size: 110%; text-align: center; background-color: yellow">${errorsignupmsg}</p></c:if>
            <p id="signin">Already a user? <a href="signin">Sign in</a></p>
        </form>
    </body>
</html>
