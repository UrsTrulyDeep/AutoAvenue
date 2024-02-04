package com.autoavenue.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "routes")
public class Route {

    // Primary key for the Route entity
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long routeId;

    // Column annotation with length restriction for source location
    @Column(length = 191)
    private String sourceLocation;

    // Column annotation with length restriction for destination location
    @Column(length = 191)
    private String destinationLocation;

    // Attributes for distance, estimated time, and cost
    private double distance;
    private int estimatedTime;
    private double cost;

    // Default constructor
    public Route() {
        // Default constructor
    }

    // Parameterized constructor
    public Route(String sourceLocation, String destinationLocation, double distance, int estimatedTime, double cost) {
        this.sourceLocation = sourceLocation;
        this.destinationLocation = destinationLocation;
        this.distance = distance;
        this.estimatedTime = estimatedTime;
        this.cost = cost;
    }

    // Getters and setters for all attributes

    public Long getRouteId() {
        return routeId;
    }

    public void setRouteId(Long routeId) {
        this.routeId = routeId;
    }

    public String getSourceLocation() {
        return sourceLocation;
    }

    public void setSourceLocation(String sourceLocation) {
        this.sourceLocation = sourceLocation;
    }

    public String getDestinationLocation() {
        return destinationLocation;
    }

    public void setDestinationLocation(String destinationLocation) {
        this.destinationLocation = destinationLocation;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public int getEstimatedTime() {
        return estimatedTime;
    }

    public void setEstimatedTime(int estimatedTime) {
        this.estimatedTime = estimatedTime;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    // Override toString method for better logging or debugging
    @Override
    public String toString() {
        return "Route [routeId=" + routeId + ", sourceLocation=" + sourceLocation + ", destinationLocation="
                + destinationLocation + ", distance=" + distance + ", estimatedTime=" + estimatedTime + ", cost="
                + cost + "]";
    }
}
