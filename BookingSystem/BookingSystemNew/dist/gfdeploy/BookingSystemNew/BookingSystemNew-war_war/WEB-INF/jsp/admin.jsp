<%@page import="entity.RoomType"%>
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


<!DOCTYPE html>
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
                                <h1 id="fh5co-logo"><a href="index.html">ADMINISTRATOR PANEL</a></h1>
                                <nav id="fh5co-menu-wrap" role="navigation">
                                    <ul class="sf-menu" id="fh5co-primary-menu">
                                        <li>
                                            <a href="#table-data" class="fh5co-sub-ddown">Database Tables</a>
                                            <ul class="fh5co-sub-menu">
                                                <li>
                                                    <a href="#rooms-view-section" class="fh5co-sub-ddown">Rooms</a>
                                                    <ul class="fh5co-sub-menu">
                                                        <li><a href="#rooms-view-section">View</a></li>
                                                        <li><a href="" target="_blank">Add/Edit</a></li>
                                                        <li><a href="" target="_blank">Delete</a></li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <a href="#roomtypes-view-section" class="fh5co-sub-ddown">RoomTypes</a>
                                                    <ul class="fh5co-sub-menu">
                                                        <li><a href="#roomtypes-view-section">View</a></li>
                                                        <li><a href="" target="_blank">Add/Edit</a></li>
                                                        <li><a href="" target="_blank">Delete</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" class="fh5co-sub-ddown">Reports</a>
                                                    <ul class="fh5co-sub-menu">
                                                        <li><a href="#reservations-view-section">Reservations</a></li>
                                                        <li><a href="#customers-view-section" target="_blank">Customers</a></li>
                                                        <li><a href="" target="_blank">Finances</a></li>
                                                    </ul>
                                        </li>
                                        <li><a href="./">Guest Page</a></li>
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
                                                    request.setAttribute("roomList", rooms);
                                                    
                                                    List<RoomType> roomTypes = entitySession.getAll(RoomType.class);
                                                    request.setAttribute("roomTypeList", roomTypes);
                                                    request.setAttribute("reservationList", reservations);
                                                    request.setAttribute("customerList", customers);
                                                    
                                                    


                                                    

                                                    
                                                %>
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
			</div>
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
			</div>
                    			<div class="row">
				<div class="col-lg-12 center-block">
                                    <div class="table-section">
                                        <p id="customers-view-section"> Customers </p>
                                        
<table class="table table-bordered table-section table-hover"> 
    <tr class="success">
        <th> Customer ID </th>
        <th> Name </th>
        <th> Email </th> 
    </tr>
<c:forEach items="${customerList}" var="customer">
    <tr class="active">
        <td><c:out value="${customer.id}"/></td>
        <td><c:out value="${customer.name}"/></td> 
        <td><c:out value="${customer.email}"/></td>
        <!-- Note, some OneToMany values are missing due to being null? --> 
    </tr>
</c:forEach>
</table> 

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
				
			</div>
		</div>
	</footer>

	</div>
	<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->
	
        <!--modal TESTING-->
 <div id="bookNow" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Booking Form</h4>
      </div>
      <div class="modal-body">
       <form>
   <div class="form-group">
    <label for="firstName">First Name:</label>
    <input type="text" class="form-control" id="firstName">
  </div>
   <div class="form-group">
    <label for="lastNAme">Last Name:</label>
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