package controller.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.DBConnection;
import utility.SendMail;

/**
 * Servlet implementation class DealerRegistration
 */
@WebServlet("/CustomerRegistration")
public class CustomerRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=DBConnection.getConnection();
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String dob=request.getParameter("dob");
		String address=request.getParameter("address");
		String gender=request.getParameter("gender");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();


		try {
			PreparedStatement ps=conn.prepareStatement("SELECT * FROM `customer` WHERE email=?");
			ps.setString(1, email);
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				out.println("<script type='text/javascript'>");
				out.println("alert('Dealer Already registered using the email. Please try again.')");
				out.println("window.location = 'customer-registration'");
				out.println("</script>");
			}else {
				ps=conn.prepareStatement("INSERT INTO `customer`"
						+ "(`firstname`, `lastname`, `dob`, `address`, `gender`, `contactno`, `email`, `password`) "
						+ "VALUES (?,?,?,?,?,?,?,?)");
				ps.setString(1, fname);
				ps.setString(2, lname);
				ps.setString(3, dob);
				ps.setString(4, address);
				ps.setString(5, gender);
				ps.setString(6, contact);
				ps.setString(7, email);
				ps.setString(8, pass);
				ps.executeUpdate();
				String sub="Successful Registration";
				String msg="Hi,"
						+ "<br>"
						+ "You have successfully registered into our website to rent or buy used vehicles."
						+ "<br>"
						+ "The username and password for login is "+email+" and "+pass+"."
								+ "<br><br>"
								+ "Note: Do not share these credentials with anyone";
				SendMail.send(email, sub, msg);
				out.println("<script type='text/javascript'>");
				out.println("alert('Registration Successful')");
				out.println("window.location = 'customer-login'");
				out.println("</script>");
			}
			
			
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
