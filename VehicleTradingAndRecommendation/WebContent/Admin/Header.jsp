<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container">
					<div class="row">
						<div class="col-xs-2">
							<div id="colorlib-logo"><a href="admin-index">Home</a></div>
						</div>
						<div class="col-xs-10 text-right menu-1">
							<ul>
								<!-- <li class="active"><a href="admin-index">Home</a></li> -->
								<li class="has-dropdown">
									<a href="#">Buy</a>
									<ul class="dropdown">
										<li><a href="admin-viewvehicle?type=Car&stat=Sell">Car</a></li>
										<li><a href="admin-viewbikes?type=Bike&stat=Sell">Bike</a></li>
									</ul>
								</li>
								<li class="has-dropdown">
									<a href="#">Rent</a>
									<ul class="dropdown">
										<li><a href="admin-viewvehicle?type=Car&stat=Rent">Car</a></li>
										<li><a href="admin-viewbikes?type=Bike&stat=Rent">Bike</a></li>
									</ul>
								</li>
								<li><a href="admin-viewreports">Reports</a></li>
								<li>
            <form class="form-inline" style="display: inline-block;" action="AdminSearch" method="post">
            <input class="form-control" type="search" name="search" placeholder="Search" aria-label="Search" style="width:250px; outline-style: auto;" >
            <button type="submit" class="btn btn-outline-success"><i class="fas fa-search"></i></button>
            </form>
          </li>
								<!-- <li><a href="cart.html"><i class="icon-shopping-cart"></i> Cart [0]</a></li> -->
								<li class="has-dropdown">
									<a href="#">View Profile</a>
									<ul class="dropdown">
										<li><a href="admin-viewcustomer">Customer</a></li>
										<li><a href="admin-viewdealer">Dealer</a></li>
										<li><a href="admin-viewgarage">Garage</a></li>
										<li><a href="admin-viewdriver">Driver</a></li>
									</ul>
								</li>
								<li class="has-dropdown">
									<a href="#">Welcome, Admin</a>
									<ul class="dropdown">
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