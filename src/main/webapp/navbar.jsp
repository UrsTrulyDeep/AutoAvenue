<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.autoavenue.model.User" %>
<%@ page import="com.autoavenue.model.Driver" %>
<%
    // Get the current page path
    String currentPage = request.getServletPath();
    
    // Retrieve logged-in user and driver from session
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    Driver loggedInDriver = (Driver) session.getAttribute("loggedInDriver");
%>

<!-- Navigation Bar -->
<div class="background" style="background-color: darkblue">
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="index.jsp">
            Urban Hitch
        </a>
        <!-- Navbar Toggler for Responsive Design -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Navbar Items -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <!-- Help Link -->
                <li class="nav-item active">
                    <a class="nav-link blue" href="#">Help<span class="sr-only">(current)</span></a>
                </li>
                <!-- Register and Login Links (if not logged in) -->
                <% if ((loggedInUser == null && loggedInDriver == null) && (currentPage.equals("/index.jsp") || currentPage.equals("/userRegistration.jsp") || currentPage.equals("/driverRegistration.jsp") || currentPage.equals("/userLogin.jsp") || currentPage.equals("/driverLogin.jsp") || currentPage.equals("/registrationSuccess.jsp") || currentPage.equals("/driverRegistrationSuccess.jsp"))) { %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="registerDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Register
                        </a>
                        <div class="dropdown-menu" aria-labelledby="registerDropdown">
                            <a class="dropdown-item" href="userRegistration.jsp"><span class="text-primary">User Register</span></a>
                            <a class="dropdown-item" href="driverRegistration.jsp"><span class="text-primary">Driver Register</span></a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="loginDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Login
                        </a>
                        <div class="dropdown-menu" aria-labelledby="loginDropdown">
                            <a class="dropdown-item" href="userLogin.jsp"><span class="text-primary">User Login</span></a>
                            <a class="dropdown-item" href="driverLogin.jsp"><span class="text-primary">Driver Login</span></a>
                        </div>
                    </li>
                <% } %>
                <!-- User-specific Links (if logged in as a user) -->
                <% if ((loggedInUser != null) && !( (currentPage.equals("/index.jsp") || currentPage.equals("/userRegistration.jsp") || currentPage.equals("/driverRegistration.jsp") || currentPage.equals("/userLogin.jsp") || currentPage.equals("/driverLogin.jsp")))) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="userDashboard.jsp">User Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="userBookingHistory.jsp">Booking History</a>
                    </li>
                <% } else if (loggedInDriver != null) { %>
                    <!-- Driver-specific Links (if logged in as a driver) -->
                    <li class="nav-item">
                        <a class="nav-link" href="driverDashboard.jsp">Driver Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="driverInfoUpdate.jsp">Update Information</a>
                    </li>
                <% } %>
            </ul>
        </div>
    </nav>
</div>
