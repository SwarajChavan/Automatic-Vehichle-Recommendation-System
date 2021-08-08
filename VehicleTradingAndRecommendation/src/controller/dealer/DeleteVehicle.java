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

import utility.DBConnection;

/**
 * Servlet implementation class DeleteVehicle
 */
@WebServlet("/DeleteVehicle")
public class DeleteVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteVehicle() {
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
		String id=request.getParameter("id");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Connection conn=DBConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("DELETE FROM `vehicle` WHERE id=?");
			ps.setString(1, id);
			ps.executeUpdate();
			out.println("<script type='text/javascript'>");
			out.println("alert('Vehicle Removed Successfully!!!')");
			out.println("window.location = 'dealer-index'");
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
