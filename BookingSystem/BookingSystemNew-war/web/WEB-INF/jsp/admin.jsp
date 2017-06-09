<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.persistence.Query"%>
<%@page import="entity.User"%>
<%@page import="entity.RoomAmenities"%>
<%@page import="entity.Privilege"%>
<%@page import="entity.PhoneNumber"%>
<%@page import="entity.Payment"%>
<%@page import="entity.CardType"%>
<%@page import="entity.Amenities"%>
<%@page import="entity.Address"%>
<%@page import="entity.RoomType"%>
<%@page import="entity.CardDetails"%>
<%@page import="java.util.Date"%>
<%@page import="entity.Reservation"%>
<%@page import="entity.Room"%>
<%@page import="java.util.List"%>
<%@page import="entity.Customer"%>
<%@page import="session.EntityAccessorBeanRemote"%>
<%@page import="session.AdminSessionBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


                                                <%
                                                    InitialContext ic = new InitialContext();
                                                    Object o = ic.lookup(AdminSessionBeanRemote.class.getName());
                                                    AdminSessionBeanRemote adminSession = (AdminSessionBeanRemote) o;
                                                    Date todaysDate = new Date();
                                                    List<Room> availableRooms = adminSession.getAvailableRoomsForDate(todaysDate);
                                                    String vacancy = "Vacant"; // means it has rooms available
                                                    if (availableRooms.size() > 0) {
                                                        vacancy = "No Vacancy"; // no rooms available (hotel terminology)
                                                    }
                                                    
                                                    Object c = ic.lookup(EntityAccessorBeanRemote.class.getName());
                                                    EntityAccessorBeanRemote entitySession = (EntityAccessorBeanRemote) c;
                                                    List<Customer> customers = entitySession.getAll(Customer.class);
                                                    List<Reservation> reservations = entitySession.getAll(Reservation.class);
                                                    List<Room> rooms = entitySession.getAll(Room.class);
                                                    List<RoomType> roomTypes = entitySession.getAll(RoomType.class);
                                                    List<Address> addresses = entitySession.getAll(Address.class);
                                                    List<Amenities> amenities = entitySession.getAll(Amenities.class);
                                                    List<CardDetails> cardDetails = entitySession.getAll(CardDetails.class);
                                                    List<CardType> cardType = entitySession.getAll(CardType.class);
                                                    List<Payment> payment = entitySession.getAll(Payment.class);
                                                    List<PhoneNumber> phoneNumber = entitySession.getAll(PhoneNumber.class);
                                                    List<Privilege> privilege = entitySession.getAll(Privilege.class);
                                                    List<RoomAmenities> roomAmenities = entitySession.getAll(RoomAmenities.class);
                                                    List<User> users = entitySession.getAll(User.class);
                                                    List<Reservation> specificReservations = new ArrayList<Reservation>();  
                                                    
                                                    // making available to JSTL tags 
                                                    request.setAttribute("roomList", rooms);
                                                    request.setAttribute("roomTypeList", roomTypes);
                                                    request.setAttribute("reservationList", reservations);
                                                    request.setAttribute("customerList", customers);
                                                    request.setAttribute("addressList", addresses);
                                                    request.setAttribute("amenitiesList", amenities);
                                                    request.setAttribute("cardDetailsList", cardDetails);
                                                    request.setAttribute("cardTypeList", cardType);
                                                    request.setAttribute("paymentList", payment);
                                                    request.setAttribute("phoneNumberList", phoneNumber);
                                                    request.setAttribute("privilegeList", privilege);
                                                    request.setAttribute("roomAmenitiesList", roomAmenities);
                                                    request.setAttribute("usersList", users);
                                                    // report
                                                    request.setAttribute("reservationResults", false);



                                                           
                                                    
                                                %>
