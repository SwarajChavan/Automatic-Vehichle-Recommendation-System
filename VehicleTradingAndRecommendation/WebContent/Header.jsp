<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

</head>
<body>
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container">
					<div class="row">
						<div class="col-xs-2">
							<div id="colorlib-logo"><a href="index.jsp">Home</a></div>
						</div>
						<div class="col-xs-10 text-right menu-1">
							<ul>
								<!-- <li class="active"><a href="index.jsp">Home</a></li> -->
								<li class="has-dropdown">
									<a href="#">Buy</a>
									<ul class="dropdown">
										<li><a href="ViewVehicle.jsp?type=Car&stat=Sell">Car</a></li>
										<li><a href="ViewBikes.jsp?type=Bike&stat=Sell">Bike</a></li>
									</ul>
								</li>
								<li class="has-dropdown">
									<a href="#">Rent</a>
									<ul class="dropdown">
										<li><a href="ViewVehicle.jsp?type=Car&stat=Rent">Car</a></li>
										<li><a href="ViewBikes.jsp?type=Bike&stat=Rent">Bike</a></li>
									</ul>
								</li><!-- 
								<li><a href="about.html">About</a></li>
								<li><a href="contact.html">Contact</a></li> -->
								<li>
            <form class="form-inline" style="display: inline-block;" action="Search.jsp" method="post">
            <input class="form-control" type="search" name="search" placeholder="Search" aria-label="Search" style="width:250px; outline-style: auto;" >
            <button type="submit" class="btn btn-outline-success"><i class="fas fa-search"></i></button>
            </form>
          </li>
								<!-- <li><a href="cart.html"><i class="icon-shopping-cart"></i> Cart [0]</a></li> -->
								<li class="has-dropdown">
									<a href="#">Sign Up !</a>
									<ul class="dropdown">
										<li><a href="customer-registration">Consumer</a></li>
										<li><a href="dealer-registration">Dealer</a></li>
										<li><a href="garage-registration">Garage</a></li>
										<li><a href="driver-registration">Driver</a></li>
									</ul>
								</li>
								<li class="has-dropdown">
									<a href="#">Login</a>
									<ul class="dropdown">
										<li><a href="customer-login">Consumer</a></li>
										<li><a href="dealer-login">Dealer</a></li>
										<li><a href="garage-login">Garage</a></li>
										<li><a href="driver-login">Driver</a></li>
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