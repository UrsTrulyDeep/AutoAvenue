package com.autoavenue.controller;

import com.autoavenue.model.User;
import com.autoavenue.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService;

    public UserLoginServlet() {
        super();
        userService = new UserService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get email and password parameters from the login form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Ensure that your authenticateUser method in UserService returns the correct user object
        User user = userService.authenticateUser(email, password);

        if (user != null) {
            // User is authenticated, store user information in session for future use
            request.getSession().setAttribute("loggedInUser", user);

            // Redirect to the user dashboard with user information included in the URL
            response.sendRedirect("userDashboard.jsp");
        } else {
            // Authentication failed, set the session variable to show the pop-up
            request.getSession().setAttribute("showErrorPopup", true);

            // Redirect to login page with an error message
            response.sendRedirect("userLogin.jsp?error=1");
        }
    }
}
