package com.autoavenue.controller;

import com.autoavenue.model.Driver;
import com.autoavenue.service.DriverService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DriverInfoUpdateServlet")
public class DriverInfoUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DriverService driverService;

    public DriverInfoUpdateServlet() {
        super();
        driverService = new DriverService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the logged-in driver's information
        Driver loggedInDriver = (Driver) request.getSession().getAttribute("loggedInDriver");

        // Set the driver information as an attribute to be accessed in the JSP
        request.setAttribute("loggedInDriver", loggedInDriver);

        // Forward the request to the driver info update JSP page
        request.getRequestDispatcher("driverInfoUpdate.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
        try {
            // Retrieve the updated driver information from the form
            String updatedDriverName = request.getParameter("updatedDriverName");
            String updatedDriverContact = request.getParameter("updatedDriverContact");

            // Retrieve the logged-in driver's information
            Driver loggedInDriver = (Driver) request.getSession().getAttribute("loggedInDriver");

            // Update the driver information
            loggedInDriver.setDriverName(updatedDriverName);
            loggedInDriver.setDriverContact(updatedDriverContact);

            // Update the driver information in the database
            driverService.updateDriver(loggedInDriver);

            // Update the session attribute with the latest driver information
            request.getSession().setAttribute("loggedInDriver", loggedInDriver);

            // Redirect to the driver dashboard after the update
            response.sendRedirect("driverDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}