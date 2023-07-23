<%-- 
    Document   : user
    Created on : May 30, 2023, 10:32:21 AM
    Author     : louis
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
        <form action="MainController" method="POST">
            <input class="button" type="submit" name="action" value="Logout"/>
        </form>
        <h2>User's information:</h2></br>
        <h4>User ID: ${sessionScope.LOGIN_USER.userID}</h4>
        <h4>Full Name: ${sessionScope.LOGIN_USER.fullName}</h4>
        <h4>Role ID: ${sessionScope.LOGIN_USER.roleID}</h4>
        <button class="button"><a style="text-decoration: none; font-size: 25px; color: black;" href="MainController?action=shopping">Shopping page</a></button>
    </body>
</html>

<style>
    html,
    body {
        height: 100%;
        text-align: center;
        color: #cccccc;
    }

    body {
        margin: 0;
        background: linear-gradient(45deg, #49a09d, #5f2c82);
        font-family: sans-serif;
        font-weight: 100;
    }

    .container {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    table {
        width: 500px;
        border-collapse: collapse;
        overflow: hidden;
        box-shadow: 0 0 20px rgba(0,0,0,0.1);
    }

    th,
    td {
        padding: 15px;
        background-color: rgba(255,255,255,0.2);
        color: #fff;
    }

    th {
        text-align: left;
    }

    thead {
        th {
            background-color: #55608f;
        }
    }

    tbody {
        tr {
            &:hover {
                background-color: rgba(255,255,255,0.3);
            }
        }
        td {
            position: relative;
            &:hover {
                &:before {
                    content: "";
                    position: absolute;
                    left: 0;
                    right: 0;
                    top: -9999px;
                    bottom: -9999px;
                    background-color: rgba(255,255,255,0.2);
                    z-index: -1;
                }
            }
        }
    }
    input{
        background-color: #ffffff05;
        color: white;
        border-width: 2px;
        font-size: 15px;
        border-color: rgba(0,0,0,0.1);
    }
    #searchBox{
        color: white;
        height: 25px;
        width: 250px;
        border-radius: 5px;
    }
    #search{
        margin: 20px 0px;
    }
    #searchButton{
        font-size: 16px;
        border-radius: 5px;
        color: #cccccc;
        height: 25px;
    }
    ::placeholder{
        color: #cccccc;
    }
    .button {
        background-color: #FFF842;
        border: none;
        color: black;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 16px;
        font-size: 25px;
        color: black;
    }
</style>