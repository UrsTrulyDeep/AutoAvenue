<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="all_js_css.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Driver Information</title>
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
            max-width: 900px;
            width: 900px;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 12px;
			margin-top: 7px;
        }
        input[type="text"],
	    input[type="password"],
	    input[type="email"],
	    input[type="tel"]  {
            width: 100%;
            padding: 12px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #4caf50;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #45a049;
        }
        
    </style>
</head>
<body>
    <div class="form-group">
        <%@include file="navbar.jsp" %>
        <br>
        <h2>Update Driver Information</h2>
        <form action="DriverInfoUpdateServlet" method="post">
            <!-- Form fields... -->
			<div class="row">
                <label for="updatedDriverName" class="col-sm-2 col-form-label">Name:</label>
                <div class="col-sm-10">
                    <input type="text" id="updatedDriverName" name="updatedDriverName" required class="form-control" placeholder="Driver Name">
                </div>
            </div>
            <div class="row">
                <label for="updatedDriverContact" class="col-sm-2 col-form-label">Contact:</label>
                <div class="col-sm-10">
                    <input type="text" id="updatedDriverContact" name="updatedDriverContact" required class="form-control" placeholder="Contact Number">
                </div>
            </div>
            <div class="row">
                <label for="driverEmail" class="col-sm-2 col-form-label">Email:</label>
                <div class="col-sm-10">
                    <input type="email" id="driverEmail" name="driverEmail" required class="form-control" placeholder="Email">
                </div>
            </div>
            <div class="row">
                <label for="driverPassword" class="col-sm-2 col-form-label">Password:</label>
                <div class="col-sm-10">
                    <input type="password" id="driverPassword" name="driverPassword" required class="form-control" placeholder="Password">
                </div>
            </div>

            <button type="submit"><i class="fas fa-sync-alt"></i> Update Info</button>
        </form>
    </div>
</body>
</html>
