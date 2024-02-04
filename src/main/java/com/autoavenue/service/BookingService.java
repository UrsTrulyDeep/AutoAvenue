package com.autoavenue.service;

import com.autoavenue.dao.BookingDAO;
import com.autoavenue.model.Booking;
import com.autoavenue.model.User;

import java.util.List;

public class BookingService {
    private BookingDAO bookingDAO;

    public BookingService() {
        this.bookingDAO = new BookingDAO();
    }

    // Method to book a cab
    public void bookCab(Booking newBooking) {
        // Perform any necessary logic before adding the booking, e.g., check availability, update driver status, etc.
        bookingDAO.saveBooking(newBooking);
    }

    // Method to get a list of all bookings
    public List<Booking> getAllBookings() {
        return bookingDAO.getAllBookings();
    }

    // Method to get booking history for a specific user
    public List<Booking> getBookingHistoryForUser(User user) {
        // Retrieve booking history based on the user
        return bookingDAO.getBookingHistoryForUser(user);
    }
}
