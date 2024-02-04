<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="all_js_css.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <!-- Add your CSS styles here if needed -->
    <style>
        /* Your styles go here */
        .error-message {
            color: red;
            margin-top: 10px;
        }
        /* Additional Styles for Consistency */
        /* Add your additional styles here */
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
            max-width: 700px;
            width: 700px;
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
        input[type="email"],
        input[type="password"] {
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
    <!-- JavaScript to clear URL parameters after displaying the warning -->
    <script>
        // Function to clear URL parameters
        function clearUrlParams() {
            if (window.history.replaceState) {
                var urlWithoutParams = window.location.pathname + window.location.hash;
                window.history.replaceState(null, null, urlWithoutParams);
            }
        }
        // Clear URL parameters on page load
        clearUrlParams();
    </script>
</head>
<body>
    <div class="form-group">
     <%@include file="navbar.jsp" %>
        <br>
        <h2>User Login</h2>
        
        <!-- User Login Form -->
        <form action="UserLoginServlet" method="post">
            <!-- Email Input -->
            <div class=" row">
                <label for="email" class="col-sm-2 col-form-label">Email:</label>
                <div class="col-sm-10">
                    <input type="email" id="email" name="email" required class="form-control" placeholder="Email">
                </div>
            </div>
            
            <!-- Password Input -->
            <div class=" row">
                <label for="password" class="col-sm-2 col-form-label">Password:</label>
                <div class="col-sm-10">
                    <input type="password" id="password" name="password" required class="form-control" placeholder="Password">
                </div>
            </div>
            
            <!-- Display the warning message only after a login attempt -->
            <p class="error-message">
                <% 
                if (request.getParameter("error") != null) {
                    out.println("Invalid email or password. Please try again.");
                } 
                %>
            </p>
            
            <!-- Submit Button -->
            <button type="submit"><i class="fas fa-sign-in-alt"></i> Login</button>
        </form>
        
        <!-- Registration Link -->
        <p>Don't have an account? <a href="userRegistration.jsp">Register here</a>.</p>
    </div>
</body>
</html>
