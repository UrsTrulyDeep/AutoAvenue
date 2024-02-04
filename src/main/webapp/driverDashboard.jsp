<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="all_js_css.jsp"%>
<%@ page import="com.autoavenue.model.Driver" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Dashboard</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px 0;
            text-align: center;
            max-width: 800px;
            width: 100%;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            color: #555;
        }
        ul {
            list-style: none;
            padding: 0;
        }
        li {
            margin: 15px 0;
            font-size: 18px;
            color: #007bff; /* Link color */
        }
        li a {
            text-decoration: none;
            color: #007bff; /* Link color */
        }
        .feature {
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #007bff;
            border-radius: 5px;
            padding: 10px;
            margin: 10px 0;
            transition: background-color 0.3s;
        }
        .feature:hover {
            background-color: #007bff;
            color: #fff;
        }
        .logout-btn {
            background-color: #dc3545;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }
        .logout-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="container">
     <%@include file="navbar.jsp" %>
        <br>
        <h2>Welcome <%= ((Driver) session.getAttribute("loggedInDriver")).getDriverName() %></h2>
        <p>Explore the features below:</p>
        <div class="feature">
            <a href="#" style="text-decoration: none; color: inherit;">View Recent Bookings</a>
        </div>
        <div class="feature">
            <a href="driverInfoUpdate.jsp" style="text-decoration: none; color: inherit;">Update Driver Info</a>
        </div>
        <a class="logout-btn" href="DriverLogoutServlet">Logout</a>
    </div>
</body>
</html>