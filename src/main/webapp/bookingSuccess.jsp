<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Successful</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
            max-width: 400px;
            width: 100%;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        ul {
            list-style: none;
            padding: 0;
        }
        li {
            margin: 15px 0;
            font-size: 18px;
            color: #555;
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
        <div class="icon-check"><i class="fas fa-check-circle"></i></div>
        <div class="success-message">Booking Successful</div>
        <p>Your cab booking has been confirmed. The driver will arrive shortly.</p>
        <p>Booking details:</p>
        <ul>
            <li><strong>Booking ID:</strong> ${requestScope.bookingId}</li>
            <li><strong>Source Location:</strong> ${requestScope.sourceLocation}</li>
            <li><strong>Destination Location:</strong> ${requestScope.destinationLocation}</li>
            <li><strong>Cab Number:</strong> ${requestScope.cabNumber}</li>
            <li><strong>Driver Name:</strong> ${requestScope.driverName}</li>
            <li><strong>Driver Contact:</strong> ${requestScope.driverContact}</li>
            <li><strong>Distance:</strong> ${requestScope.distance} km</li>
            <li><strong>Estimated Time:</strong> ${requestScope.estimatedTime} minutes</li>
            <li><strong>Cost:</strong> ${requestScope.cost} INR</li>
        </ul>
    </div>
</body>
</html>