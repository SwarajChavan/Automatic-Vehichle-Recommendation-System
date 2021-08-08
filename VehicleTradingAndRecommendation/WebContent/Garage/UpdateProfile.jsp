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
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
		<jsp:include page="/garage-header"></jsp:include>
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
String name=(String) session.getAttribute("name");
String email=(String) session.getAttribute("email");
Connection conn=DBConnection.getConnection();
PreparedStatement ps=conn.prepareStatement("select * from garage where email=?");
ps.setString(1, email);
ResultSet rs=ps.executeQuery();
if(rs.next()){
%>
		<div id="colorlib-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<h3>Garage Update Profile</h3>
					</div>
					<div class="col-md-10 col-md-offset-1">
						<div class="contact-wrap">
							<form action="GarageUpdateProfile" method="post">
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="garage">Garage Name</label>
										<input type="text" id="garage" name="garage" class="form-control" placeholder="Your Garage name" value="<%=rs.getString("garage")%>">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="owner">Owner Name</label>
										<input type="text" id="owner" name="owner" class="form-control" placeholder="Owner name" value="<%=rs.getString("owner")%>">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-6 padding-bottom">
										<label for="location">Location</label>
										<input type="text" id="location" name="location" class="form-control" placeholder="Your Location" value="<%=rs.getString("location")%>" required="required">
									</div>
									<div class="col-md-6 padding-bottom">
										<label for="contact">Contact No.</label>
										<input type="text" pattern="[0-9]{10}" id="contact" name="contact" class="form-control" placeholder="Your Contact No." value="<%=rs.getString("contactno")%>" required="required">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="email">Email</label>
										<input type="email" name="email" id="email" class="form-control" placeholder="Your email address" required="required" value="<%=rs.getString("email")%>" readonly="readonly">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="address">Address.</label>
										<textarea type="text" id="address" name="address" class="form-control" placeholder="Garage Address"><%=rs.getString("address")%></textarea>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="pass">Password</label>
										<input type="password" id="pass" name="pass" class="form-control" placeholder="Your Password" value="<%=rs.getString("password")%>" required="required" pattern="{8,}" >
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

<%}
rs.close();
							                      ps.close();
							                      conn.close();
%>
		<jsp:include page="/garage-footer"></jsp:include>
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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="js/google_map.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>
	<script type="text/javascript">
	function CheckPass() {
		var pass=document.getElementById("pass").value;
		var cpass=document.getElementById("cpass").value;
		if(pass!=cpass){
			alert("Your password and confirm password does not match");
			document.getElementById("cpass").value="";
		}
	}
	
	</script>

	</body>
</html>

