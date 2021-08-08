package controller.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import utility.DBConnection;

/**
 * Servlet implementation class DealerUpdateVehicle
 */
@WebServlet("/AdminUpdateVehicle")
public class AdminUpdateVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("email");
		
		String vehicle=request.getParameter("vehicle");
		String type=request.getParameter("type");
		String brand=request.getParameter("brand");
		String vehicletype=request.getParameter("vehicletype");
		String model=request.getParameter("model");
		String myear=request.getParameter("myear");
		String used=request.getParameter("used");
		String kms=request.getParameter("kms");
		String milage=request.getParameter("milage");
		String price=request.getParameter("price");
		String fuel=request.getParameter("fuel");
		String purpose=request.getParameter("purpose");
		String insp=request.getParameter("insp");
		
		Connection conn=DBConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("UPDATE `vehicle` SET `brand`=?,`type`=?,`model`=?,`vehicletype`=?,"
					+ "`yearsused`=?,`kmsdriven`=?,`milage`=?,`myear`=?,`price`=?,`fuel`=?,`purpose`=?,`inspection`=? "
					+ "WHERE `regno`=?");
			
			ps.setString(1, brand);
			ps.setString(2, type);
			ps.setString(3, model);
			ps.setString(4, vehicletype);
			ps.setString(5, used);
			ps.setString(6, kms);
			ps.setString(7, milage);
			ps.setString(8, myear);
			ps.setString(9, price);
			ps.setString(10, fuel);
			ps.setString(11, purpose);
			ps.setString(12, insp);
			ps.setString(13, vehicle);
			ps.executeUpdate();
			String id="";
			ps=conn.prepareStatement("select id from vehicle where regno=?");
			ps.setString(1, vehicle);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				id=rs.getString(1);
			}
			response.sendRedirect("admin-vehicledetails?id="+id);
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
