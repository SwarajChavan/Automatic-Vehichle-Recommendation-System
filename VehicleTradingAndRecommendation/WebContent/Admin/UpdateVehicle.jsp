<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utility.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Store Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700"
	rel="stylesheet">

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
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

</head>
<body>

	<div class="colorlib-loader"></div>

	<div id="page">
		<jsp:include page="/admin-header"></jsp:include>
		<!-- <aside id="colorlib-hero" class="breadcrumbs">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(images/cover-img-1.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h1>Contact</h1>
				   					<h2 class="bread"><span><a href="index.html">Home</a></span> <span>Contact</span></h2>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside> -->
		<%
			String name = (String) session.getAttribute("name");
			String email = (String) session.getAttribute("email");
			String id=request.getParameter("id");
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from vehicle where id=?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
		%>
		<div id="colorlib-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<h3>Dealer Update Profile</h3>
					</div>
					<div class="col-md-10 col-md-offset-1">
						<div class="contact-wrap">
							<form action="AdminUpdateVehicle" method="post">
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="offname">Vehicle Registration No.</label> <input
											type="text" id="vehicle" name="vehicle" class="form-control"
											placeholder="Vehicle Registration No." readonly="readonly" value="<%=rs.getString("regno")%>">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="offname">Type of Vehicle</label> <input
											type="text" id="type" name="type" class="form-control"
											placeholder="Type" readonly="readonly" value="<%=rs.getString("type")%>">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="offname">Brand</label> <input type="text"
											id="brand" class="form-control" name="brand"
											placeholder="Brand" readonly="readonly" value="<%=rs.getString("brand")%>">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="offname">Vehicle Type</label> <input type="text"
											id="vehicletype" class="form-control" name="vehicletype"
											placeholder="Vehicle Type" readonly="readonly"  value="<%=rs.getString("vehicletype")%>"> 
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="model">Model</label> <input type="text" id="model"
											name="model" class="form-control" placeholder="Vehicle Model"
											required="required"  value="<%=rs.getString("model")%>">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="myear">Manufacturing Year</label> <input
											type="text" id="myear" name="myear" class="form-control"
											placeholder="Manufacturing Year" required="required"  value="<%=rs.getString("myear")%>">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="offname">Used(in years)</label> <input
											type="number" id="used" name="used" class="form-control"
											placeholder="Used(in years)" required="required"  value="<%=rs.getString("yearsused")%>">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="offname">Kms Driven</label> <input type="number"
											id="kms" name="kms" class="form-control"
											placeholder="Kms Driven" required="required"  value="<%=rs.getString("kmsdriven")%>">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="offname">Mileage(in KM/l)</label> <input
											type="number" id="milage" name="milage" class="form-control"
											placeholder="Vehicle Milage" required="required"  value="<%=rs.getString("milage")%>">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="offname">Price (in &#8377;)</label> <input
											type="number" id="price" name="price" class="form-control"
											placeholder="Vehicle Price" required="required"  value="<%=rs.getString("price")%>">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<div class="col-md-12">
											<label for="offname">Fuel Type</label>
										</div>
										<%
										if(rs.getString("fuel").equals("Petrol")){
										%>
										<div class="col-md-4">
											<input type="radio" value="Petrol" id="Petrol" name="fuel"
												required="required" checked="checked"><label for="Petrol">Petrol</label>
										</div>
										<div class="col-md-4">
											<input type="radio" value="Diesel" id="Diesel" name="fuel"
												required="required"><label for="Diesel">Diesel</label>
										</div>
										<div class="col-md-4">
											<input type="radio" value="CNG" id="CNG" name="fuel"
												required="required"><label for="CNG">CNG</label>
										</div>
										<%}else if(rs.getString("fuel").equals("Diesel")){ %>
										<div class="col-md-4">
											<input type="radio" value="Petrol" id="Petrol" name="fuel"
												required="required"><label for="Petrol">Petrol</label>
										</div>
										<div class="col-md-4">
											<input type="radio" value="Diesel" id="Diesel" name="fuel"
												required="required" checked="checked"><label for="Diesel">Diesel</label>
										</div>
										<div class="col-md-4">
											<input type="radio" value="CNG" id="CNG" name="fuel"
												required="required"><label for="CNG">CNG</label>
										</div>
										<%}else{ %>
										<div class="col-md-4">
											<input type="radio" value="Petrol" id="Petrol" name="fuel"
												required="required" checked="checked"><label for="Petrol">Petrol</label>
										</div>
										<div class="col-md-4">
											<input type="radio" value="Diesel" id="Diesel" name="fuel"
												required="required"><label for="Diesel">Diesel</label>
										</div>
										<div class="col-md-4">
											<input type="radio" value="CNG" id="CNG" name="fuel"
												required="required" checked="checked"><label for="CNG">CNG</label>
										</div>
										<%} %>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<div class="col-md-12">
											<label for="offname">Purpose</label>
										</div>
										<%
										if(rs.getString("purpose").equals("Sell")){
										%>
										<div class="col-md-6">
											<input type="radio" value="Sell" id="Sell" name="purpose"
												required="required" checked="checked"><label for="Sell">Sell</label>
										</div>
										<div class="col-md-6">
											<input type="radio" value="Rent" id="Rent" name="purpose"
												required="required"><label for="Rent">Rent</label>
										</div>
										<%}else{ %>
										<div class="col-md-6">
											<input type="radio" value="Sell" id="Sell" name="purpose"
												required="required"><label for="Sell">Sell</label>
										</div>
										<div class="col-md-6">
											<input type="radio" value="Rent" id="Rent" name="purpose"
												required="required" checked="checked"><label for="Rent">Rent</label>
										</div>
										<%} %>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<div class="col-md-12">
											<label for="offname">Allow Inspection of Vehicle</label>
										</div>
										<%if(rs.getString("inspection").equals("Not Verified")){ %>
										<div class="col-md-6">
											<input type="radio" value="Not Verified" id="Yes" name="insp"
												required="required" checked="checked"><label for="Yes">Yes</label>
										</div>
										<div class="col-md-6">
											<input type="radio" value="In Process" id="No" name="insp"
												required="required"><label for="No">No</label>
										</div>
										<%}else if(rs.getString("inspection").equals("In Process")){ %>
										<div class="col-md-6">
											<input type="radio" value="Not Verified" id="Yes" name="insp"
												required="required"><label for="Yes">Yes</label>
										</div>
										<div class="col-md-6">
											<input type="radio" value="In Process" id="No" name="insp"
												required="required"  checked="checked"><label for="No">No</label>
										</div>
										<%}else{ %>
										<input
											type="text" id="insp" name="insp" class="form-control"
											placeholder="Inspection" readonly="readonly" value="<%=rs.getString("inspection")%>">
										<%} %>
									</div>
								</div>
								<div class="form-group text-center">
									<input type="submit" value="Update" class="btn btn-primary">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%
			}
			rs.close();
			ps.close();
			conn.close();
		%>
		<jsp:include page="/admin-footer"></jsp:include>
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
	<!-- Google Map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="js/google_map.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>


</body>
</html>