<!DOCTYPE html>
    <head>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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
        <!-- Owl Slider -->
        <!-- <link rel="stylesheet" href="<c:url value="/css/owl.carousel.css"/>"> -->
        <!-- <link rel="stylesheet" href="<c:url value="/css/owl.theme.default.min.css"/>"> -->
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
        
                <!-- Admin Style --> 
        <link rel="stylesheet" href="<c:url value="/resources/css/adminstyle.css"/>">

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
                                <h1 id="fh5co-logo"><a href="#">ADMINISTRATOR PANEL</a></h1>
                                <nav id="fh5co-menu-wrap" role="navigation">
                                    <ul class="sf-menu" id="fh5co-primary-menu">
                                        <li>
                                            <a href="#table-data" class="fh5co-sub-ddown">View Database Tables</a>
                                            <ul class="fh5co-sub-menu">
                                                <li>
                                                    <a href="#reservations-view-section" class="fh5co-sub-ddown">Room Data</a>
                                                    <ul class="fh5co-sub-menu">
                                                        <li><a href="#reservations-view-section">Reservations</a></li>
                                                        <li><a href="#rooms-view-section">Rooms</a></li>
                                                        <li><a href="#roomtypes-view-section">Room Types</a></li>
                                                        <li><a href="#amenities-view-section">Amenities</a></li>
                                                        <li><a href="#roomamenities-view-section">Room Amenities (Join Table)</a></li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <a href="#users-view-section" class="fh5co-sub-ddown">User Data</a>
                                                    <ul class="fh5co-sub-menu">
                                                        <li><a href="#users-view-section">Users</a></li>
                                                        <li><a href="#customers-view-section">Customers</a></li>
                                                        <li><a href="#addresses-view-section">Addresses</a></li>
                                                        <li><a href="#phonenumbers-view-section">Phone Numbers</a></li>
                                                        <li><a href="#privileges-view-section">Privileges</a></li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <a href="#payment-view-section" class="fh5co-sub-ddown">Financial Data</a>
                                                    <ul class="fh5co-sub-menu">
                                                        <li><a href="#payments-view-section">Payments</a></li>
                                                        <li><a href="#carddetails-view-section">Card Details</a></li>
                                                        <li><a href="#cardtypes-view-section">Card Types</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#table-data" class="fh5co-sub-ddown">Modify Records</a>
                                            <ul class="fh5co-sub-menu">
                                                <li>
                                                    <a href="#" class="fh5co-sub-ddown">Rooms</a>
                                                    <ul class="fh5co-sub-menu">
                                                        <li><a href="#addRoom" data-toggle="modal" data-target="#addRoom">Add</a></li>
                                                        <li><a href="#editRoom" data-toggle="modal" data-target="#editRoom">Edit</a></li>
                                                        <li><a href="#deleteRoom" data-toggle="modal" data-target="#deleteRoom">Delete</a></li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <a href="#" class="fh5co-sub-ddown">Reservations</a>
                                                    <ul class="fh5co-sub-menu">
                                                        <li><a href="#addReservation" data-toggle="modal" data-target="#addReservation">Add</a></li>
                                                        <li><a href="#editReservation" data-toggle="modal" data-target="#editReservation">Edit</a></li>
                                                        <li><a href="#deleteReservation" data-toggle="modal" data-target="#deleteReservation">Delete</a></li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <a href="#" class="fh5co-sub-ddown">Customers</a>
                                                    <ul class="fh5co-sub-menu">
                                                        <li><a href="#addCustomer" data-toggle="modal" data-target="#addCustomer">Add</a></li>
                                                        <li><a href="#editCustomer" data-toggle="modal" data-target="#editCustomer">Edit</a></li>
                                                        <li><a href="#deleteCustomer" data-toggle="modal" data-target="#deleteCustomer">Delete</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" class="fh5co-sub-ddown">Reservation Reports</a>
                                                    <ul class="fh5co-sub-menu">
                                                        <li><a href="#reservationReport" data-toggle="modal" data-target="#reservationReport">By Date</a></li>
                                                        <li><a href="#reservationReportCustomer" data-toggle="modal" data-target="#reservationReportCustomer">By Customer</a></li>

                                                    </ul>
                                        </li>
                                        <li><a href="<c:url value="/"/>">View Guest Page</a></li>
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
                                                <p><span>SlackerHackers Hotel Administration</span></p>
                                                <h2>Registered Customers: <%=customers.size()%> </h2>
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
                                                <p><span>SlackerHackers Hotel Administration</span></p>
                                                <h2>Total Reservations Made: <%=reservations.size()%></h2>
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
                                                <p><span>SlackerHackers Hotel Administration</span></p>
                                                <h2>Hotel Status: <%=vacancy%></h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </div>
                </aside>
	
	<div class="section-header" id="table-data">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="text-center">
						<h2 class="section-header">Table Data</h2>
					</div>
				</div>
			</div>
                    <div class="row">
				<div class="col-lg-12 center-block">
                                    <div class="table-section">
                                        <p id="reservations-view-section"> Reservations </p>
                                        
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> Reservation ID </th>
        <th> Date In </th>
        <th> Date Out </th> 
        <th> Total Cost </th>
        <th> Room ID </th>
        <th> Customer ID </th>
        
    </tr>
<c:forEach items="${reservationList}" var="reservation">
    <tr class="active">
        <td><c:out value="${reservation.id}"/></td>
        <td><c:out value="${reservation.dateIn}"/></td> 
        <td><c:out value="${reservation.dateOut}"/></td>
        <td><c:out value="${reservation.totalCost}"/></td>
        <td><c:out value="${reservation.roomId.id}"/></td>
        <td><c:out value="${reservation.customerId.id}"/></td>

        <!-- Note, some OneToMany values are missing due to being null? --> 
    </tr>
