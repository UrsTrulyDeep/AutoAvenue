<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
    <%@include file="all_js_css.jsp"%>
    <!-- You can include additional CSS styles if needed -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-group {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            max-width: 600px;
            width: 100%;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .success-message {
            color: #28a745;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .icon-check {
            color: #28a745;
            font-size: 36px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="form-group">
     <%@include file="navbar.jsp" %>
        <br>
        <div class="icon-check">&#10004;</div>
        <h2 class="success-message">Registration Successful</h2>
        <p>Your account has been successfully registered.</p>
        <!-- You can provide additional information or links here -->
        <p><a href="driverLogin.jsp">Login to your account</a></p>
    </div>
</body>
</html>