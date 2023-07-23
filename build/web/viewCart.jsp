<%-- 
    Document   : viewCart
    Created on : Jun 16, 2023, 11:16:53 AM
    Author     : louis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.shopping.Laptop"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
        <h1><span class="blue">&lt;</span>BUG<span class="blue">&gt;</span> <span class="yellow">Store</span></h1>
      
        <h1>Cart</h1>
        <c:if test="${sessionScope.CART != null}">
            <table class="container">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Edit</th>
                        <th>Remove</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="cart" value="${sessionScope.CART}"/>
                    <c:forEach var="laptop" varStatus="counter" items="${cart.cart.values()}">
                        <c:set var="total" value="${total + laptop.getPrice() * laptop.getQuantity()}"/>
                    <form action="MainController" method="POST">
                        <tr>
                            <td>${counter.count}</td>
                            <td>
                                ${laptop.getId()}
                                <input type="hidden" name="id" value="${laptop.getId()}"/>
                            </td>
                            <td>${laptop.getName()}</td>
                            <td>${laptop.getPrice()}$</td>
                            <td>
                                <input type="number" name="quantity" value="${laptop.getQuantity()}" required="" min="1"/>
                            </td>
                            <td>
                                <input type="submit" name="action" value="Edit"/>
                            </td>
                            <td>
                                <input type="submit" name="action" value="Remove"/>
                            </td>
                            <td>${laptop.getPrice() * laptop.getQuantity()}</td>
                        </tr>
                    </form>
                </c:forEach>

            </tbody>
        </c:if>
    </table>
    <h1>Total: ${total}</h1>
    <c:if test="${sessionScope.CART == null}"><h2>Empty Order!!</h2></c:if>
        <h2><a href="MainController?action=shopping"><button style="font-size: 25px" class="button">Continue Shopping</button></a></h2>
    <c:if test="${sessionScope.CART != null}">
        <h2><a href="checkout.jsp"><button style="font-size: 25px" class="button">Order Now</button></a></h2>
    </c:if>
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
        padding-left:1%;
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