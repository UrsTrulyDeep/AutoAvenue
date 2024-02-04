
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Booking Failure</title>
    <%@include file="all_js_css.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            max-width: 600px;
            width: 100%;
        }
        h1 {
            color: #dc3545;
        }
        .lead {
            font-size: 18px;
            color: #555;
            margin-bottom: 20px;
        }
        .text-danger {
            color: #dc3545;
        }
        .error-message {
            color: #dc3545;
            font-size: 18px;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            font-weight: 400;
            color: #007bff;
            text-align: center;
            vertical-align: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            background-color: transparent;
            border: 1px solid #007bff;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            border-radius: 0.25rem;
            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out;
            text-decoration: none;
        }
        .btn-outline-primary {
            color: #007bff;
            background-color: transparent;
            border-color: #007bff;
        }
        .btn-outline-primary:hover {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card shadow bg-white py-5 text-center">
            <h1 class="text-danger"><i class="fas fa-exclamation-circle"></i> Booking Failure</h1>
            <p class="lead">Sorry, we couldn't process your booking request at the moment.</p>
            <p>Please check the provided source and destination locations and try again.</p>
            <p class="error-message">${requestScope.bookingError}</p> <!-- Display the error message -->
            <a href="cabBooking.jsp" class="btn btn-outline-primary"><i class="fas fa-redo-alt"></i> Try Again</a>
        </div>
    </div>
</body>
</html>
