<%@page import="java.sql.ResultSet"%>
<%@page import="utility.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Store Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

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

	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="css/flexslider.css">

	<!-- Owl Carousel -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	
	<!-- Date Picker -->
	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
	<jsp:include page="Header.jsp"></jsp:include>
	
	<aside id="colorlib-hero">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(images/img_bg4.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 col-md-pull-2 col-sm-12 col-xs-12 slider-text">
				   				<div class="slider-text-inner">
				   					<div class="desc">
					   					<h1 class="head-1">Cars</h1>
					   					<h2 class="head-2">Buy / Rent</h2>
					   					<h2 class="head-3"></h2>
					   					<p class="category"><span>Buy and rent used cars</span></p>
					   					<p><a href="ViewVehicle.jsp?type=Car&stat=Sell" class="btn btn-primary">Buy </a>
					   					<a href="ViewVehicle.jsp?type=Car&stat=Rent" class="btn btn-primary">Rent </a></p>
				   					</div>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			   	<li style="background-image: url(images/img_bg3.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 col-md-pull-2 col-sm-12 col-xs-12 slider-text">
				   				<div class="slider-text-inner">
				   					<div class="desc">
					   					<h1 class="head-1">Bikes</h1>
					   					<h2 class="head-2">Buy / Rent</h2>
					   					<h2 class="head-3"></h2>
					   					<p class="category"><span>Buy and rent used cars</span></p>
					   					<p><a href="ViewBikes.jsp?type=Bike&stat=Sell" class="btn btn-primary">Buy</a>
					   					<a href="ViewBikes.jsp?type=Bike&stat=Rent" class="btn btn-primary">Rent</a></p>
				   					</div>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>

		<div class="colorlib-shop">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center colorlib-heading">
						<h2><span>Cars</span></h2>
						<p></p>
					</div>
				</div>
				<div class="row">
				<%
				Connection conn=DBConnection.getConnection();
				PreparedStatement ps=conn.prepareStatement("select * from vehicle where type='Car' AND inspection in ('Verified', 'Not Verified') order by id desc limit 3");
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
				%>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img" style="background-image: url(GetImages?id=<%=rs.getString("id")%>);">
								<p class="tag"><span class="new"><%=rs.getString("purpose") %></span></p>
								<div class="cart">
									<p>
										<span><a href="VehicleDetails.jsp?id=<%=rs.getString("id")%>"><i class="icon-eye"></i></a></span>
									
									</p>
								</div>
							</div>
							<div class="desc">
								<h3><a href="VehicleDetails.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("model") %></a></h3>
								<p class="price"><span>&#8377; <%=rs.getString("price") %></span></p>
							</div>
						</div>
					</div>
<%} %>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img" style="border-style: groove; border-radius: 25px;">
								<p class="tag"><span class="new">CARS</span></p><br>
								<p><strong>VIEW MORE</strong></p>
								<p><strong><a href="ViewVehicle.jsp?type=Car&stat=Rent">RENT</a></strong></p>
								<p><strong><a href="ViewVehicle.jsp?type=Car&stat=Sell">BUY</a></strong></p>
								<div class="cart">
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="colorlib-shop">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center colorlib-heading">
						<h2><span>Bikes</span></h2>
						<p></p>
					</div>
				</div>
				<div class="row">
				<%
				ps=conn.prepareStatement("select * from vehicle where type='Bike' AND inspection in ('Verified', 'Not Verified') order by id desc limit 3");
				rs=ps.executeQuery();
				while(rs.next()){
				%>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img" style="background-image: url(GetImages?id=<%=rs.getString("id")%>);">
								<p class="tag"><span class="new">New</span></p>
								<div class="cart">
									<p>
										<span><a href="VehicleDetails.jsp?id=<%=rs.getString("id")%>"><i class="icon-eye"></i></a></span>
										
									</p>
								</div>
							</div>
							<div class="desc">
								<h3><a href="VehicleDetails.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("model") %></a></h3>
								<p class="price"><span>&#8377; <%=rs.getString("price") %></span></p>
							</div>
						</div>
					</div>
<%}
				rs.close();
				ps.close();
				conn.close();
				%>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img" style="border-style: groove; border-radius: 25px;">
								<p class="tag"><span class="new">BIKES</span></p><br>
								<p><strong>VIEW MORE</strong></p>
								<p><strong><a href="ViewBikes.jsp?type=Bike&stat=Rent">RENT</a></strong></p>
								<p><strong><a href="ViewBikes.jsp?type=Bike&stat=Sell">BUY</a></strong></p>
								<div class="cart">
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	<jsp:include page="Footer.jsp"></jsp:include>

	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

	</body>
</html>

