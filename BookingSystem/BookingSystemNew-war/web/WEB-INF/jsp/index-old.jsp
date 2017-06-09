
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entity.Room"%>
<%@page import="java.util.List"%>
<%@page import="entity.Customer"%>
<%@page import="session.EntityAccessorBeanRemote"%>
<%@page import="session.AdminSessionBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body>
        <p>Hello! This is the default welcome page for a Spring Web MVC project.</p>
        <p><i>To display a different welcome page for this project, modify</i>
            <tt>index.jsp</tt> <i>, or create your own welcome page then change
                the redirection in</i> <tt>redirect.jsp</tt> <i>to point to the new
                welcome page and also update the welcome-file setting in</i>
            <tt>web.xml</tt>.</p>
    </body>
</html>
-->
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Hotel Booking Project</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- <meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
        <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
        <meta name="author" content="FREEHTML5.CO" /> -->



        <!-- Facebook and Twitter integration -->
        <meta property="og:title" content=""/>
        <meta property="og:image" content=""/>
        <meta property="og:url" content=""/>
        <meta property="og:site_name" content=""/>
        <meta property="og:description" content=""/>
        <meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />

              
        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico">
        <!-- <link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700italic,900,700,900italic' rel='stylesheet' type='text/css'> -->

        
        <!-- Stylesheets -->
        <!-- Dropdown Menu -->
        <link rel="stylesheet" href="<c:url value="/resources/css/superfish.css"/>">
        <!-- Date Picker -->
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-datepicker.min.css"/>">
        <!-- CS Select -->
        <link rel="stylesheet" href="<c:url value="/resources/css/cs-select.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css/cs-skin-border.css"/>">

        <!-- Themify Icons -->
        <link rel="stylesheet" href="<c:url value="/resources/css/themify-icons.css"/>">
        <!-- Flat Icon -->
        <link rel="stylesheet" href="<c:url value="/resources/css/flaticon.css"/>">
        <!-- Icomoon -->
        <link rel="stylesheet" href="<c:url value="/resources/css/icomoon.css"/>">
        <!-- Flexslider  -->
        <link rel="stylesheet" href="<c:url value="/resources/css/flexslider.css"/>">

        <!-- Style -->
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">

        <!-- Modernizr JS -->
        <script src="<c:url value="/resources/js/modernizr-2.6.2.min.js"/>"></script>
        

    </head>
    <body>
        <div id="fh5co-wrapper">
            <div id="fh5co-page">
                <div id="fh5co-header">
                    <header id="fh5co-header-section">
                        <div class="container">
                            <div class="nav-header">
                                <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
                                <h1 id="fh5co-logo"><a href="index.html">SlackerHackers</a></h1>
                                <nav id="fh5co-menu-wrap" role="navigation">
                                    <ul class="sf-menu" id="fh5co-primary-menu">
                                        <li><a class="active" href="index.html">Home</a></li>
                                        <li>
                                            <a href="hotel.html" class="fh5co-sub-ddown">Hotel</a>
                                            <ul class="fh5co-sub-menu">
                                                <li><a href="#"> Hotel1</a></li>
                                                <li><a href="#">Hotel2</a></li>
                                                <li>
                                                    <a href="#" class="fh5co-sub-ddown">Hotel3</a>
                                                    <ul class="fh5co-sub-menu">
                                                        <li><a href="" target="_blank">What</a></li>
                                                        <li><a href="" target="_blank">Should</a></li>
                                                        <li><a href="" target="_blank">We</a></li>
                                                        <li><a href="" target="_blank">Put</a></li>
                                                        <li><a href="" target="_blank">Here</a></li>
                                                        <li><a href="" target="_blank">?</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">Hotel4</a></li> 
                                            </ul>
                                        </li>
                                        <li><a href="#">Services</a></li>

                                        <li><a href="#login" data-toggle="modal" data-target ="#login">Log In</a></li>
                                    </ul>
                                </nav> 
                            </div>
                        </div>
                    </header>

                </div>
                <!-- end:fh5co-header -->
                <aside id="fh5co-hero" class="js-fullheight">
                    <div class="flexslider js-fullheight">
                        <ul class="slides">
                            <li style="background-image: url(<c:url value="/resources/images/slider1.jpg"/>);">
                                <div class="overlay-gradient"></div>
                                <div class="container">
                                    <div class="col-md-12 col-md-offset-0 text-center slider-text">
                                        <div class="slider-text-inner js-fullheight">
                                            <div class="desc">
                                                <p><span>SlackerHackers Hotel</span></p>
                                                <h2>Reserve Room for Family Vacation</h2>
                                                <%
                                                    /*InitialContext ic = new InitialContext();
                                                    //Object o = ic.lookup(AdminSessionBeanRemote.class.getName());
                                                    //AdminSessionBeanRemote adminSession = (AdminSessionBeanRemote) o;

                                                    Object c = ic.lookup(EntityAccessorBeanRemote.class.getName());
                                                    EntityAccessorBeanRemote entitySession = (EntityAccessorBeanRemote) c;
                                                    Customer cust1 = entitySession.find(Customer.class, 1);
                                                    out.println(cust1 + cust1.getName());
                                                    */
                                                %>
                                                <p>
                                                    <a href="#bookNow" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#bookNow">Book Now</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li style="background-image: url(<c:url value="/resources/images/slider2.jpg"/>);">
                                <div class="overlay-gradient"></div>
                                <div class="container">
                                    <div class="col-md-12 col-md-offset-0 text-center slider-text">
                                        <div class="slider-text-inner js-fullheight">
                                            <div class="desc">
                                                <p><span>SlackerHackers Hotel</span></p>
                                                <h2>Make Your Vacation Comfortable</h2>
                                                <p>
                                                    <a href="#bookNow" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#bookNow">Book Now</a>

                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li style="background-image: url(<c:url value="/resources/images/slider3.jpg"/>);">
                                <div class="overlay-gradient"></div>
                                <div class="container">
                                    <div class="col-md-12 col-md-offset-0 text-center slider-text">
                                        <div class="slider-text-inner js-fullheight">
                                            <div class="desc">
                                                <p><span>SlackerHackers Hotel</span></p>
                                                <h2>A Best Place To Enjoy Your Life</h2>
                                                <p>
                                                    <a href="#" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#bookNow">Book Now</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </div>
                </aside>
                <div class="wrap">
                    <div class="container">
                        <div class="row">
                            <div id="availability">
                                <form action="#">

                                    <div class="a-col">
                                        <section>
                                            <select class="cs-select cs-skin-border">
                                                
                                                <option value="" disabled selected>Room Type</option>
                                                <!--
                                                <option value="email">Room 1</option>
                                                <option value="twitter">Room 2</option>
                                                <option value="linkedin">Room 3</option>
                                                -->
                                                <!--insert jsp tag to populate room -->
                                                 <% InitialContext ic5 = new InitialContext();
                                              
                                                //Object o = ic.lookup(AdminSessionBeanRemote.class.getName());
                                                //AdminSessionBeanRemote adminSession = (AdminSessionBeanRemote) o;

                                                Object a = ic5.lookup(EntityAccessorBeanRemote.class.getName());
                                                EntityAccessorBeanRemote entitySession5 = (EntityAccessorBeanRemote) a;
                                                //for the dates
                                               
                                                //Room  room = entitySession2.find(Room.class, 1);
                                                // gets list of all rooms
                                                List<Room> rooms2 = entitySession5.getAll(Room.class);
                                                // prints each room from the list
                                               
                                                for (Room singleRoom : rooms2) {
                                                    //out.println("<h1>" + singleRoom.getRoomName() +"</h1><input type='radio' name='gender' value ="+ "'" + singleRoom.getRoomName() + "' ></input><br>");
                                                    out.println("<option value ="+ "'" + singleRoom.getRoomName() + "' >"+ singleRoom.getRoomName() +"</option>"+"<br>");

                                                    out.println(" ");
                                                }
                                                
                                                // will get single room with id 1
                                                //out.println(room.getRoomName());

                                            %>
                                            </select>
                                        </section>
                                    </div>
                                   <!-- <div class="a-col">
                                        <section>
                                            <select class="cs-select cs-skin-border">
                                                <option value="" disabled selected>Room Number</option>
                                                <option value="email">Room 1</option>
                                                <option value="twitter">Room 2</option>
                                                <option value="linkedin">Room 3</option>
                                            </select>
                                        </section>
                                    </div> -->
                                    <div class="a-col alternate">
                                        <div class="input-field">
                                            <label for="date-start">Check In</label>
                                            <input type="text" class="form-control" id="date-start" />
                                        </div>
                                    </div>
                                    <div class="a-col alternate">
                                        <div class="input-field">
                                            <label for="date-end">Check Out</label>
                                            <input type="text" class="form-control" id="date-end" />
                                        </div>
                                    </div>
                                    <div class="a-col action">
                                        <a href="#roomAvailability" data-toggle="modal" data-target="#roomAvailability">
                                            <span>Check</span>
                                            Availability
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- this portion is just fancy animation -->
                <div id="fh5co-counter-section" class="fh5co-counters">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3 text-center">
                                <span class="fh5co-counter js-counter" data-from="0" data-to="20356" data-speed="5000" data-refresh-interval="50"></span>
                                <span class="fh5co-counter-label">User Access</span>
                            </div>
                            <div class="col-md-3 text-center">
                                <span class="fh5co-counter js-counter" data-from="0" data-to="15501" data-speed="5000" data-refresh-interval="50"></span>
                                <span class="fh5co-counter-label">Hotels</span>
                            </div>
                            <div class="col-md-3 text-center">
                                <span class="fh5co-counter js-counter" data-from="0" data-to="8200" data-speed="5000" data-refresh-interval="50"></span>
                                <span class="fh5co-counter-label">Transactions</span>
                            </div>
                            <div class="col-md-3 text-center">
                                <span class="fh5co-counter js-counter" data-from="0" data-to="8763" data-speed="5000" data-refresh-interval="50"></span>
                                <span class="fh5co-counter-label">Rating &amp; Review</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                        <div id="featured-hotel" class="fh5co-bg-color">
                                <div class="container">
                                        
                                        <div class="row">
                                                <div class="col-md-12">
                                                        <div class="section-title text-center">
                                                                <h2>Featured Rooms</h2>
                                                        </div>
                                                </div>
                                        </div>
                
                                        <div class="row">
                                                <div class="feature-full-1col">
                                                        <div class="image" style="background-image: url(<c:url value="/resources/images/hotelroomUltraPremium2.jpg"/>);">
                                                                <div class="descrip text-center">
                                                                        <p><small>For as low as</small><span>$599.99/night</span></p>
                                                                </div>
                                                        </div>
                                                        <div class="desc">
                                                                <h3>Ultra Superior Rooms</h3>
                                                                <p>with a capacity of 6 people</p>
                                                                <p><a href="#" class="btn btn-primary btn-luxe-primary">Book Now <i class="ti-angle-right"></i></a></p>
                                                        </div>
                                                </div>
                
                                                <div class="feature-full-2col">
                                                        <div class="f-hotel">
                                                                <div class="image" style="background-image: url(<c:url value="/resources/images/hotelroomPremium.jpg"/>);">
                                                                        <div class="descrip text-center">
                                                                                <p><small>For as low as</small><span>$499.99/night</span></p>
                                                                        </div>
                                                                </div>
                                                                <div class="desc">
                                                                        <h3>Superior Rooms</h3>
                                                                        <p>with a capacity of 4 people</p>
                                                                        <p><a href="#" class="btn btn-primary btn-luxe-primary">Book Now <i class="ti-angle-right"></i></a></p>
                                                                </div>
                                                        </div>
                                                        <div class="f-hotel">
                                                                <div class="image" style="background-image: url(<c:url value="/resources/images/hotelroomDelux.jpg"/>);">
                                                                        <div class="descrip text-center">
                                                                                <p><small>For as low as</small><span>$399.99/night</span></p>
                                                                        </div>
                                                                </div>
                                                                <div class="desc">
                                                                        <h3>Deluxe Twin Rooms</h3>
                                                                        <p>with a capacity of 2 people</p>
                                                                        <p><a href="#" class="btn btn-primary btn-luxe-primary">Book Now <i class="ti-angle-right"></i></a></p>
                                                                </div>
                                                        </div>
                                                </div>
                                        </div>
                
                                </div>
                        </div>
                
                        <div id="hotel-facilities">
                                <div class="container">
                                        <div class="row">
                                                <div class="col-md-12">
                                                        <div class="section-title text-center">
                                                                <h2>Hotel Facilities</h2>
                                                        </div>
                                                </div>
                                        </div>
                
                                        <div id="tabs">
                                                <nav class="tabs-nav">
                                                        <a href="#" class="active" data-tab="tab1">
                                                                <i class="flaticon-restaurant icon"></i>
                                                                <span>Restaurant</span>
                                                        </a>
                                                        <a href="#" data-tab="tab2">
                                                                <i class="flaticon-cup icon"></i>
                                                                <span>Bar</span>
                                                        </a>
                                                        <a href="#" data-tab="tab3">
                                                        
                                                                <i class="flaticon-car icon"></i>
                                                                <span>Pick-up</span>
                                                        </a>
                                                        <a href="#" data-tab="tab4">
                                                                
                                                                <i class="flaticon-swimming icon"></i>
                                                                <span>Swimming Pool</span>
                                                        </a>
                                                        <a href="#" data-tab="tab5">
                                                                
                                                                <i class="flaticon-massage icon"></i>
                                                                <span>Spa</span>
                                                        </a>
                                                        <a href="#" data-tab="tab6">
                                                                
                                                                <i class="flaticon-bicycle icon"></i>
                                                                <span>Gym</span>
                                                        </a>
                                                </nav>
                                                <div class="tab-content-container">
                                                        <div class="tab-content active show" data-tab-content="tab1">
                                                                <div class="container">
                                                                        <div class="row">
                                                                                <div class="col-md-6">
                                                                                        <img src="<c:url value="/resources/images/tab_img_7.jpeg"/>"  class="img-responsive" alt="Image">
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                        <span class="super-heading-sm">World Class</span>
                                                                                        <h3 class="heading">Restaurant</h3>
                                                                                        <p>place holder for texts</p>
                                                                                        <p>place holder for texts</p>
                                                                                        <p class="service-hour">
                                                                                                <span>Service Hours</span>
                                                                                                <strong>7:30 AM - 8:00 PM</strong>
                                                                                        </p>
                                                                                </div>
                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="tab-content" data-tab-content="tab2">
                                                                <div class="container">
                                                                        <div class="row">
                                                                                <div class="col-md-6">
                                                                                        <img src="<c:url value="/resources/images/hotelBar.jpg"/>"  class="img-responsive" alt="Image">
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                        <span class="super-heading-sm">World Class</span>
                                                                                        <h3 class="heading">Bars</h3>
                                                                                        <p>place holder for texts</p>
                                                                                        <p>place holder for texts</p>
                                                                                        <p class="service-hour">
                                                                                                <span>Service Hours</span>
                                                                                                <strong>7:30 AM - 8:00 PM</strong>
                                                                                        </p>
                                                                                </div>
                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="tab-content" data-tab-content="tab3">
                                                                <div class="container">
                                                                        <div class="row">
                                                                                <div class="col-md-6">
                                                                                        <img src="<c:url value="/resources/images/hotelLimo2.jpg"/>"  class="img-responsive" alt="Image">
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                        <span class="super-heading-sm">World Class</span>
                                                                                        <h3 class="heading">Pick Up</h3>
                                                                                        <p>place holder for texts</p>
                                                                                        <p>place holder for texts</p>
                                                                                        <p class="service-hour">
                                                                                                <span>Service Hours</span>
                                                                                                <strong>7:30 AM - 8:00 PM</strong>
                                                                                        </p>
                                                                                </div>
                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="tab-content" data-tab-content="tab4">
                                                                <div class="container">
                                                                        <div class="row">
                                                                                <div class="col-md-6">
                                                                                        <img src="<c:url value="/resources/images/hotelPool.jpg"/>"  class="img-responsive" alt="Image">
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                        <span class="super-heading-sm">World Class</span>
                                                                                        <h3 class="heading">Swimming Pool</h3>
                                                                                        <p>place holder for texts</p>
                                                                                        <p>place holder for texts</p>
                                                                                        <p class="service-hour">
                                                                                                <span>Service Hours</span>
                                                                                                <strong>7:30 AM - 8:00 PM</strong>
                                                                                        </p>
                                                                                </div>
                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="tab-content" data-tab-content="tab5">
                                                                <div class="container">
                                                                        <div class="row">
                                                                                <div class="col-md-6">
                                                                                        <img src="<c:url value="/resources/images/hotelSpa.jpg"/>"  class="img-responsive" alt="Image">
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                        <span class="super-heading-sm">World Class</span>
                                                                                        <h3 class="heading">Spa</h3>
                                                                                        <p>place holder for texts</p>
                                                                                        <p>place holder for texts</p>
                                                                                        <p class="service-hour">
                                                                                                <span>Service Hours</span>
                                                                                                <strong>7:30 AM - 8:00 PM</strong>
                                                                                        </p>
                                                                                </div>
                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="tab-content" data-tab-content="tab6">
                                                                <div class="container">
                                                                        <div class="row">
                                                                                <div class="col-md-6">
                                                                                        <img src="<c:url value="/resources/images/hotelGym.jpg"/>"  class="img-responsive" alt="Image">
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                        <span class="super-heading-sm">World Class</span>
                                                                                        <h3 class="heading">Gym</h3>
                                                                                        <p>place holder for texts</p>
                                                                                        <p>place holder for texts</p>
                                                                                        <p class="service-hour">
                                                                                                <span>Service Hours</span>
                                                                                                <strong>7:30 AM - 8:00 PM</strong>
                                                                                        </p>
                                                                                </div>
                                                                        </div>
                                                                </div>
                                                        </div>
                                                </div>
                                        </div>
                                </div>
                        </div>
                -->
                <div id="testimonial">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="section-title text-center">
                                    <h2>Happy Customer Says...</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="testimony">
                                    <blockquote>
                                        &ldquo;Amazing Application! You don't need anything else!&rdquo;
                                    </blockquote>
                                    <p class="author"><cite>Cole Siegel</cite></p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="testimony">
                                    <blockquote>
                                        &ldquo;Such an amazing app! My wife and I love it!&rdquo;
                                    </blockquote>
                                    <p class="author"><cite>Michael Corrales</cite></p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="testimony">
                                    <blockquote>
                                        &ldquo;If you’re looking for a top quality hotel app, look no further!&rdquo;
                                    </blockquote>
                                    <p class="author"><cite>Hemal Patel</cite></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>




                <footer id="footer" class="fh5co-bg-color">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="copyright">
                                    <p><small>&copy; Slacker Hackers J2EE Project 2017. <br> All Rights Reserved. <br>
                                            <p> Thanks for looking! <p>
                                                </div>
                                                </div>
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <h3>Company</h3>
                                                        <ul class="link">
                                                            <li><a href="#">About Us</a></li>
                                                            <li><a href="#">Hotels</a></li>
                                                            <li><a href="#">Customer Care</a></li>
                                                            <li><a href="#">Contact Us</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <h3>Our Facilities</h3>
                                                        <ul class="link">
                                                            <li><a href="#">Resturant</a></li>
                                                            <li><a href="#">Bars</a></li>
                                                            <li><a href="#">Pick-up</a></li>
                                                            <li><a href="#">Swimming Pool</a></li>
                                                            <li><a href="#">Spa</a></li>
                                                            <li><a href="#">Gym</a></li>
                                                        </ul>
                                                    </div>
                                                    <!--<div class="col-md-6">
                                                            <h3>Subscribe</h3>
                                                            <p> </p>
                                                            <form action="#" id="form-subscribe">
                                                                    <div class="form-field">
                                                                            <input type="email" placeholder="Email Address" id="email">
                                                                            <input type="submit" id="submit" value="Send">
                                                                    </div>
                                                            </form>
                                                    </div> -->
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <ul class="social-icons">
                                                    <li>
                                                        <a href="#"><i class="icon-twitter-with-circle"></i></a>
                                                        <a href="#"><i class="icon-facebook-with-circle"></i></a>
                                                        <a href="#"><i class="icon-instagram-with-circle"></i></a>
                                                        <a href="#"><i class="icon-linkedin-with-circle"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                </div>
                            </div>
                            </footer>

                        </div>
                        <!-- END fh5co-page -->

                    </div>
                    <!-- END fh5co-wrapper -->

                    <!--modal TESTING booknow-->
                    <div id="bookNow" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Booking Form</h4>
                                </div>
                                <div class="modal-body">
                                    <form method = "get">
                                        <div class="form-group">
                                            <label for="firstName">First Name:</label>
                                            <input type="text" class="form-control" id="firstName">
                                        </div>
                                        <div class="form-group">
                                            <label for="lastName">Last Name:</label>
                                            <input type="text" class="form-control" id="lastName">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email address:</label>
                                            <input type="email" class="form-control" id="email">
                                        </div>
                                        <div class="form-group">
                                            <label for="phone1">Phone Number:</label>
                                            <input type="text" class="form-control" id="phone1">
                                        </div>
                                        <div class="form-group">
                                            <label for="phone2">Alternate Number:</label>
                                            <input type="text" class="form-control" id="phone2">
                                        </div>

                                        <button type="submit" class="btn btn-default">Submit</button>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- LOGIN modal -->
                    <div id="login" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Log In</h4>
                                </div>
                                <div class="modal-body">
                                    <form method ="get" action ="/BookingSystemNew-war/login" >
                                        <div class="form-group">
                                            <label for="loginEmail">User Email:</label>
                                            <input type="text" class="form-control" id="loginEmail" name = "loginEmail">
                                        </div>
                                        <div class="form-group">
                                            <label for="loginPassword">Password:</label>
                                            <input type="text" class="form-control" id="loginPassword" name = "loginPassword" >
                                        </div>



                                        <button type="submit" class="btn btn-default">Submit</button>
                                        <div class="form-group">
                                            <a href="#registerForm" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#registerForm">Register as a new user</a>
                                        </div>
                                       
                                    </form>
                                     <%
                                         InitialContext ic7 = new InitialContext();
                                        Object A = ic7.lookup(EntityAccessorBeanRemote.class.getName());
                                        EntityAccessorBeanRemote entitySession7 = (EntityAccessorBeanRemote) A;
                                        Customer customer = new Customer();
                                        
                                        
                                         if(request.getParameter("loginEmail")!= null && request.getParameter("loginPassword")!= null){
                                             String email = request.getParameter("loginEmail");
                                             String password =  request.getParameter("loginPassword");
                                             // if(request.getParameter("loginEmail").toString() == "xxx@xxx.com" && request.getParameter("loginPassword").toString()== "xxx"){
                                               if(email.equals("xxx@xxx.com") && password.equals("xxx")) {
                                                   response.sendRedirect("/BookingSystemNew-war/admin");
                                               }
                                                 else{
                                                   //include file = "dummy.jsp";
                                                response.sendRedirect("/BookingSystemNew-war/dummy");
                                                
                                            }
                                            }
                                           
                                        %>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>
                    </div>     

                    <!--modal  registerForm-->
                    <div id="registerForm" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">New User Registration form</h4>
                                </div>
                                <div class="modal-body">
                                    <form  method="get">
                                        <div class="form-group">
                                            <label for="firstName">First Name:</label>
                                            <input type="text" class="form-control" id="firstName" name = "firstName">
                                        </div>
                                        <div class="form-group">
                                            <label for="lastName">Last Name:</label>
                                            <input type="text" class="form-control" id="lastName" name="lastName">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email address:</label>
                                            <input type="email" class="form-control" id="email" name="email">
                                        </div>
                                        <div class="form-group">
                                            <label for="password">your desired Password:</label>
                                            <input type="text" class="form-control" id="password" name="password">
                                        </div>


                                        <button type="submit" class="btn btn-primary btn-lg">Submit</button>

                                    </form>
                                    <%             InitialContext ic3 = new InitialContext();
                                        Object x = ic3.lookup(EntityAccessorBeanRemote.class.getName());
                                        EntityAccessorBeanRemote entitySession3 = (EntityAccessorBeanRemote) x;

                                        if (request.getParameter("lastName") != null && request.getParameter("password") != null && request.getParameter("email") != null) {
                                            Customer cust = new Customer();
                                            cust.setName(request.getParameter("lastName"));
                                            cust.setPassword(request.getParameter("password"));
                                            cust.setEmail(request.getParameter("email"));
                                            entitySession3.insert(cust);
                                            //out.println("<h1>Registration Succesfull!</h1>");
                                            request.setAttribute("alertMsg", "data add sucess");
                                            String message = (String)request.getAttribute("alertMsg");
                                        }

                                        //String Lname = $("#lastName").value();
                                    %>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- CHECK AVAILABILITY modal -->
                    <div id="roomAvailability" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Available Rooms</h4>
                                </div>
                                <div class="modal-body">
                                    <form method = "get">
                                        <!--
                                        <div class="form-group">
                                         <label for="email">User Email:</label>
                                         <input type="text" class="form-control" id="email">
                                       </div>
                                        <div class="form-group">
                                         <label for="password">Last Name:</label>
                                         <input type="text" class="form-control" id="password">
                                       </div>
                                        -->
                                        <div class="form-group">
                                            <% InitialContext ic2 = new InitialContext();
                                               InitialContext ic4 = new InitialContext();
                                                //Object o = ic.lookup(AdminSessionBeanRemote.class.getName());
                                                //AdminSessionBeanRemote adminSession = (AdminSessionBeanRemote) o;

                                                Object d = ic2.lookup(EntityAccessorBeanRemote.class.getName());
                                                EntityAccessorBeanRemote entitySession2 = (EntityAccessorBeanRemote) d;
                                                //for the dates
                                                Object d2 = ic4.lookup(AdminSessionBeanRemote.class.getName());
                                                AdminSessionBeanRemote adminSession = (AdminSessionBeanRemote) d2;
                                                //Room  room = entitySession2.find(Room.class, 1);
                                                // gets list of all rooms
                                                List<Room> rooms = entitySession2.getAll(Room.class);
                                                //Date zz = $('#date-start').val();

                                                if (request.getParameter("date-start") != null){
                                                String startDate = request.getParameter("date-start");
                                                Date date = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
                                                
                                                 out.println("date selected");
                                                List<Room> roomDates = adminSession.getAvailableRoomsForDate(date);
                                                for (Room singleRoom2 : roomDates) {
                                                    out.println(singleRoom2.getRoomName());
                                                }
                                                }
                                                else 
                                                    out.println("no date selected");
                                                // prints each room from the list
                                                out.println("<form>");
                                                for (Room singleRoom : rooms) {
                                                    //out.println("<h1>" + singleRoom.getRoomName() +"</h1><input type='radio' name='gender' value ="+ "'" + singleRoom.getRoomName() + "' ></input><br>");
                                                    out.println("<input type='radio' name='roomType' value ="+ "'" + singleRoom.getRoomName() + "' >"+ singleRoom.getRoomName() +"</input>"+"<br>");

                                                    out.println(" ");
                                                }
                                                out.println("</form>");
                                                // will get single room with id 1
                                                //out.println(room.getRoomName());

                                            %>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-lg">Book Room </button>
                                        <!--<div class="form-group">
                                          <a href="#registerForm" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#registerForm">Register as a new user</a>
                                        </div>
                                        -->
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>
                    </div> 

                    <!-- Javascripts -->
                    <script src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
                    <!-- Dropdown Menu -->
                    <script src="<c:url value="/resources/js/hoverIntent.js"/>"></script>
                    <script src="<c:url value="/resources/js/superfish.js"/>"></script>
                    <!-- Bootstrap -->
                    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
                    <!-- Waypoints -->
                    <script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
                    <!-- Counters -->
                    <script src="<c:url value="/resources/js/jquery.countTo.js"/>"></script>
                    <!-- Stellar Parallax -->
                    <script src="<c:url value="/resources/js/jquery.stellar.min.js"/>"></script>
                    <!-- Owl Slider -->
                    <!-- Date Picker -->
                    <script src="<c:url value="/resources/js/bootstrap-datepicker.min.js"/>"></script>
                    <!-- CS Select -->
                    <script src="<c:url value="/resources/js/classie.js"/>"></script>
                    <script src="<c:url value="/resources/js/selectFx.js"/>"></script>
                    <!-- Flexslider -->
                    <script src="<c:url value="/resources/js/jquery.flexslider-min.js"/>"></script>

                    <script src="<c:url value="/resources/js/custom.js"/>"></script>

                    </body>
                    </html>