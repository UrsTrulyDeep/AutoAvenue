package com.autoavenue.controller;

import com.autoavenue.model.User;
import com.autoavenue.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserRegistrationServlet")
public class UserRegistrationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserService userService;

	// Constructor to initialize the UserService
	public UserRegistrationServlet() {
		super();
		userService = new UserService();
	}

	// Handle POST requests for user registration
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve user registration details from the request parameters
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String userContact = request.getParameter("userContact");

		try {
			// Check if the email is already registered
			if (userService.isEmailAlreadyRegistered(email)) {
				// If email is already registered, set an error attribute and forward to
				// registration page
				request.setAttribute("registrationError", "Email is already registered. Please use a different email.");
				request.getRequestDispatcher("userRegistration.jsp").forward(request, response);
			} else {
				// Create a new User object and register the user
				User user = new User(userName, password, email, userContact);
				userService.registerUser(user);
				// Redirect to the registration success page
				response.sendRedirect("registrationSuccess.jsp");
			}
		} catch (Exception e) {
			// Handle exceptions by printing the stack trace and setting an error attribute
			e.printStackTrace();
			request.setAttribute("registrationError", "Registration failed. Please try again.");
			request.getRequestDispatcher("userRegistration.jsp").forward(request, response);
		}
	}

	// Handle GET requests by redirecting to the user registration page
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("userRegistration.jsp");
	}
}
