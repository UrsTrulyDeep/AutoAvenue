package com.autoavenue.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

    // Singleton instance of SessionFactory
    private static SessionFactory factory;

    // Private constructor to prevent external instantiation
    private FactoryProvider() {
    }

    // Method to obtain the SessionFactory instance
    public static SessionFactory getFactory() {

        // If the factory is not initialized, create a new one
        if (factory == null) {
            factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        }

        return factory;
    }

    // Method to close the SessionFactory
    public void closeFactory() {
        // Check if the factory is open before closing
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
    }
}
