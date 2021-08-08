 <%@page import="java.sql.ResultSet"%>
<%@page import="utility.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<%
	String name=(String) session.getAttribute("name");
	String email=(String) session.getAttribute("email");
	%>
	<jsp:include page="/dealer-header"></jsp:include>
	
		<div id="colorlib-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<h3>Buy Vehicle Messages</h3>
					</div>
					<div class="col-md-10 col-md-offset-1">
						<div class="contact-wrap">
							<div id="output">
							<div class="datatable-dashv1-list custom-datatable-overright" id="printableArea">
                			  <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-key-events="true"  data-cookie="true"
                              class="table table-striped table-bordered" width="100%" cellspacing="0">
                               <thead>
                        <tr>
                          <th>#</th>
                          <th>Customer</th>
                          <th>Vehicle</th>
                          <th>Contact</th>
                          <th>Email</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%
                      Connection conn=DBConnection.getConnection();
                      PreparedStatement ps=conn.prepareStatement("SELECT customer.firstname,customer.lastname,car,contactno,email FROM `contactdealer` JOIN customer WHERE dealer=? AND user=email");
                      ps.setString(1, email);
                      ResultSet rs=ps.executeQuery();
                      int i=0;
                      while(rs.next()){
                    	  i++;
                      %>
                      <tr>
                      <td><%=i %></td>
                      <td><%=rs.getString(1)+" "+rs.getString(2) %></td>
                      <td><a href="dealer-vehicledetails?id=<%=rs.getString(3) %>" target="_blank">Vehicle Details</a></td>
                      <td><%=rs.getString(4) %></td>
                      <td><%=rs.getString(5) %></td>
                      </tr>
                      <%} %>
                      
   						 </tbody>
                      </table>
                  </div>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="colorlib-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<h3>Rent Vehicle Messages</h3>
					</div>
					<div class="col-md-10 col-md-offset-1">
						<div class="contact-wrap">
							<div id="output">
							<div class="datatable-dashv1-list custom-datatable-overright" id="printableArea">
                			  <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-key-events="true"  data-cookie="true"
                              class="table table-striped table-bordered" width="100%" cellspacing="0">
                               <thead>
                        <tr>
                          <th>#</th>
                          <th>Customer</th>
                          <th>Vehicle Details</th>
                          <th>Vehicle</th>
                          <th>Start Date</th>
                          <th>End Date</th>
                          <th>Contact</th>
                          <th>Email</th>
                          <th>Rent Vehicle</th>
                          <th>Reject Request</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%                      
                      ps=conn.prepareStatement("SELECT customer.firstname,customer.lastname,car,contactno,email,date,edate,rentvehicle.id FROM `rentvehicle` JOIN customer WHERE dealer=? AND status='In Process' AND user=email");
                      ps.setString(1, email);
                      rs=ps.executeQuery();
                      i=0;
                      while(rs.next()){
                    	  i++;
                      %>
                      <tr>
                      <td><%=i %></td>
                      <td><%=rs.getString(1)+" "+rs.getString(2) %></td>
                      <td><a href="dealer-vehicledetails?id=<%=rs.getString(3) %>">Vehicle Details</a></td>
                      <%
                      PreparedStatement ps1=conn.prepareStatement("SELECT * FROM `vehicle` WHERE id=?");
                      ps1.setString(1, rs.getString(3));
                      ResultSet rs1=ps1.executeQuery();
                      if(rs1.next()){
                      %>
                      <td><%=rs1.getString("regno") %><br>(<%=rs1.getString("model") %>)</td>
                      <%} %>
                      <td><%=rs.getString(6) %></td>
                      <td><%=rs.getString(7) %></td>
                      <td><%=rs.getString(4) %></td>
                      <td><%=rs.getString(5) %></td>
                      <td><a href="RentVehicle?id=<%=rs.getString(8)%>&stat=Rented&date=<%=rs.getString(6)%>&edate=<%=rs.getString(7)%>">Rent</a></td>
                      <td><a href="RentVehicle?id=<%=rs.getString(8)%>&stat=Cancelled&date=<%=rs.getString(6)%>&edate=<%=rs.getString(7)%>">Reject</a></td>
                      </tr>
                      <%} %>
                      
   					  </tbody>
                      </table>
                  </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="colorlib-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<h3>Rented Vehicles</h3>
					</div>
					<div class="col-md-10 col-md-offset-1">
						<div class="contact-wrap">
							<div id="output">
							<div class="datatable-dashv1-list custom-datatable-overright" id="printableArea">
                			  <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-key-events="true"  data-cookie="true"
                              class="table table-striped table-bordered" width="100%" cellspacing="0">
                               <thead>
                        <tr>
                          <th>#</th>
                          <th>Customer</th>
                          <th>Vehicle Details</th>
                          <th>Vehicle</th>
                          <th>Start Date</th>
                          <th>End Date</th>
                          <th>Contact</th>
                          <th>Email</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%
                      
                      ps=conn.prepareStatement("SELECT customer.firstname,customer.lastname,car,contactno,email,date,edate FROM `rentvehicle` JOIN customer WHERE dealer=? AND status='Rented' AND user=email");
                      ps.setString(1, email);
                      rs=ps.executeQuery();
                      i=0;
                      while(rs.next()){
                    	  i++;
                      %>
                      <tr>
                      <td><%=i %></td>
                      <td><%=rs.getString(1)+" "+rs.getString(2) %></td>
                      <td><a href="dealer-vehicledetails?id=<%=rs.getString(3) %>">Vehicle Details</a></td>
                      <%
                      PreparedStatement ps1=conn.prepareStatement("SELECT * FROM `vehicle` WHERE id=?");
                      ps1.setString(1, rs.getString(3));
                      ResultSet rs1=ps1.executeQuery();
                      if(rs1.next()){
                      %>
                      <td><%=rs1.getString("regno") %>(<%=rs1.getString("model") %>)</td>
                      <%} %>
                      <td><%=rs.getString(6) %></td>
                      <td><%=rs.getString(7) %></td>
                      <td><%=rs.getString(4) %></td>
                      <td><%=rs.getString(5) %></td>
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

		
		
	<jsp:include page="/dealer-footer"></jsp:include>

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

