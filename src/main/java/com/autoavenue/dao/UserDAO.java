package com.autoavenue.dao;

import com.autoavenue.model.Driver;
import com.autoavenue.model.User;
import com.autoavenue.util.FactoryProvider;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;
import java.util.Random;

public class UserDAO {

    // Save user to the database
    public void saveUser(User user) {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(user);
        transaction.commit();
        session.close();
    }

    // Get user by email and password for authentication
    public User getUserByEmailAndPassword(String email, String password) {
        try {
            Session session = FactoryProvider.getFactory().openSession();
            String hql = "FROM User WHERE email = :email AND password = :password";
            Query<User> query = session.createQuery(hql, User.class);
            query.setParameter("email", email);
            query.setParameter("password", password);

            User user = query.uniqueResult();
            session.close();
            return user;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Check if the email is already registered in the database
    public boolean isEmailAlreadyRegistered(String email) {
        Session session = FactoryProvider.getFactory().openSession();
        String hql = "SELECT COUNT(*) FROM User WHERE email = :email";
        Query<Long> query = session.createQuery(hql, Long.class);
        query.setParameter("email", email);
        Long count = query.uniqueResult();
        session.close();
        return count != null && count > 0;
    }

    // Get an available driver based on location
    public Driver getAvailableDriverByLocation(String sourceLocation) {
        try {
            Session session = FactoryProvider.getFactory().openSession();

            String hql = "FROM Driver d WHERE d.driverLocation = :sourceLocation "
                    + "AND d.isAvailable = true ";

            Query<Driver> query = session.createQuery(hql, Driver.class);
            query.setParameter("sourceLocation", sourceLocation);

            List<Driver> availableDrivers = query.getResultList();

            if (!availableDrivers.isEmpty()) {
                // Randomly select one driver from the list
                int randomIndex = new Random().nextInt(availableDrivers.size());
                Driver driver = availableDrivers.get(randomIndex);

                // Log the selected driver's details
                System.out.println("Selected Driver: " + driver.getDriverName() + " (" + driver.getDriverId() + ")");
                System.out.println("Available Drivers: " + availableDrivers);

                session.close();
                return driver;
            } else {
                // Log that no available drivers were found
                System.out.println("No available drivers for location: " + sourceLocation);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Log any exception that occurs during the process
            System.out.println("Exception while getting available driver: " + e.getMessage());
        }
        return null;
    }
}
