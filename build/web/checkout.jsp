<%-- 
    Document   : checkout
    Created on : Jul 7, 2023, 5:17:06 PM
    Author     : Louis Kien
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Check Out</title>
        <style type="text/css">
            table {
                border: 0;
            }
            table td {
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <h1><span class="blue">&lt;</span>BUG<span class="blue">&gt;</span> <span class="yellow">Store</span></h1>
        
        <div align="center">
            <h1>Checkout</h1>

            <c:if test="${sessionScope.CART != null}">
                <table class="container">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="cart" value="${sessionScope.CART}"/>
                        <c:forEach var="laptop" varStatus="counter" items="${cart.cart.values()}">
                            <c:set var="total" value="${total + laptop.getPrice() * laptop.getQuantity()}"/>
                            <tr>
                                <td>${laptop.getName()}</td>
                                <td>${laptop.getPrice()}$</td>
                                <td>${laptop.getQuantity()}</td>
                                <td>${laptop.getPrice() * laptop.getQuantity()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </c:if>
            </table>
            <h3>Total product price: ${total} $</h3>
            <h3>Shipping fee: 10 $</h3>
            <h1>Total Order: ${total + 10} $</h1>
            <div style="margin-left: 31%" id="paypal-payment-button"></div>
            <h2>
                <form action="MainController" method="POST">
                    <input class="button" style="font-size: 25px" type="submit" name="action" value="Back to Cart"/>
                </form>
            </h2>
        </div>
        <script src="https://www.paypal.com/sdk/js?client-id=Ac7kMHZaJoJw3hIlaEXI1VO3WLpTmsOHivGxlRZQbilUXOOibAXSj4YUkVl7Nvx_Kqk-wlCnA0hdtZ9f&disable-funding=credit,card"></script>
        <script>
            paypal.Buttons({
                style: {
                    color: 'blue',
                    shape: 'pill'
                },
                createOrder: function (data, actions) {
                    return actions.order.create({
                        purchase_units: [{
                                amount: {
                                    value: '${total + 10}'
                                }
                            }]
                    });
                },
                onApprove: function (data, actions) {
                    return actions.order.capture().then(function (details) {
                        console.log(details)
                        window.location.replace("http://localhost:8080/PRJ301_T3S2_JSTL/success.html")
                    })
                },
                onCancel: function (data) {
                    window.location.replace("http://localhost:8080/PRJ301_T3S2_JSTL/oncancel.html")
                }
            }).render('#paypal-payment-button');
        </script>
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