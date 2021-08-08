package controller.dealer;

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
import javax.servlet.http.HttpSession;

import utility.DBConnection;

/**
 * Servlet implementation class ReportVehicle
 */
@WebServlet("/ReportVehicle")
public class ReportVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportVehicle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Connection conn=DBConnection.getConnection();
		
		String vehicle=request.getParameter("vehicle");
		String email=(String) session.getAttribute("email");
		String name=(String) session.getAttribute("name");
		
		try {
			PreparedStatement ps=conn.prepareStatement("INSERT INTO `reportstolenvehicle`(`vehicleid`, `dealer`) VALUES (?,?)");
			ps.setString(1, vehicle);
			ps.setString(2, name+"("+email+")");
			ps.executeUpdate();
			out.println("<script type='text/javascript'>");
			out.println("alert('Vehicle was reported to Admin!!!')");
			out.println("window.location = 'dealer-addvehicle'");
			out.println("</script>");
	//		rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
