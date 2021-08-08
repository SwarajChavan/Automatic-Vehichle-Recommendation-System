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
import javax.servlet.http.HttpSession;

import utility.DBConnection;

/**
 * Servlet implementation class DriverAddRatings
 */
@WebServlet("/DriverAddRatings")
public class DriverAddRatings extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverAddRatings() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rating=request.getParameter("rating");
		String driver=request.getParameter("driver");
		String id=request.getParameter("id");
		Connection conn=DBConnection.getConnection();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session=request.getSession();

		String name=(String) session.getAttribute("name");
		String email=(String) session.getAttribute("email");
		
		try {
			PreparedStatement ps=conn.prepareStatement("SELECT * FROM `driverrating` WHERE userid=? AND driver=?");
			ps.setString(1, email);
			ps.setString(2, driver);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				PreparedStatement stmt=conn.prepareStatement("INSERT INTO `driverrating`(`userid`, `driver`, `rating`) VALUES (?,?,?)");
				stmt.setString(1, email);
				stmt.setString(2, driver);
				stmt.setString(3, rating);
				stmt.executeUpdate();
			}else {
				PreparedStatement stmt=conn.prepareStatement("UPDATE `driverrating` SET `rating`=? WHERE `userid`=? AND `driver`=?");
				stmt.setString(1, rating);
				stmt.setString(2, email);
				stmt.setString(3, driver);
				stmt.executeUpdate();
			}
			out.println("<script type='text/javascript'>");
			out.println("alert('Rating was added by the user!!!')");
			out.println("window.location = 'customer-driverdetails?id="+id+"'");
			out.println("</script>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
