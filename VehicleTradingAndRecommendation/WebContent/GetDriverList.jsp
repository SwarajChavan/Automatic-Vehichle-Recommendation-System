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
<link rel="stylesheet" href="css/data-table/bootstrap-table.css">
</head>
<body>

<div class="datatable-dashv1-list custom-datatable-overright" id="printableArea">
                  <table id="table" data-toggle="table" data-pagination="false" data-search="true" data-key-events="true"  data-cookie="true"
                              class="table table-striped table-bordered" width="100%" cellspacing="0">
                               <thead>
                        <tr>
                          <th>#</th>
                          <th>Driver</th>
                          <th>View Details</th>
                          <th>Send Request to Rent</th>
                        </tr>
                      </thead>
                      <tbody>

<%
String date=request.getParameter("date");
Connection conn=DBConnection.getConnection();

PreparedStatement ps=conn.prepareStatement("SELECT driver FROM `driverrating` WHERE driver" 
		+" NOT IN (SELECT driver FROM rentdriver WHERE date=? and status='Accept') GROUP BY driver ORDER BY AVG(rating) DESC");
ps.setString(1, date);
ResultSet rs=ps.executeQuery();
int i=0;
while(rs.next()){
	
	PreparedStatement statement=conn.prepareStatement("select * from driver where email=?");
	statement.setString(1, rs.getString(1));
	ResultSet rs1= statement.executeQuery();
	if(rs1.next()){
		i++;
%>

		<tr>
		<td><%=i %></td>
		<td><%=rs1.getString("firstname")+" "+rs1.getString("lastname") %></td>
		<td><a href="customer-driverdetails?id=<%=rs1.getString("id")%>">Details</a></td>
		<td><a href="RentDriver?date=<%=date%>&id=<%=rs1.getString("email")%>">Rent</a></td>
		</tr>

<%}
	
	}%>
	
	<%
	PreparedStatement statement=conn.prepareStatement("SELECT * FROM `driver` WHERE email NOT IN (SELECT driver FROM rentdriver)");
	ResultSet rs1= statement.executeQuery();
	while(rs1.next()){
		i++;
%>

		<tr>
		<td><%=i %></td>
		<td><%=rs1.getString("firstname")+" "+rs1.getString("lastname") %></td>
		<td><a href="customer-driverdetails?id=<%=rs1.getString("id")%>">Details</a></td>
		<td><a href="RentDriver?date=<%=date%>&id=<%=rs1.getString("email")%>">Rent</a></td>
		</tr>

<%}rs.close();
ps.close();
conn.close();	
	
	%>
	
   						 </tbody>
                      </table>
                  </div>
<script src="js/data-table/bootstrap-table.js"></script>
</body>
</html>