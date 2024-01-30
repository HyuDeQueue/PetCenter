<%-- 
    Document   : About
    Created on : Jan 17, 2024, 4:57:23 PM
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
        <style>
            body{
                display: flex;
                justify-content: center;
            }
            #website-width{
                width: 70%;
            }
            
            #background_img{
                width: 100%;
/*                filter: brightness(50%);*/
            }
            
            #header{
                padding-right: 0px;
            }
            #about_pettie p{
                font-size: 110%;
                text-align: justify;
                font-family: sans-serif;
                border: 2px wheat double;
                border-radius: 10px;
                margin-top: 2px;
                padding: 10px;
            }
            #about_pettie h1{
                text-align: center;
            }
        </style>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    </head>
    <body>
        <div class="">
                <div class="col-md-12" id="header"><%@include file="header.jsp" %></div>
                <img id="background_img" src="resource/image/background3.jpg" alt="background">
            </div>
            
    </body>
</html>
