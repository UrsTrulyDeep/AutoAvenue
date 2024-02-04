package com.autoavenue.controller;

import com.autoavenue.model.Booking;
import com.autoavenue.model.Driver;
import com.autoavenue.model.Route;
import com.autoavenue.model.User;
import com.autoavenue.service.BookingService;
import com.autoavenue.service.RouteService;
import com.autoavenue.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/BookingController")
public class BookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;
    private UserService userService;
    private RouteService routeService;

    public BookingController() {
        // Initialize service classes
        bookingService = new BookingService();
        userService = new UserService();
        routeService = new RouteService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameters from the request
        String sourceLocation = request.getParameter("sourceLocation");
        String destinationLocation = request.getParameter("destinationLocation");

        // Fetch route details for the given source and destination combination
        Route route = routeService.getRouteBySourceAndDestination(sourceLocation, destinationLocation);

        if (route != null) {
            // Extract route details
            double distance = route.getDistance();
            int estimatedTime = route.getEstimatedTime();
            double cost = route.getCost();

            // Get the logged-in user (you might need to adjust this based on your authentication mechanism)
            User loggedInUser = (User) request.getSession().getAttribute("loggedInUser");

            // Create a Booking object
            Booking newBooking = new Booking(sourceLocation, destinationLocation, distance, estimatedTime, cost);
            newBooking.setBookedByUser(loggedInUser);
            newBooking.setBookingTime(new Date()); // Set the booking time to the current system time

            // Assign a driver based on the source location (you might need a more sophisticated logic)
            Driver assignedDriver = userService.getAvailableDriverByLocation(sourceLocation);

            // Set attributes for displaying on the success page
            if (assignedDriver != null) {
                assignedDriver.setAvailable(false);
                userService.updateDriver(assignedDriver);
                newBooking.setBookedByDriver(assignedDriver);

                // Perform the booking
                bookingService.bookCab(newBooking);

                // Set attributes for displaying on the success page
                request.setAttribute("bookingId", newBooking.getBookingId());
                request.setAttribute("sourceLocation", newBooking.getSourceLocation());
                request.setAttribute("destinationLocation", newBooking.getDestinationLocation());
                request.setAttribute("cabNumber", assignedDriver.getCabNumber());
                request.setAttribute("driverName", assignedDriver.getDriverName());
                request.setAttribute("driverContact", assignedDriver.getDriverContact());
                request.setAttribute("distance", newBooking.getDistance());
                request.setAttribute("estimatedTime", newBooking.getEstimatedTime());
                request.setAttribute("cost", newBooking.getCost());

                // Redirect to the booking success page
                request.getRequestDispatcher("bookingSuccess.jsp").forward(request, response);

                // Make the driver available again after the booking is done
                userService.updateDriverAvailabilityStatus(assignedDriver.getDriverId(), true);
            } else {
                // Handle case where no driver is available
                request.setAttribute("bookingError", "No driver available for the provided source location.");
                request.getRequestDispatcher("bookingFailure.jsp").forward(request, response);
            }
        } else {
            // Handle case where no route is found for the given source and destination
            request.setAttribute("bookingError", "No route found for the provided source and destination.");
            request.getRequestDispatcher("bookingFailure.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to the booking page
        response.sendRedirect("cabBooking.jsp");
    }
}
