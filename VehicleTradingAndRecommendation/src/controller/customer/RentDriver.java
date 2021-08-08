package controller.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utility.DBConnection;

/**
 * Servlet implementation class RentDriver
 */
@WebServlet("/RentDriver")
public class RentDriver extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String name=(String) session.getAttribute("name");
		String email=(String) session.getAttribute("email");
		Connection conn=DBConnection.getConnection();
		
		String date=request.getParameter("date");
		String id=request.getParameter("id");
		try {
			PreparedStatement ps=conn.prepareStatement("INSERT INTO `rentdriver`(`customer`, `driver`, `date`) VALUES (?,?,?)");
			ps.setString(1, email);
			ps.setString(2, id);
			ps.setString(3, date);
			ps.executeUpdate();
			response.sendRedirect("customer-rentdriver");
			//rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
