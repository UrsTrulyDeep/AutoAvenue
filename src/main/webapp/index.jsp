<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home page</title>
    
    <!-- Include common CSS and JS files -->
    <%@include file="all_js_css.jsp"%>
    
    <!-- Include additional CSS specific to the home page -->
    <link rel="stylesheet" href="css/home.css">
</head>

<body>
    <div class="container">
        <!-- Include the common navigation bar -->
        <%@include file="navbar.jsp" %>
        <br>
        
        <!-- Main Content Section -->
        <div class="card shadow bg-white py-5">
            <!-- Cab Booking Image and Welcome Message -->
            <img alt="Cab Booking" class="img-fluid mx-auto" style="max-width: 400px;" src="img/cab-booking-software.jpg">
            <h1 class="text-primary text-uppercase text-center mt-3">Welcome to Urban Hitch</h1>
            <p class="lead text-center">Your Reliable Cab Booking Service</p>
            
            <!-- Book Now Button -->
            <div class="container text-center">
                <a href="userRegistration.jsp" class="btn btn-outline-primary text-center">
                    <i class="fas fa-taxi"></i> Book Now
                </a>
            </div>
        </div>
        
        <!-- Additional Features Section -->
        <div class="mt-5">
            <!-- Feature Cards -->
            <h2 class="text-center mb-4">Why Choose Urban Hitch?</h2>
            <div class="row">
                <!-- Feature: Quick Service -->
                <div class="col-lg-4 mb-4">
                    <div class="card h-100 text-center">
                        <i class="fas fa-clock fa-4x mt-3 mb-2 text-primary"></i>
                        <div class="card-body">
                            <h5 class="card-title">Quick Service</h5>
                            <p class="card-text">Get a cab at your doorstep swiftly and efficiently.</p>
                        </div>
                    </div>
                </div>
                <!-- Feature: Diverse Fleet -->
                <div class="col-lg-4 mb-4">
                    <div class="card h-100 text-center">
                        <i class="fas fa-car fa-4x mt-3 mb-2 text-primary"></i>
                        <div class="card-body">
                            <h5 class="card-title">Diverse Fleet</h5>
                            <p class="card-text">Choose from a variety of cabs to suit your needs.</p>
                        </div>
                    </div>
                </div>
                <!-- Feature: Easy Navigation -->
                <div class="col-lg-4 mb-4">
                    <div class="card h-100 text-center">
                        <i class="fas fa-map-marker-alt fa-4x mt-3 mb-2 text-primary"></i>
                        <div class="card-body">
                            <h5 class="card-title">Easy Navigation</h5>
                            <p class="card-text">Navigate seamlessly with our advanced cab tracking system.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Customer Testimonials Section -->
        <div class="mt-5">
            <!-- Testimonial Cards -->
            <h2 class="text-center mb-4">Customer Testimonials</h2>
            <div class="row">
                <!-- Testimonial: Arjun Patel -->
                <div class="col-lg-4 mb-4">
                    <div class="card h-100 text-center">
                        <div class="card-body">
                            <p class="card-text">"Excellent service! The cab arrived on time, and the driver was courteous. Highly recommended!"</p>
                            <p class="text-muted">- Arjun Patel</p>
                        </div>
                    </div>
                </div>
                <!-- Testimonial: Aisha Sharma -->
                <div class="col-lg-4 mb-4">
                    <div class="card h-100 text-center">
                        <div class="card-body">
                            <p class="card-text">"Smooth rides every time! Urban Hitch is my go-to for cab bookings."</p>
                            <p class="text-muted">- Aisha Sharma</p>
                        </div>
                    </div>
                </div>
                <!-- Testimonial: Rohan Kapoor -->
                <div class="col-lg-4 mb-4">
                    <div class="card h-100 text-center">
                        <div class="card-body">
                            <p class="card-text">"Impressed with the professionalism. The app is user-friendly, and the drivers are reliable."</p>
                            <p class="text-muted">- Rohan Kapoor</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Call-to-Action Section -->
        <div class="mt-5 text-center">
            <h2 class="mb-3">Ready to Experience Urban Hitch?</h2>
            <p class="lead">Join thousands of satisfied customers. Book your first ride today!</p>
            <a href="userRegistration.jsp" class="btn btn-primary">Get Started</a>
        </div>
    
        <!-- About Us Section -->
        <div class="mt-5">
            <h2 class="text-center mb-4">About Us</h2>
            <p class="text-center lead">Urban Hitch is a leading cab booking service committed to providing reliable
                and efficient transportation solutions. With a focus on safety and customer satisfaction, we aim to
                make your journeys comfortable and convenient.</p>
        </div>

        <!-- Contact Us Section -->
        <div class="mt-5">
            <h2 class="text-center mb-4">Contact Us</h2>
            <p class="text-center lead">Have questions or need assistance? Reach out to our support team.</p>
            <p class="text-center lead">Email: support@urbanhitch.com</p>
        </div>

        <!-- Company Headquarters Section -->
        <div class="mt-5">
            <h2 class="text-center mb-4">Company Headquarters</h2>
            <p class="text-center lead">Urban Hitch Pvt. Ltd.</p>
            <p class="text-center lead">304, Phase 3, Hinjewadi, Pune, India</p>
        </div>
    </div>
</body>
</html>
