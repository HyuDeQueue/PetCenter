<%-- 
    Document   : signin
    Created on : Jan 19, 2024, 12:19:26 PM
    Author     : Windows 10
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/stylelogin.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <style>
    </style>
    <body>
        <div id="bg"></div>
        <a href="Home" class="btn btn-warning" style="position: absolute; top: 10px; left: 10px;">Back to Homepage</a>
        <form action="signin" method="post">
          <div class="form-field">
              <input type="text" name="email" placeholder="Email" required/>
          </div>

          <div class="form-field">
            <input type="password" name="password" placeholder="Password" required/>                         
          </div>

          <div class="form-field">
            <button class="btn" type="submit">Log in</button>
          </div>
            <c:if test="${errorloginmsg != null}"><p style="color: red; font-weight: bold; font-size: 110%; text-align: center; background-color: yellow">${errorloginmsg}</p></c:if>
             <p id="signup">Not a user? <a href="signup">Sign up</a></p>
        </form>
        
    </body>
</html>
