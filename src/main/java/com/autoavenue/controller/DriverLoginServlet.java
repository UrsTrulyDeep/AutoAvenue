package com.autoavenue.controller;

import com.autoavenue.model.Driver;
import com.autoavenue.service.DriverService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DriverLoginServlet")
public class DriverLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DriverService driverService;

    public DriverLoginServlet() {
        super();
        driverService = new DriverService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Ensure that your authenticateDriver method in DriverService returns the correct driver object
        Driver driver = driverService.authenticateDriver(email, password);

        if (driver != null) {
            // Driver is authenticated, store driver information in session for future use
            request.getSession().setAttribute("loggedInDriver", driver);

            // Redirect to the driver dashboard with driver information included in the URL
            response.sendRedirect("driverDashboard.jsp");
        } else {
            // Authentication failed, set the session variable to show the pop-up
            request.getSession().setAttribute("showErrorPopup", true);

            // Redirect to login page with an error message
            response.sendRedirect("driverLogin.jsp?error=1");
        }
    }
}