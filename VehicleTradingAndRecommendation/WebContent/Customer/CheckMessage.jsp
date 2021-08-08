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
	<jsp:include page="/customer-header"></jsp:include>
	
		<div id="colorlib-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3>Buy Vehicle Contact</h3>
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
                          <th>Dealer</th>
                          <th>Vehicle</th>
                          <th>Contact</th>
                          <th>Email</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%
                      Connection conn=DBConnection.getConnection();
                      PreparedStatement ps=conn.prepareStatement("SELECT dealer.firstname,dealer.lastname,car,contactno,email FROM `contactdealer` JOIN dealer WHERE user=? AND dealer=email");
                      ps.setString(1, email);
                      ResultSet rs=ps.executeQuery();
                      int i=0;
                      while(rs.next()){
                    	  i++;
                      %>
                      <tr>
                      <td><%=i %></td>
                      <td><%=rs.getString(1)+" "+rs.getString(2) %></td>
                      <td><a href="customer-vehicledetails?id=<%=rs.getString(3) %>" target="_blank">Vehicle Details</a></td>
                      <td><%=rs.getString(4) %></td>
                      <td><%=rs.getString(5) %></td>
                      <tr>
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
					<div class="col-md-12">
						<h3>Rent Vehicle Status</h3>
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
                          <th>Dealer</th>
                          <th>Vehicle</th>
                          <th>Start Date</th>
                          <th>End Date</th>
                          <th>Contact</th>
                          <th>Email</th>
                          <th>Status</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%
                      
                      ps=conn.prepareStatement("SELECT dealer.firstname,dealer.lastname,car,contactno,email,date,status,edate FROM `rentvehicle` JOIN dealer WHERE user=? AND dealer=email");
                      ps.setString(1, email);
                      rs=ps.executeQuery();
                      i=0;
                      while(rs.next()){
                    	  i++;
                      %>
                      <tr>
                      <td><%=i %></td>
                      <td><%=rs.getString(1)+" "+rs.getString(2) %></td>
                      <td><a href="customer-vehicledetails?id=<%=rs.getString(3) %>">Vehicle Details</a></td>
                      <td><%=rs.getString(6) %></td>
                      <td><%=rs.getString(8) %></td>
                      <td><%=rs.getString(4) %></td>
                      <td><%=rs.getString(5) %></td>
                      <td><%=rs.getString(7) %></td>
                      <tr>
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
					<div class="col-md-12">
						<h3>Driver Status</h3>
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
                          <th>Driver</th>
                          <th>Date</th>
                          <th>Contact</th>
                          <th>View Details</th>
                          <th>Status</th>
                          <th>Send Message</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%
                      
                      ps=conn.prepareStatement("SELECT rentdriver.id,driver.firstname,driver.lastname,date,contactno,status,email "
                              +"FROM `rentdriver` JOIN driver WHERE customer=? AND driver=email");
                      ps.setString(1, email);
                      rs=ps.executeQuery();
                      i=0;
                      while(rs.next()){
                    	  i++;
                      %>
                      <tr>
                      <td><%=i %></td>
                      <td><%=rs.getString(2)+" "+rs.getString(3) %></td>
                      <td><%=rs.getString(4) %></td>
                      <td><%=rs.getString(5) %></td>
                      <td><a href="customer-driverdetails?id=<%=rs.getString(1)%>">Details</a></td>
                      <td><%=rs.getString(6) %></td>
                      <%
                      if(rs.getString(6).equals("Accept")){
                      %>
                      <td><form action="SendMessage" method="post">
                      <input type="hidden" name="driver" value="<%=rs.getString(7)%>">
                      <textarea rows="2" name="message" required="required" style="width: 100%"></textarea><br>
                      <input type="submit" value="Send Message">
                      </form> </td>
                      <%}else{ %>
                      <td><td>
                      <%} %>
                      
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
	<script src="js/data-table/bootstrap-table.js"></script>

	</body>
</html>

