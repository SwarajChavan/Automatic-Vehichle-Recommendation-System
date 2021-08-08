package controller.driver;

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
@WebServlet("/DriverRegistration")
public class DriverRegistration extends HttpServlet {
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
		String licno=request.getParameter("licno");
		String licexp=request.getParameter("licexp");
		String aadhar=request.getParameter("aadhar");
		String experience=request.getParameter("experience");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();


		try {
			PreparedStatement ps=conn.prepareStatement("SELECT * FROM `driver` WHERE email=?");
			ps.setString(1, email);
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				out.println("<script type='text/javascript'>");
				out.println("alert('Dealer Already registered using the email. Please try again.')");
				out.println("window.location = 'driver-registration'");
				out.println("</script>");
			}else {
				ps=conn.prepareStatement("INSERT INTO `driver`"
						+ "(`firstname`, `lastname`, `dob`, `address`, `gender`, `contactno`, `email`, `password`, "
						+ "`license`, `licenceexp`, `aadhar`, `experience`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1, fname);
				ps.setString(2, lname);
				ps.setString(3, dob);
				ps.setString(4, address);
				ps.setString(5, gender);
				ps.setString(6, contact);
				ps.setString(7, email);
				ps.setString(8, pass);
				ps.setString(9, licno);
				ps.setString(10, licexp);
				ps.setString(11, aadhar);
				ps.setString(12, experience);
				ps.executeUpdate();
				String sub="Successful Registration";
				String msg="Hi,"
						+ "<br>"
						+ "You have successfully registered as a driver into our website. "
						+ "<br>"
						+ "The username and password for login is "+email+" and "+pass+"."
								+ "<br><br>"
								+ "Note: Do not share these credentials with anyone";
				SendMail.send(email, sub, msg);
				out.println("<script type='text/javascript'>");
				out.println("alert('Registration Successful')");
				out.println("window.location = 'driver-login'");
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
