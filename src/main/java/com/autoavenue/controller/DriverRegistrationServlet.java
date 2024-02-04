package com.autoavenue.controller;

import com.autoavenue.model.Driver;
import com.autoavenue.service.DriverService;
import com.autoavenue.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DriverRegistrationServlet")
public class DriverRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DriverService driverService;

    public DriverRegistrationServlet() {
        super();
        driverService = new DriverService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String driverName = request.getParameter("driverName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String driverContact = request.getParameter("driverContact");
        String cabNumber = request.getParameter("cabNumber");
        String driverLocation = request.getParameter("driverLocation");

        // Check if the email is already registered as a user
        if (driverService.isEmailAlreadyRegistered(email)) {
        	request.setAttribute("registrationError", "Email already registered. Please use a different email.");
        	request.getRequestDispatcher("driverRegistration.jsp").forward(request, response);
        } else {
            // Proceed with driver registration
        	Driver newDriver = new Driver(driverName, driverContact, cabNumber, email, password, driverLocation);
            driverService.registerDriver(newDriver);
            response.sendRedirect("driverRegistrationSuccess.jsp"); // Redirect 
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect GET requests to the registration page
        response.sendRedirect("driverRegistration.jsp");
    }
}