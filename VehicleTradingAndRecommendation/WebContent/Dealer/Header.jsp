<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>

<%
String name=(String) session.getAttribute("name");
String email=(String) session.getAttribute("email");
%>
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container">
					<div class="row">
						<div class="col-xs-2">
							<div id="colorlib-logo"><a href="dealer-index">Home</a></div>
						</div>
						<div class="col-xs-10 text-right menu-1">
							<ul>
							<!-- 	<li class="active"><a href="dealer-index">Home</a></li> -->
								<li class="has-dropdown">
									<a href="#">Buy</a>
									<ul class="dropdown">
										<li><a href="dealer-viewvehicle?type=Car&stat=Sell">Car</a></li>
										<li><a href="dealer-viewvehicle?type=Bike&stat=Sell">Bike</a></li>
									</ul>
								</li>
								<li class="has-dropdown">
									<a href="#">Rent</a>
									<ul class="dropdown">
										<li><a href="dealer-viewvehicle?type=Car&stat=Rent">Car</a></li>
										<li><a href="dealer-viewvehicle?type=Bike&stat=Rent">Bike</a></li>
									</ul>
								</li>
								<!-- <li><a href="dealer-about">About</a></li>
								<li><a href="dealer-contact">Contact</a></li> -->
								<li>
            <form class="form-inline" style="display: inline-block;" action="DealerSearch" method="post">
            <input class="form-control" name="search" type="search" placeholder="Search" aria-label="Search" style="width:250px; outline-style: auto;" >
            <button type="button" class="btn btn-outline-success"><i class="fas fa-search"></i></button>
            </form>
          </li>
								<!-- <li><a href="cart.html"><i class="icon-shopping-cart"></i> Cart [0]</a></li> -->
								<li><a href="dealer-addvehicle">Add Vehicles</a></li>
								<li class="has-dropdown">
									<a href="#">Welcome,<%=name %> </a>
									<ul class="dropdown">
										<li><a href="dealer-updateprofile">Update Profile</a></li>
										<li><a href="dealer-checkmessages">Check Messages</a></li>
										<li><a href="Logout">Logout</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
</body>
</html>