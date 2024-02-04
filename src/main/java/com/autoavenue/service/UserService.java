package com.autoavenue.service;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.autoavenue.dao.UserDAO;
import com.autoavenue.model.Driver;
import com.autoavenue.model.User;
import com.autoavenue.util.FactoryProvider;

public class UserService {

    private UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    // Register a new user
    public boolean registerUser(User user) {
        userDAO.saveUser(user);
        return true;
    }

    // Check if the email is already registered
    public boolean isEmailAlreadyRegistered(String email) {
        return userDAO.isEmailAlreadyRegistered(email);
    }

    // Authenticate a user based on email and password
    public User authenticateUser(String email, String password) {
        return userDAO.getUserByEmailAndPassword(email, password);
    }

    // Get an available driver based on the source location
    public Driver getAvailableDriverByLocation(String sourceLocation) {
        return userDAO.getAvailableDriverByLocation(sourceLocation);
    }

    // Update the details of a driver
    public void updateDriver(Driver driver) {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();
            session.update(driver);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    // Update the availability status of a driver
    public void updateDriverAvailabilityStatus(long driverId, boolean isAvailable) {
        try {
            Session session = FactoryProvider.getFactory().openSession();
            Transaction tx = session.beginTransaction();

            // Retrieve the driver entity by its ID
            Driver driver = session.get(Driver.class, driverId);

            // Update the isAvailable status
            driver.setAvailable(isAvailable);

            // Save the updated driver entity
            session.saveOrUpdate(driver);

            tx.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions appropriately
        }
    }
}
