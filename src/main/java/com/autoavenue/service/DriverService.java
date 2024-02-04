package com.autoavenue.service;

import com.autoavenue.dao.DriverDAO;
import com.autoavenue.model.Driver;

public class DriverService {

    private DriverDAO driverDAO;

    public DriverService() {
        this.driverDAO = new DriverDAO();
    }

    public boolean registerDriver(Driver driver) {
        driverDAO.saveDriver(driver);
        return true; 
    }

    public boolean isEmailAlreadyRegistered(String email) {
        return driverDAO.isEmailAlreadyRegistered(email);
    }

    public Driver authenticateDriver(String email, String password) {
        return driverDAO.getDriverByEmailAndPassword(email, password);
    }

    // Example method to update driver information
    public boolean updateDriver(Driver updatedDriver) {
        try {
            // Retrieve the existing driver from the database based on the driver's unique identifier
            Driver existingDriver = driverDAO.getDriverById(updatedDriver.getDriverId());

            // Check if the driver exists
            if (existingDriver != null) {
                // Update the necessary information
                existingDriver.setDriverName(updatedDriver.getDriverName());
                existingDriver.setDriverContact(updatedDriver.getDriverContact());

                // Save the updated driver information
                driverDAO.updateDriver(existingDriver);

                return true;
            } else {
                // Driver not found
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}