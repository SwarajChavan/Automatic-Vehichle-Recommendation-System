<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
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
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
	<jsp:include page="Header.jsp"></jsp:include>
	<%
Connection conn=DBConnection.getConnection();
String search=request.getParameter("search");

%>
	<input type="hidden" value="Car" id="vehicle">
		
		
		<div class="colorlib-shop">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="row row-pb-lg" >
						<div id="output">
						<%

						PreparedStatement ps=conn.prepareStatement("SELECT * FROM `vehicle` WHERE (brand LIKE '%"+search+"%' OR model LIKE '%"+search+"%') AND inspection in ('Verified', 'Not Verified')");
						ResultSet rs=ps.executeQuery();
						while(rs.next()){
						
						%>
							<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img" style="background-image: url(GetImages?id=<%=rs.getString("id")%>);">
								<p class="tag"><span class="new"><%=rs.getString("purpose") %> <%=rs.getString("inspection") %></span></p>
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
							<% }
						  rs.close();
	                      ps.close();
	                      conn.close();
							%>
							
							</div>
						</div>

					</div>
					
				</div>
			</div>
		</div>
		
	<jsp:include page="/Footer.jsp"></jsp:include>

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