</c:forEach>
</table> 

                                    </div>
				</div>
			</div> <!-- reservations --> 
                    <div class="row">
				<div class="col-lg-12 center-block">
                                    <div class="table-section">
                                        <p id="rooms-view-section"> Rooms </p>
                                        
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> Room ID </th>
        <th> Name </th>
        <th> Floor </th> 
        <th> Room Type </th>
        <th> Usable </th>
        </th>
    </tr>
<c:forEach items="${roomList}" var="room">
    <tr class="active">
        <td><c:out value="${room.id}"/></td>
        <td><c:out value="${room.roomName}"/></td> 
        <td><c:out value="${room.floor}"/></td>
        <td><c:out value="${room.roomTypeId.type}"/> </td>  
        <td><c:out value="${room.usable}"/></td>
        <!-- Note, some OneToMany values are missing e.g. roomAmenities and reservationCollection due to being null? --> 
    </tr>
</c:forEach>
</table> 

                                    </div>
				</div>
			</div> <!-- rooms --> 
                    <div class="row">
				<div class="col-lg-12 center-block">
                                    <div class="table-section">
                                        <p id="roomtypes-view-section"> Room Types </p>
                                        
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> Room Type ID </th>
        <th> Type </th>
        <th> Capacity </th> 
        <th> Nightly Cost </th>
        
    </tr>
<c:forEach items="${roomTypeList}" var="roomType">
    <tr class="active">
        <td><c:out value="${roomType.id}"/></td>
        <td><c:out value="${roomType.type}"/></td> 
        <td><c:out value="${roomType.capacity}"/></td>
        <td><c:out value="${roomType.nightlyCost}"/> </td>  
        <!-- Note, some OneToMany values are missing e.g. room id, due to being null? --> 
    </tr>
</c:forEach>
</table> 

                                    </div>
				</div>
			</div> <!-- room types --> 
                    <div class="row">
				<div class="col-lg-12 center-block">
                                    <div class="table-section">
                                        <p id="amenities-view-section"> Amenities </p>
                                        
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> Amenities ID </th>
        <th> Description </th>
        
    </tr>
<c:forEach items="${amenitiesList}" var="amenities">
    <tr class="active">
        <td><c:out value="${amenities.id}"/></td>
        <td><c:out value="${amenities.description}"/></td> 
        <!-- Note, some OneToMany values are missing due to being null? --> 
    </tr>
</c:forEach>
</table> 

                                    </div>
				</div>
			</div> <!-- amenities --> 
                    <div class="row">
				<div class="col-lg-12 center-block">
                                    <div class="table-section">
                                        <p id="roomamenities-view-section"> Room Amenities (Join Table) </p>
                                        
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> Room Amenities ID </th>
        <th> Room ID </th>
        <th> Amenities ID </th>
    </tr>
<c:forEach items="${roomAmenitiesList}" var="ra">
    <tr class="active">
        <td><c:out value="${ra.id}"/></td>
        <td><c:out value="${ra.roomId.id}"/></td> 
        <td><c:out value="${ra.amenitiesId.id}"/></td> 
        <!-- Note, some OneToMany values are missing due to being null? --> 
    </tr>
</c:forEach>
</table> 

                                    </div>
				</div>
			</div> <!-- room amenities join table -->


                    <div class="row">
				<div class="col-lg-12 center-block">
                                    <div class="table-section">
                                        <p id="users-view-section"> Users </p>
                                        
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> User ID </th>
        <th> Name </th>
        <th> Password </th>
        <th> Email </th> 
        <th> Privilege Type </th>
    </tr>
<c:forEach items="${usersList}" var="user">
    <tr class="active">
        <td><c:out value="${user.id}"/></td>
        <td><c:out value="${user.name}"/></td> 
        <td><c:out value="${user.password}"/></td> 
        <td><c:out value="${user.email}"/></td>
        <td><c:out value="${user.privilegeId.description}"/></td> 
        <!-- Note, some OneToMany values are missing due to being null? --> 
    </tr>
</c:forEach>
</table> 

                                    </div>
				</div>
			</div> <!-- users --> 
                    <div class="row">
				<div class="col-lg-12 center-block">
                                    <div class="table-section">
                                        <p id="customers-view-section"> Customers </p>
                                        
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> Customer ID </th>
        <th> Name </th>
        <th> Email </th> 
        <th> Password </th>
    </tr>
<c:forEach items="${customerList}" var="customer">
    <tr class="active">
        <td><c:out value="${customer.id}"/></td>
        <td><c:out value="${customer.name}"/></td> 
        <td><c:out value="${customer.email}"/></td>
        <td><c:out value="${customer.password}"/></td>
        <!-- Note, some OneToMany values are missing due to being null? --> 
    </tr>
