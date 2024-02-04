<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="all_js_css.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title> 
    <!-- Internal Styles -->
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
            max-width: 700px;
            width: 800px;
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
    
        /* Warning message styling */
        .warning-message {
            color: red;
            text-align: center;
            margin-top: 12px;
        }
        /* Center-align the "Already have an account?" text */
        .already-have-account {
            text-align: center;
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
        <!-- Include the common navigation bar -->
        <%@include file="navbar.jsp" %>
        <br>
        <h2>User Registration</h2>
        <form action="UserRegistrationServlet" method="post">
            <!-- Form Fields -->
            <div class=" row">
                <label for="userName" class="col-sm-2 col-form-label">Name:</label>
                <div class="col-sm-10">
                     <input type="text" id="userName" name="userName"  required class="form-control" placeholder="Name">
                </div>
            </div>
            <div class=" row">
                <label for="email" class="col-sm-2 col-form-label">Email:</label>
                <div class="col-sm-10">
                    <input type="email" id="email" name="email" required class="form-control" placeholder="Email">
                </div>
            </div>
            <div class=" row">
                <label for="password" class="col-sm-2 col-form-label">Password:</label>
                <div class="col-sm-10">
                    <input type="password" id="password" name="password" required class="form-control" placeholder="Password">
                </div>
            </div>
            <div class=" row">
               <label for="userContact" class="col-sm-2 col-form-label">Contact:</label>
                <div class="col-sm-10">
                    <input type="tel" id="userContact" name="userContact" pattern="[0-9]{11}" required class="form-control" placeholder="Mobile Number (4 digits):">
                </div>
            </div>
            
            <!-- Warning Message Section -->
            <div class="warning-message">
                <p style="color: red;">
                    <% if (request.getAttribute("registrationError") != null) {
                        out.println(request.getAttribute("registrationError"));
                    } %>
                </p>
            </div>
            
            <!-- Submit Button -->
            <button type="submit"><i class="fas fa-user-plus"></i> Register</button>
        </form>
        
        <!-- Already Have an Account Section -->
        <div class="already-have-account">
            <p>Already have an account? <a href="userLogin.jsp">Login here</a>.</p>
        </div>
    </div>
</body>
</html>
