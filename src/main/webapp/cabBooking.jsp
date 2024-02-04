<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="all_js_css.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Urban Hitch - Cab Booking</title>
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
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        p {
            color: #555;
            margin-bottom: 30px;
            font-size: 18px;
            line-height: 1.6;
            text-align: center;
        }
        form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px 0;
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        label {
            display: block;
            margin-bottom: 12px;
            text-align: left;
            font-weight: bold;
            color: #333;
        }
        input {
            width: 100%;
            padding: 12px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #007bff;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }
        button:hover {
            background-color: #0056b3;
        }
        .fa-taxi {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp" %>
    <br>
    <h2><i class="fas fa-taxi"></i> Ride with Urban Hitch</h2>
    <p>Experience convenience and luxury with Urban Hitch. <br>
    Book a premium cab for a seamless journey to your destination. <br>
    Your comfort is our priority.</p>
    <form action="BookingController" method="post">
        <label for="sourceLocation">Source:</label>
        <input type="text" id="sourceLocation" name="sourceLocation" required>
        <label for="destinationLocation">Destination:</label>
        <input type="text" id="destinationLocation" name="destinationLocation" required>
        <button type="submit"><i class="fas fa-taxi"></i> Book Your Ride</button>
    </form>
</body>
</html>
