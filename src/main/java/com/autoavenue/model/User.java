package com.autoavenue.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {

    // Primary key for the User entity
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userId;

    // User attributes
    private String userName;
    private String password;
    private String email;

    // One-to-Many relationship with Booking entity, mapped by bookedByUser field
    @OneToMany(mappedBy = "bookedByUser", fetch = FetchType.LAZY)
    private List<Booking> bookedRides = new ArrayList<Booking>();

    private String userContact;

    // Getters and setters for all attributes

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Booking> getBookedRides() {
        return bookedRides;
    }

    public void setBookedRides(List<Booking> bookedRides) {
        this.bookedRides = bookedRides;
    }

    public String getUserContact() {
        return userContact;
    }

    public void setUserContact(String userContact) {
        this.userContact = userContact;
    }

    // Default constructor
    public User() {
        super();
    }

    // Parameterized constructor
    public User(String userName, String password, String email, String userContact) {
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.userContact = userContact;
    }
}
