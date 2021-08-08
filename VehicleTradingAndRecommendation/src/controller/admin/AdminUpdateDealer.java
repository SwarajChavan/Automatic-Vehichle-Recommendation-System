package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.DBConnection;

/**
 * Servlet implementation class AdminUpdateDealer
 */
@WebServlet("/AdminUpdateDealer")
public class AdminUpdateDealer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=DBConnection.getConnection();
		String office=request.getParameter("offname");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String dob=request.getParameter("dob");
		String aadhar=request.getParameter("aadhar");
		String gender=request.getParameter("gender");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		if(office==null) {
			office="-";
		}		
		try {
			PreparedStatement ps=conn.prepareStatement("UPDATE `dealer` SET `firstname`=?,`lastname`=?,`dob`=?,"
					+ "`aadharno`=?,`gender`=?,`contactno`=?,`password`=?,`office`=? WHERE `email`=?");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, dob);
			ps.setString(4, aadhar);
			ps.setString(5, gender);
			ps.setString(6, contact);
			ps.setString(7, pass);
			ps.setString(8, office);
			ps.setString(9, email);
			ps.executeUpdate();
			
			out.println("<script type='text/javascript'>");
			out.println("alert('Dealer Information Updated Successfully')");
			out.println("window.location = 'admin-viewdealer'");
			out.println("</script>");
			//rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
