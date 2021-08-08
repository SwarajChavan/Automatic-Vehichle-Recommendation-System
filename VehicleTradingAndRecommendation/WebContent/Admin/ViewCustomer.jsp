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
	<link rel="stylesheet" href="css/data-table/bootstrap-table.css">
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
	
	<jsp:include page="/admin-header"></jsp:include>
	<div id="colorlib-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3>View Customer</h3>
					</div>
					<div class="col-md-12">
						<div class="contact-wrap">
							<div id="output">
							<div class="datatable-dashv1-list custom-datatable-overright" id="printableArea">
                			  <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-key-events="true"  data-cookie="true"
                              class="table table-striped table-bordered" width="100%" cellspacing="0">
                               <thead>
                        <tr>
                          <th>#</th>
                          <th>Name</th>
                          <th>DOB</th>
                          <th>Address</th>
                          <th>Gender</th>
                          <th>Contact No.</th>
                          <th>Email</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%
                      Connection conn=DBConnection.getConnection();
                      PreparedStatement ps=conn.prepareStatement("SELECT * FROM `customer`");
                      ResultSet rs=ps.executeQuery();
                      int i=0;
                      while(rs.next()){
                    	  i++;
                      %>
                      <tr>
                      <td><%=i %></td>
                      <td><%=rs.getString("firstname")+" "+rs.getString("lastname")%></td>
                      <td><%=rs.getString("dob") %></td>
                      <td><%=rs.getString("address") %></td>
                      <td><%=rs.getString("gender") %></td>
                      <td><%=rs.getString("contactno") %></td>
                      <td><%=rs.getString("email") %></td>
                      </tr>
                      <%}
                      rs.close();
      				ps.close();
      				conn.close();
                      %>
                      
   						 </tbody>
                      </table>
                  </div>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			
		
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
	<!-- Main -->
	<script src="js/main.js"></script>
<script src="js/data-table/bootstrap-table.js"></script>
	</body>
</html>