</c:forEach>
</table> 

                                    </div>
				</div>
			</div> <!-- customers --> 
                    <div class="row">
				<div class="col-lg-12 center-block">
                                    <div class="table-section">
                                        <p id="addresses-view-section"> Addresses </p>
                                        
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> Address ID </th>
        <th> Customer </th>
        <th> Street </th>
        <th> City </th> 
        <th> Province </th>
        <th> Postal Code </th>
        <th> Country </th>
        
    </tr>
<c:forEach items="${addressList}" var="address">
    <tr class="active">
        <td><c:out value="${address.id}"/></td>
        <td><c:out value="${address.customerId.name}"/></td> 
        <td><c:out value="${address.street}"/></td> 
        <td><c:out value="${address.city}"/></td>
        <td><c:out value="${address.province}"/></td>
        <td><c:out value="${address.postalCode}"/></td>
        <td><c:out value="${address.country}"/></td>

        <!-- Note, some OneToMany values are missing due to being null? --> 
    </tr>
</c:forEach>
</table> 

                                    </div>
				</div>
			</div> <!-- addresses -->
                    <div class="row">
				<div class="col-lg-12 center-block">
                                    <div class="table-section">
                                        <p id="phonenumbers-view-section"> Phone Numbers </p>
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> Card Type ID </th>
        <th> Phone Number </th>
        <th> Customer Name </th>
        
    </tr>
<c:forEach items="${phoneNumberList}" var="phonevar">
    <tr class="active">
        <td><c:out value="${phonevar.id}"/></td>
        <td><c:out value="${phonevar.phone}"/></td> 
        <td><c:out value="${phonevar.customerId.name}"/></td> 
        <!-- Note, some OneToMany values are missing due to being null? --> 
    </tr>
</c:forEach>
</table> 

                                    </div>
				</div>
			</div> <!-- phone numbers --> 
                    <div class="row">
				<div class="col-lg-12 center-block">
                                    <div class="table-section">
                                        <p id="privileges-view-section"> Privileges </p>
                                        
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> Privilege ID </th>
        <th> Description </th>
    </tr>
<c:forEach items="${privilegeList}" var="priv">
    <tr class="active">
        <td><c:out value="${priv.id}"/></td>
        <td><c:out value="${priv.description}"/></td> 
        <!-- Note, some OneToMany values are missing due to being null? --> 
    </tr>
</c:forEach>
</table> 

                                    </div>
				</div>
			</div> <!-- privileges --> 


                    <div class="row">
				<div class="col-lg-12 center-block">
                                    <div class="table-section">
                                        <p id="payments-view-section"> Payments </p>
                                        
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> Payment ID </th>
        <th> Reservation ID </th>
        <th> Amount </th>
        <th> Card Type </th>
    </tr>
<c:forEach items="${paymentList}" var="payment">
    <tr class="active">
        <td><c:out value="${payment.id}"/></td>
        <td><c:out value="${payment.reservationId.id}"/></td> 
        <td><c:out value="${payment.amount}"/></td> 
        <td><c:out value="${payment.cardDetailsId.id}"/></td> 

        <!-- Note, some OneToMany values are missing due to being null? --> 
    </tr>
</c:forEach>
</table> 

                                    </div>
				</div>
			</div> <!-- payment --> 
                    <div class="row">
				<div class="col-lg-12 center-block">
                                    <div class="table-section">
                                        <p id="carddetails-view-section"> Card Details </p>
                                        
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> Card Details ID </th>
        <th> Card Type </th>    
        <th> Name on Card </th>
        <th> Customer ID </th>
        <th> Card Number </th>


    </tr>
<c:forEach items="${cardDetailsList}" var="details">
    <tr class="active">
        <td><c:out value="${details.id}"/></td>
        <td><c:out value="${details.cardTypeId.type}"/></td> 
        <td><c:out value="${details.nameOnCard}"/></td> 
        <td><c:out value="${details.customerId.id}"/></td> 
        <td><c:out value="${details.cardNumber}"/></td> 

        <!-- Note, some OneToMany values are missing due to being null? --> 
    </tr>
</c:forEach>
</table> 

                                    </div>
				</div>
			</div> <!-- card details --> 
                    <div class="row">
				<div class="col-lg-12 center-block">
                                    <div class="table-section">
                                        <p id="cardtypes-view-section"> Card Types </p>
                                        
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> Card Type ID </th>
        <th> Type </th>
        
    </tr>
<c:forEach items="${cardTypeList}" var="ctype">
    <tr class="active">
        <td><c:out value="${ctype.id}"/></td>
        <td><c:out value="${ctype.type}"/></td> 
        <!-- Note, some OneToMany values are missing due to being null? --> 
    </tr>
