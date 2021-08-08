<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utility.DBConnection"%>
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
	<style type="text/css">
	td, th {
	padding: 10px;
	}
	th{
	font-family: fantasy;
	    font-family: -webkit-pictograph;
	    font-size: large;
	    width: 300px;
	}
	</style>
	
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
	<jsp:include page="/customer-header"></jsp:include>
	<%
String name=(String) session.getAttribute("name");
String email=(String) session.getAttribute("email");
Connection conn=DBConnection.getConnection();
String id =request.getParameter("id");

%>

<div class="colorlib-shop">
			<div class="container">

				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<div class="row">
							<div class="col-md-12 tabulation">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#dealer">Driver Details</a></li>
								</ul>
								<div class="tab-content">

						         <%
						         PreparedStatement stmt=conn.prepareStatement("SELECT * FROM `driver` where id=?");
						         stmt.setString(1, id);
						         ResultSet rs1=stmt.executeQuery();
						         if(rs1.next()){
						         %>
						         <div id="dealer" class="tab-pane fade in active">
										<table border="1" style="width: 100%; "> 
										<tr>
										<th>Name</th>
										<td><%=rs1.getString("firstname")+" "+rs1.getString("lastname") %></td>
										</tr>
											<tr>
										<th>Date of Birth</th>
										<td><%=rs1.getString("dob") %></td>
										</tr>
										<tr>
										<th>Contact No.</th>
										<td><%=rs1.getString("contactno") %></td>
										</tr>
											<tr>
										<th>Email</th>
										<td><%=rs1.getString("email") %></td>
										</tr>
											<tr>
										<th>License No.</th>
										<td><%=rs1.getString("license") %></td>
										</tr>
											<tr>
										<th>License Expiry Date</th>
										<td><%=rs1.getString("licenceexp") %></td>
										</tr>

											
										</table><br><br>
		<div id="colorlib-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3>Give Ratings</h3>
					</div>
					<div class="col-md-12">
						<div class="contact-wrap">
							<form action="DriverAddRatings" method="post">
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="offname">Enter Rating</label>
										<input type="hidden" name="id" value="<%=id%>">
										<input type="hidden" name="driver" value="<%=rs1.getString("email")%>">
										<input type="number" min="1" max="5" id="rating" name="rating" class="form-control" placeholder="Driver Rating"  required="required">
									</div>
								</div>
								<div id="output">
								<div class="form-group text-center" >
									<button type="submit" value="" class="btn btn-primary">Add Rating</button>
								</div></div>
							</form>		
						</div>
					</div>
				</div>
			</div>
		</div>

						         </div>
								  <%} %>
					         </div>
				         </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<% 

conn.close();
%>
		
		
	<jsp:include page="/customer-footer"></jsp:include>

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

