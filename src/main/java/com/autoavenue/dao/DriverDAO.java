package com.autoavenue.dao;

import com.autoavenue.model.Driver;
import com.autoavenue.util.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class DriverDAO {

    // Method to save a new driver
    public void saveDriver(Driver driver) {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(driver);
        transaction.commit();
        session.close();
    }

    // Method to check if an email is already registered for a driver
    public boolean isEmailAlreadyRegistered(String email) {
        Session session = FactoryProvider.getFactory().openSession();
        String hql = "SELECT COUNT(*) FROM Driver WHERE email = :email";
        Query<Long> query = session.createQuery(hql, Long.class);
        query.setParameter("email", email);
        Long count = query.uniqueResult();
        session.close();
        return count != null && count > 0;
    }

    // Method to get a driver by email and password
    public Driver getDriverByEmailAndPassword(String email, String password) {
        try {
            Session session = FactoryProvider.getFactory().openSession();
            String hql = "FROM Driver WHERE email = :email AND password = :password";
            Query<Driver> query = session.createQuery(hql, Driver.class);
            query.setParameter("email", email);
            query.setParameter("password", password);

            Driver driver = query.uniqueResult();
            session.close();
            return driver;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Method to get a driver by ID
    public Driver getDriverById(Long driverId) {
        try {
            Session session = FactoryProvider.getFactory().openSession();
            Driver driver = session.get(Driver.class, driverId);
            session.close();
            return driver;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Method to update a driver's information
    public void updateDriver(Driver driver) {
        try {
            Session session = FactoryProvider.getFactory().openSession();
            Transaction transaction = session.beginTransaction();
            session.update(driver);
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
