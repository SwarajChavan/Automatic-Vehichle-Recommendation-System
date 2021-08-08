<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
							<div id="colorlib-logo"><a href="customer-index">Home</a></div>
						</div>
						<div class="col-xs-10 text-right menu-1">
							<ul>
							<!-- 	<li class="active"><a href="customer-index">Home</a></li> -->
								<li class="has-dropdown">
									<a href="#">Buy</a>
									<ul class="dropdown">
										<li><a href="customer-viewvehicle?type=Car&stat=Sell">Car</a></li>
										<li><a href="customer-viewbikes?type=Bike&stat=Sell">Bike</a></li>
									</ul>
								</li>
								<li class="has-dropdown">
									<a href="#">Rent</a>
									<ul class="dropdown">
										<li><a href="customer-viewvehicle?type=Car&stat=Rent">Car</a></li>
										<li><a href="customer-viewbikes?type=Bike&stat=Rent">Bike</a></li>
									</ul>
								</li>
	<!-- 							<li class="has-dropdown">
									<a href="#">Recommendations</a>
									<ul class="dropdown">
										<li><a href="buyrecommendation">Buy</a></li>
										<li><a href="rentrecommendation">Rent</a></li>
									</ul>
								</li> -->
								<li><a href="customer-rentdriver">Hire Driver</a></li>
	<!-- 							<li><a href="about.html">About</a></li>
								<li><a href="contact.html">Contact</a></li> -->
								<li>
            <form class="form-inline" style="display: inline-block;" method="post" action="CustomerSearch">
            <input class="form-control" name="search" type="search" placeholder="Search" aria-label="Search" style="width:250px; outline-style: auto;" >
            <button type="submit" class="btn btn-outline-success"><i class="fas fa-search"></i></button>
            </form>
          </li>
								
								<li class="has-dropdown">
									<a href="#">Welcome,<%=name %> </a>
									<ul class="dropdown">
										<li><a href="customer-updateprofile">Update Profile</a></li>
										<li><a href="customer-checkmessages">Check Messages</a></li>
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