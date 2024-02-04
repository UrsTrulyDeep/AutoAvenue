package com.autoavenue.dao;

import com.autoavenue.model.Booking;
import com.autoavenue.model.User;
import com.autoavenue.util.FactoryProvider;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public class BookingDAO {

    // Save a new booking
    public void saveBooking(Booking booking) {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(booking);
        transaction.commit();
        session.close();
    }

    // Get a list of all bookings
    public List<Booking> getAllBookings() {
        Session session = FactoryProvider.getFactory().openSession();
        String hql = "FROM Booking";
        List<Booking> bookings = session.createQuery(hql, Booking.class).list();
        session.close();
        return bookings;
    }

    // Get booking history for a specific user
    public List<Booking> getBookingHistoryForUser(User user) {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();

            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Booking> criteria = builder.createQuery(Booking.class);
            Root<Booking> root = criteria.from(Booking.class);

            criteria.where(builder.equal(root.get("bookedByUser"), user));

            List<Booking> bookingHistory = session.createQuery(criteria).getResultList();

            transaction.commit();
            return bookingHistory;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }
}
