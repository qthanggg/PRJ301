<%--
    Document   : shopping
    Created on : Jun 16, 2023, 10:30:48 AM
    Author     : louis
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Page</title>
    </head>
    <body>
        <h1><span class="blue">&lt;</span>BUG<span class="blue">&gt;</span> <span class="yellow">Store</span></h1>
        
        <h2>
            <form action="MainController" method="POST">
                <input class="button" style="font-size: 25px" type="submit" name="action" value="View Cart"/>
            </form>
        </h2>
        <h2>${sessionScope.MESSAGE}</h2>
        <c:remove var="MESSAGE" scope="session"></c:remove>
            <h1>List of Laptop</h1>

            <table class="container">
                <thead>
                    <tr>
                        <th>Product Code</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="laptop" items="${requestScope.LIST_LAPTOP}">
                <form action="MainController" method="POST">
                    <tr>
                        <td>${laptop.id}</td>
                        <td>${laptop.name}</td>
                        <td>${laptop.price}</td>
                        <td>
                            <select name="quantity">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="10">10</option>
                            </select>
                        </td>
                        <td>
                            <input type="hidden" name="id" value="${laptop.id}"/>
                            <input type="hidden" name="name" value="${laptop.name}"/>
                            <input type="hidden" name="price" value="${laptop.price}"/>
                            <input type="submit" name="action" value="Add"/>
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>

<style>
    body {
        font-family: 'Open Sans', sans-serif;
        font-weight: 300;
        line-height: 1.42em;
        color:#A7A1AE;
        background-color:#1F2739;
    }

    h1 {
        font-size:3em;
        font-weight: 300;
        line-height:1em;
        text-align: center;
        color: #4DC3FA;
    }

    h2 {
        font-size:1em;
        font-weight: 300;
        text-align: center;
        display: block;
        line-height:1em;
        padding-bottom: 2em;
        color: #FB667A;
    }

    h2 a {
        font-weight: 700;
        text-transform: uppercase;
        color: #FB667A;
        text-decoration: none;
    }

    .blue {
        color: #185875;
    }
    .yellow {
        color: #FFF842;
    }

    .container th h1 {
        font-weight: bold;
        font-size: 1em;
        text-align: left;
        color: #185875;
    }

    .container td {
        font-weight: normal;
        font-size: 1em;
        -webkit-box-shadow: 0 2px 2px -2px #0E1119;
        -moz-box-shadow: 0 2px 2px -2px #0E1119;
        box-shadow: 0 2px 2px -2px #0E1119;
    }

    .container {
        text-align: left;
        overflow: hidden;
        width: 80%;
        margin: 0 auto;
        display: table;
        padding: 0 0 8em 0;
    }

    .container td, .container th {
        padding-bottom: 2%;
        padding-top: 2%;
        padding-left:2%;
    }

    /* Background-color of the odd rows */
    .container tr:nth-child(odd) {
        background-color: #323C50;
    }

    /* Background-color of the even rows */
    .container tr:nth-child(even) {
        background-color: #2C3446;
    }

    .container th {
        background-color: #1F2739;
    }

    .container td:first-child {
        color: #FB667A;
    }

    .container tr:hover {
        background-color: #464A52;
        -webkit-box-shadow: 0 6px 6px -6px #0E1119;
        -moz-box-shadow: 0 6px 6px -6px #0E1119;
        box-shadow: 0 6px 6px -6px #0E1119;
    }

    .container td:hover {
        background-color: #FFF842;
        color: #403E10;
        font-weight: bold;

        box-shadow: #7F7C21 -1px 1px, #7F7C21 -2px 2px, #7F7C21 -3px 3px, #7F7C21 -4px 4px, #7F7C21 -5px 5px, #7F7C21 -6px 6px;
        transform: translate3d(6px, -6px, 0);

        transition-delay: 0s;
        transition-duration: 0.4s;
        transition-property: all;
        transition-timing-function: line;
    }

    @media (max-width: 800px) {
        .container td:nth-child(4),
        .container th:nth-child(4) {
            display: none;
        }
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
    }
</style>