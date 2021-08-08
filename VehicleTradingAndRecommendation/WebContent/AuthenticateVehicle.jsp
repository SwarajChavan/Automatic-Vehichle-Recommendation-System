<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utility.DBConnection"%>
<%@page import="java.sql.Connection"%>
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
String vehicle=request.getParameter("vehicle");
Connection conn=DBConnection.getConnection();
PreparedStatement ps=conn.prepareStatement("SELECT * FROM `stolen_vehicles` WHERE registrationno=?");
ps.setString(1, vehicle);
ResultSet rs=ps.executeQuery();
if(rs.next()) {
%>
<h4>The Vehicle is Stolen. You cannot Register it!!!</h4><br>
<strong><a href="ReportVehicle?vehicle=<%=vehicle%>">Report Vehicle to Admin</a></strong>
<%}else {	
	
	ps=conn.prepareStatement("SELECT * FROM `vehicle` where regno=?");
	ps.setString(1, vehicle);
	rs=ps.executeQuery();
	if(rs.next()){
	
 %>
<h4>The Vehicle is Already Registered!!!</h4><br>
<strong><a href="dealer-addvehicle">Try Another Vehicle</a></strong>
<%}else{ %>
<div class="row form-group">
	<div class="col-md-12 padding-bottom">
		<div class="col-md-12">
		<label for="offname">Type of Vehicle</label></div>
		<div class="col-md-6">
		<input type="radio" value="Bike" id="bike" name="type" onblur="getType('bike')" required="required"><label for="bike">Bike</label> 
		</div>
		<div class="col-md-6">
		<input type="radio" value="Car" id="Car" name="type" onblur="getType('car')" required="required"><label for="Car">Car</label> 
		</div>		
	</div>
</div>
<div class="row form-group">
	<div class="col-md-12 padding-bottom">
		<label for="offname">Brand</label>
		<select id="brand" class="form-control" name="brand" required="required"></select>
	</div>
</div>
<div class="row form-group">
	<div class="col-md-12 padding-bottom">
		<label for="offname">Vehicle Type</label>
		<select id="vehicletype" class="form-control" name="vehicletype" required="required"></select>
	</div>
</div>
<div class="row form-group">
	<div class="col-md-12 padding-bottom">
		<label for="model">Model</label>
		<input type="text" id="model" name="model" class="form-control" placeholder="Vehicle Model" required="required">
	</div>
</div>
<div class="row form-group">
	<div class="col-md-12 padding-bottom">
		<label for="myear">Manufacturing Year</label>
		<input type="text" id="myear" name="myear" class="form-control" placeholder="Manufacturing Year" required="required">
	</div>
</div>
<div class="row form-group">
	<div class="col-md-12 padding-bottom">
		<label for="offname">Used(in years)</label>
		<input type="number" id="used" name="used" class="form-control" placeholder="Used(in years)" required="required">
	</div>
</div>
<div class="row form-group">
	<div class="col-md-12 padding-bottom">
		<label for="offname">Kms Driven</label>
		<input type="number" id="kms" name="kms" class="form-control" placeholder="Kms Driven" required="required">
	</div>
</div>
<div class="row form-group">
	<div class="col-md-12 padding-bottom">
		<label for="offname">Milage(in KM/Hr)</label>
		<input type="number" id="milage" name="milage" class="form-control" placeholder="Vehicle Milage" required="required">
	</div>
</div>
<div class="row form-group">
	<div class="col-md-12 padding-bottom">
		<label for="offname">Price (in &#8377;)</label>
		<input type="number" id="price" name="price" class="form-control" placeholder="Vehicle Price" required="required">
	</div>
</div>
<div class="row form-group">
	<div class="col-md-12 padding-bottom">
		<div class="col-md-12">
		<label for="offname">Fuel Type</label></div>
		<div class="col-md-4">
		<input type="radio" value="Petrol" id="Petrol" name="fuel" required="required"><label for="Petrol">Petrol</label> 
		</div>
		<div class="col-md-4">
		<input type="radio" value="Diesel" id="Diesel" name="fuel" required="required"><label for="Diesel">Diesel</label> 
		</div>	
		<div class="col-md-4">
		<input type="radio" value="CNG" id="CNG" name="fuel" required="required"><label for="CNG">CNG</label> 
		</div>		
	</div>
</div>
<div class="row form-group">
	<div class="col-md-12 padding-bottom">
		<div class="col-md-12">
		<label for="offname">Purpose</label></div>
		<div class="col-md-6">
		<input type="radio" value="Sell" id="Sell" name="purpose"  required="required"><label for="Sell">Sell</label> 
		</div>
		<div class="col-md-6">
		<input type="radio" value="Rent" id="Rent" name="purpose" required="required"><label for="Rent">Rent</label> 
		</div>		
	</div>
</div>
<div class="row form-group">
	<div class="col-md-12 padding-bottom">
		<div class="col-md-12">
		<label for="offname">Allow Inspection of Vehicle</label></div>
		<div class="col-md-6">
		<input type="radio" value="In Process" id="Yes" name="insp"  required="required"><label for="Yes">Yes</label> 
		</div>
		<div class="col-md-6">
		<input type="radio" value="Not Verified" id="No" name="insp" required="required"><label for="No">No</label> 
		</div>		
	</div>
</div>


<div class="row form-group">
	<div class="col-md-12 padding-bottom">
		<label for="offname">Vehicle Image</label>
		<input type="file" id="img" name="image" class="form-control" placeholder="Vehicle Image" required="required">
	</div>
</div>
<div class="form-group text-center" >
	<button type="submit"  class="btn btn-primary">Add Vehicle</button>
</div>

<%}
}
rs.close();
                ps.close();
                conn.close();	
%>





</body>
</html>