<%-- 
    Document   : admin
    Created on : May 30, 2023, 10:32:07 AM
    Author     : louis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.apache.catalina.User"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <h1 style="color: #cccccc">Welcome: ${sessionScope.LOGIN_USER.fullName} <button class="button"><a style="text-decoration: none; color: black;" href="${logoutLink}">Logout</a></button></h1>
        <c:url var="logoutLink" value="MainController">
            <c:param name="action" value="Logout"></c:param>
        </c:url>
        

        <div id="search">
            <form action="MainController" method="POST">
                <input id="searchBox" type="text" name="search" value="${param.search}" placeholder="Search name of user"/>
                <input id="searchButton" type="submit" name="action" value="Search"/>
            </form>
        </div>

        <c:if test="${requestScope.LIST_USER != null}">
            <c:if test="${not empty requestScope.LIST_USER}">
                <div class="container">
                    <table border="1"">
                        <thead>
                            <tr>
                                <th style="background-color: #55608f;">NO</th>
                                <th style="background-color: #55608f;">User ID</th>
                                <th style="background-color: #55608f;">Full Name</th>
                                <th style="background-color: #55608f;">Role ID</th>
                                <th style="background-color: #55608f;">Password</th>
                                <th style="background-color: #55608f;">Update</th>
                                <th style="background-color: #55608f;">Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                            <form action="MainController" method="POST">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td><input type="text" name="userID" value="${user.userID}" readonly=""/></td>
                                    <td><input type="text" name="fullName" value="${user.fullName}" required=""/></td>
                                    <td><input type="text" name="roleID" value="${user.roleID}"/></td>
                                    <td>${user.password}</td>
                                    <td>
                                        <input style="background-color: #55608f; color: white; font-size: 15px; border-color: rgba(0,0,0,0.1);" type="submit" name="action" value="Update"/>
                                        <input type="hidden" name="search" value="${param.search}"/>
                                    </td>
                                    <td>
                                        <c:url var="deleteLink" value="MainController">
                                            <c:param name="action" value="Delete"></c:param>
                                            <c:param name="userID" value="${user.userID}"></c:param>
                                            <c:param name="search" value="${param.search}"></c:param>
                                        </c:url>
                                        <button style="background-color: #55608f; color: white; font-size: 15px; border-width: 1px; border-color: rgba(0,0,0,0.1);"><a style="text-decoration: none; color: white;" href="${deleteLink}">Delete</a></button>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

            </c:if>

        </c:if>
        ${requestScope.ERROR}

    </body>
</html>

<style>
    html,
    body {
        height: 100%;
        text-align: center;
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
        border-color: black;
        border-top-width: 3px;
    }
    #search{
        margin: 20px 0px;
    }
    #searchButton{
        font-size: 16px;
        border-radius: 5px;
        color: #cccccc;
        height: 25px;
        border-color: black;
        border-top-width: 3px;
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