</c:forEach>
</table> 

                                    </div>
				</div>
			</div> <!-- card types --> 
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
				
			</div>
		</div>
	</footer>

	</div>
	<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->
	
        <!--modals-->
 <div id="reservationReportCustomer" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Generate Reservation Report</h4>
            </div>
        <div class="modal-body">
            <p class="alert alert-info text-center"> Select a customer to print a report of their reservations in the system. </p>
        <form method="get">            
            <div class="form-group">
            <label for="customerId">Customer Name:</label>
                <select class="form-control" id="customerId" name="customerId">
                    <c:forEach items="${customerList}" var="cust">
                        <option value="${cust.id}">
                            ${cust.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group text-center">
               <button type="submit" class="btn btn-default" name="submitReportReservationCustomer" id="submitReportReservationCustomer">Generate Report</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div> <!-- reservation report by customer --> 
        
<div id="reservationReport" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Generate Reservation Report</h4>
            </div>
        <div class="modal-body">
            <p class="alert alert-info text-center"> Select a range of check-in dates to print a report of the reservations in the system. </p>
        <form method="get">            <div class="form-group">
                <label for="startDate">Start Date:</label>
                <input type="date" class="form-control" id="startDate" name="startDate" required>
            </div>
            <div class="form-group">
                <label for="endDate">End Date:</label>
                <input type="date" class="form-control" id="endDate" name="endDate" required>
            </div>
            <div class="form-group text-center">
               <button type="submit" class="btn btn-default" name="submitReportReservation" id="submitReportReservation">Generate Report</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div> <!-- reservation report --> 
        <div id="editReservation" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit a Reservation</h4>
            </div>
        <div class="modal-body">
        <form method="get">
            <div class="form-group">
                <label for="reservationId">Reservation Id:</label>
                <select class="form-control" id="roomId" name="reservationId">
                    <c:forEach items="${reservationList}" var="rm">
                        <option value="${rm.id}">
                            ${rm.id}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="dateIn">New Check-In Date:</label>
                <input type="date" class="form-control" id="dateIn" name="dateIn" required>
            </div>
            <div class="form-group">
                <label for="dateOut">New Check-Out Date:</label>
                <input type="date" class="form-control" id="dateOut" name="dateOut" required>
            </div>
            <div class="form-group">
                <label for="totalCost">New Total Cost:</label>
                <input type="number" class="form-control" id="totalCost" name="totalCost" step="0.01" min="0" required>
            </div>
            <div class="form-group">
                <label for="roomName">New Room Name:</label>
                <select class="form-control" id="roomId" name="roomId">
                    <c:forEach items="${roomList}" var="rm">
                        <option value="${rm.id}">
                            ${rm.roomName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="customerId">New Customer Name:</label>
                <select class="form-control" id="customerId" name="customerId">
                    <c:forEach items="${customerList}" var="cust">
                        <option value="${cust.id}">
                            ${cust.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group text-center">
               <button type="submit" class="btn btn-default" name="submitEditReservation" id="submitEditReservation">Edit Reservation</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div> <!-- edit reservation modal --> 
<div id="editRoom" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit a Room</h4>
            </div>
        <div class="modal-body">
        <form method="get">
            <div class="form-group">
                <label for="roomId">Room Id:</label>
                <select class="form-control" id="roomId" name="roomId">
                    <c:forEach items="${roomList}" var="rm">
                        <option value="${rm.id}">
                            ${rm.id}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="roomName">New Room Name:</label>
                <input type="text" class="form-control" id="roomName" name="roomName" required>
            </div>
            <div class="form-group">
                <label for="floorNumber">New Floor Number:</label>
                <select class="form-control" id="floorNumber" name="floorNumber"> 
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <div class="form-group">
                <label for="roomName">New Room Type:</label>
                <select class="form-control" id="roomType" name="roomType">
                    <c:forEach items="${roomTypeList}" var="rm">
                        <option value="${rm.id}">
                            ${rm.type}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group text-center">
               <button type="submit" class="btn btn-default" name="submitEditRoom" id="submitEditRoom">Edit Room</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div> <!-- edit room modal --> 
<div id="editCustomer" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit a Customer</h4>
            </div>
        <div class="modal-body">
        <form method="get">
            <div class="form-group">
                <label for="customerId">Customer Id:</label>
                <select class="form-control" id="customerId" name="customerId">
                    <c:forEach items="${customerList}" var="rm">
                        <option value="${rm.id}">
                            ${rm.id}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="name">New Customer Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="" required>
            </div>
            <div class="form-group">
                <label for="email">New Email:</label>
                <input type="email" class="form-control" id="email"name="email" required>
            </div>
            <div class="form-group">
                <label for="password">New Password:</label>
                <input type="password" class="form-control" id="password"name="password" required>
            </div>
            <div class="form-group text-center">
               <button type="submit" class="btn btn-default" name="submitEditCustomer" id="submitEditCustomer">Edit Customer</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div> <!-- edit customer modal --> 
<div id="addCustomer" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add a Customer</h4>
            </div>
        <div class="modal-body">
        <form method="get">
            <div class="form-group">
                <label for="name">Customer Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group text-center">
               <button type="submit" class="btn btn-default" name="submitAddCustomer" id="submitAddCustomer">Add Customer</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div> <!-- add customer modal --> 
<div id="addReservation" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add a Reservation</h4>
            </div>
        <div class="modal-body">
        <form method="get">
            <div class="form-group">
                <label for="dateIn">Check-In Date:</label>
                <input type="date" class="form-control" id="dateIn" name="dateIn" required>
            </div>
            <div class="form-group">
                <label for="dateOut">Check-Out Date:</label>
                <input type="date" class="form-control" id="dateOut" name="dateOut" required>
            </div>
            <div class="form-group">
                <label for="totalCost">Total Cost:</label>
                <input type="number" class="form-control" id="totalCost" name="totalCost" step="0.01" min="0" required>
            </div>
            <div class="form-group">
                <label for="roomName">Room Name:</label>
                <select class="form-control" id="roomId" name="roomId">
                    <c:forEach items="${roomList}" var="rm">
                        <option value="${rm.id}">
                            ${rm.roomName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="customerId">Customer Name:</label>
                <select class="form-control" id="customerId" name="customerId">
                    <c:forEach items="${customerList}" var="cust">
                        <option value="${cust.id}">
                            ${cust.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group text-center">
               <button type="submit" class="btn btn-default" name="submitAddReservation" id="submitAddReservation">Add Reservation</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div> <!-- add reservation modal --> 
<div id="addRoom" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add a Room</h4>
            </div>
        <div class="modal-body">
        <form method="get">
            <div class="form-group">
                <label for="roomName">Room Name:</label>
                <input type="text" class="form-control" id="roomName" name="roomName" required>
            </div>
            <div class="form-group">
                <label for="floorNumber">Floor Number:</label>
                <select class="form-control" id="floorNumber" name="floorNumber"> 
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <div class="form-group">
                <label for="roomName">Room Type:</label>
                <select class="form-control" id="roomType" name="roomType">
                    <c:forEach items="${roomTypeList}" var="rm">
                        <option value="${rm.id}">
                            ${rm.type}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group text-center">
               <button type="submit" class="btn btn-default" name="submitAddRoom" id="submitAddRoom">Add Room</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div> <!-- add room modal --> 
<div id="deleteRoom" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Delete a Room</h4>
            </div>
        <div class="modal-body">
        <form method="get">
            <div class="form-group">
                <label for="roomId">Room Name:</label>
                <select class="form-control" id="roomId" name="roomId">
                    <c:forEach items="${roomList}" var="rm">
                        <option value="${rm.id}">
                            ${rm.roomName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group text-center">
               <button type="submit" class="btn btn-default" name="submitDeleteRoom" id="submitDeleteRoom">Delete Room</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div> <!-- delete room modal --> 
<div id="deleteReservation" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Delete a Reservation</h4>
            </div>
        <div class="modal-body">
        <form method="get">
            <div class="form-group">
                <label for="reservationId">Reservation Id:</label>
                <select class="form-control" id="reservationId" name="reservationId">
                    <c:forEach items="${reservationList}" var="rm">
                        <option value="${rm.id}">
                            ${rm.id}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group text-center">
               <button type="submit" class="btn btn-default" name="submitDeleteReservation" id="submitDeleteRoom">Delete Reservation</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div> <!-- delete reservation modal --> 
<div id="deleteCustomer" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Delete a Customer</h4>
            </div>
        <div class="modal-body">
        <form method="get">
            <div class="form-group">
                <label for="customerId">Customer Name:</label>
                <select class="form-control" id="customerId" name="customerId">
                    <c:forEach items="${customerList}" var="rm">
                        <option value="${rm.id}">
                            ${rm.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group text-center">
               <button type="submit" class="btn btn-default" name="submitDeleteCustomer" id="submitDeleteCustomer">Delete Customer</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div> <!-- delete customer modal --> 
<%
    
    String submitReportReservationCustomer = request.getParameter("submitReportReservationCustomer");
    if (submitReportReservationCustomer != null) {
        specificReservations = new ArrayList<Reservation>(); 
        
        for (Reservation res : reservations) {
            if (res.getCustomerId().getId().equals(Integer.parseInt(request.getParameter("customerId")))) {
                specificReservations.add(res);
            }
        }
        
        if (specificReservations.size() > 0) {
            request.setAttribute("reservationResults", true);
            request.setAttribute("specificReservations", specificReservations);
        }
        %>
            <script language="JavaScript">
                $(document).ready(function() {
                   $('#reservationReportResults').modal('show'); 
                });
                         </script>
                <%
                    
                    
                    
    }
    
    
    
    
    String submitReportReservation = request.getParameter("submitReportReservation");
    if (submitReportReservation != null) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = format.parse(request.getParameter("startDate"));
        Date endDate = format.parse(request.getParameter("endDate"));
                
        specificReservations = new ArrayList<Reservation>(); 
        
        for (Reservation res : reservations) {
            if ((res.getDateIn().equals(startDate) ||
                    res.getDateIn().after(startDate)) &&
                    res.getDateIn().equals(endDate) ||
                    res.getDateIn().before(endDate)){
                specificReservations.add(res);
            }
        }
        
        if (specificReservations.size() > 0) {
            request.setAttribute("reservationResults", true);
            request.setAttribute("specificReservations", specificReservations);
        }
        %>
            <script language="JavaScript">
                $(document).ready(function() {
                   $('#reservationReportResults').modal('show'); 
                });
                         </script>
                <%
                    
    }
    
    
    
    String submitDeleteCustomer = request.getParameter("submitDeleteCustomer");
    if (submitDeleteCustomer != null) {
        entitySession.delete(Customer.class, Integer.parseInt(request.getParameter("customerId")));
                %> 
        <script language="JavaScript">window.location.href = "<c:url value="/admin/#customers-view-section"/>";
                                       //alert('test');
                                    </script>
        <%
        
    }
    
    
    String submitDeleteReservation = request.getParameter("submitDeleteReservation");
    if (submitDeleteReservation != null) {
        entitySession.delete(Reservation.class, Integer.parseInt(request.getParameter("reservationId")));
                %> 
        <script language="JavaScript">window.location.href = "<c:url value="/admin/#reservations-view-section"/>";
                                       //alert('test');
                                    </script>
        <%
        
    }
    
    
    
    String submitDeleteRoom = request.getParameter("submitDeleteRoom");
    if (submitDeleteRoom != null) {
        entitySession.delete(Room.class, Integer.parseInt(request.getParameter("roomId")));
                %> 
        <script language="JavaScript">window.location.href = "<c:url value="/admin/#rooms-view-section"/>";
                                       //alert('test');
                                    </script>
        <%
        
    }
    
    
    String submitAddCustomer = request.getParameter("submitAddCustomer");
    if (submitAddCustomer != null) {
        Customer newCustomer = new Customer();
        newCustomer.setName(request.getParameter("name"));
        newCustomer.setEmail(request.getParameter("email"));
        newCustomer.setPassword(request.getParameter("password"));
        newCustomer.setAddressCollection(null);
        newCustomer.setCardDetailsCollection(null);
        newCustomer.setPhoneNumberCollection(null);
        newCustomer.setReservationCollection(null);
        
        entitySession.insert(newCustomer);
        
        submitAddCustomer = null;
        
                %> 
        <script language="JavaScript">window.location.href = "<c:url value="/admin/#customers-view-section"/>";
                                       //alert('test');
                                    </script>
        <%
        
    }

    String submitEditRoom = request.getParameter("submitEditRoom");
    if (submitEditRoom != null) {
        Room newRoom = entitySession.find(Room.class, Integer.parseInt(request.getParameter("roomId")));
        String roomName = request.getParameter("roomName");
        int floorNumber = Integer.parseInt(request.getParameter("floorNumber"));
        int roomType = Integer.parseInt(request.getParameter("roomType"));
        newRoom.setRoomName(roomName);
        RoomType chosenType = entitySession.find(RoomType.class, roomType);
        newRoom.setRoomTypeId(chosenType);
        newRoom.setFloor(floorNumber);
        
        entitySession.update(newRoom);
        
        submitEditRoom = null; 
        
        %> 
        <script language="JavaScript">window.location.href = "<c:url value="/admin/#rooms-view-section"/>";
                                       //alert('test');
                                    </script>
        <%
    }
    

    String submitEditCustomer = request.getParameter("submitEditCustomer");
    if (submitEditCustomer != null) {
        Customer newCustomer = new Customer();
        newCustomer.setId(Integer.parseInt(request.getParameter("customerId")));
        newCustomer.setName(request.getParameter("name"));
        newCustomer.setEmail(request.getParameter("email"));
        newCustomer.setPassword(request.getParameter("password"));
        newCustomer.setAddressCollection(null);
        newCustomer.setCardDetailsCollection(null);
        newCustomer.setPhoneNumberCollection(null);
        newCustomer.setReservationCollection(null);
        entitySession.update(newCustomer);

        submitEditCustomer = null;
        
                %> 
        <script language="JavaScript">window.location.href = "<c:url value="/admin/#customers-view-section"/>";
                                       //alert('test');
                                    </script>
        <%
        
    }


    String submitEditReservation = request.getParameter("submitEditReservation");
    if (submitEditReservation != null) {   
        Reservation newReservation = entitySession.find(Reservation.class, Integer.parseInt(request.getParameter("reservationId")));
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date dateIn = format.parse(request.getParameter("dateIn"));
        Date dateOut = format.parse(request.getParameter("dateOut"));
        double totalCost = Double.parseDouble(request.getParameter("totalCost"));
        Room chosenRoom = entitySession.find(Room.class, Integer.parseInt(request.getParameter("roomId")));
        Customer chosenCustomer = entitySession.find(Customer.class, Integer.parseInt(request.getParameter("customerId")));
        
        newReservation.setDateIn(dateIn);
        newReservation.setDateOut(dateOut);
        newReservation.setTotalCost(totalCost);
        newReservation.setRoomId(chosenRoom);
        newReservation.setCustomerId(chosenCustomer);
        newReservation.setPaymentCollection(null);
        
        entitySession.update(newReservation);
        
        submitEditReservation = null;
        
        %> 
        <script language="JavaScript">window.location.href = "<c:url value="/admin/#reservations-view-section"/>";
                                       //alert('test');
                                    </script>
        <%
                
    }

    String submitAddReservation = request.getParameter("submitAddReservation");
    if (submitAddReservation != null) {        
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date dateIn = format.parse(request.getParameter("dateIn"));
        Date dateOut = format.parse(request.getParameter("dateOut"));
        double totalCost = Double.parseDouble(request.getParameter("totalCost"));
        Room chosenRoom = entitySession.find(Room.class, Integer.parseInt(request.getParameter("roomId")));
        Customer chosenCustomer = entitySession.find(Customer.class, Integer.parseInt(request.getParameter("customerId")));
        
        Reservation newReservation = new Reservation();
        newReservation.setDateIn(dateIn);
        newReservation.setDateOut(dateOut);
        newReservation.setTotalCost(totalCost);
        newReservation.setRoomId(chosenRoom);
        newReservation.setCustomerId(chosenCustomer);
        newReservation.setPaymentCollection(null);
        
        entitySession.insert(newReservation);
        
        submitAddReservation = null;
        
        %> 
        <script language="JavaScript">window.location.href = "<c:url value="/admin/#reservations-view-section"/>";
                                       //alert('test');
                                    </script>
        <%
                
    }
    
    
    
    
    
    
    String submitAddRoom = request.getParameter("submitAddRoom");
    if (submitAddRoom != null) {
        String roomName = request.getParameter("roomName");
        int floorNumber = Integer.parseInt(request.getParameter("floorNumber"));
        int roomType = Integer.parseInt(request.getParameter("roomType"));
        Room newRoom = new Room();
        newRoom.setRoomName(roomName);
        RoomType chosenType = entitySession.find(RoomType.class, roomType);
        newRoom.setRoomTypeId(chosenType);
        newRoom.setFloor(floorNumber);
        newRoom.setReservationCollection(null);
        newRoom.setRoomAmenitiesCollection(null);
        newRoom.setUsable(true);
        entitySession.insert(newRoom);
        
        submitAddRoom = null; 
        
        %> 
        <script language="JavaScript">window.location.href = "<c:url value="/admin/#rooms-view-section"/>";
                                       //alert('test');
                                    </script>
        <%
    }
    %>
    
    
    
        
               <div id="reservationReportResults" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">Reservation Report Results</h4>
             </div>
      <div class="modal-body">
          <div class="row">
				<div class="col-lg-12 center-block">
                                        <c:choose> 
                                        <c:when test="${reservationResults}">
                                    <div class="table-section">            

                                           
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> Reservation ID </th>
        <th> Date In </th>
        <th> Date Out </th> 
        <th> Total Cost </th>
        <th> Room ID </th>
        <th> Customer ID </th>
    </tr>
<c:forEach items="${specificReservations}" var="reservation">
    <tr class="active">
        <td><c:out value="${reservation.id}"/></td>
        <td><c:out value="${reservation.dateIn}"/></td> 
        <td><c:out value="${reservation.dateOut}"/></td>
        <td><c:out value="${reservation.totalCost}"/></td>
        <td><c:out value="${reservation.roomId.id}"/></td>
        <td><c:out value="${reservation.customerId.id}"/></td>

    </tr>
</c:forEach>
</table> 

                                    </div>
                                    </c:when>
<c:otherwise>
<p class="alert alert-danger text-center"> No results found. </p>
<% 
            request.setAttribute("reservationResults", false);
            request.setAttribute("specificReservations", null);
            %> 
</c:otherwise>
                                        </c:choose>
				</div>
			</div>
      </div>
    </div>
  </div>
</div> <!-- reservation report results --> 
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