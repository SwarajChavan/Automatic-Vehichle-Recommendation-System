package controller.admin;

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

/**
 * Servlet implementation class DeleteDealer
 */
@WebServlet("/DeleteDealer")
public class DeleteDealer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String email="";
		Connection conn=DBConnection.getConnection();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			PreparedStatement ps=conn.prepareStatement("select email from dealer where id=?");
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				email=rs.getString(1);
			}
			
			ps=conn.prepareStatement("DELETE FROM `dealer` WHERE id=?");
			ps.setString(1, id);
			ps.executeUpdate();
			ps=conn.prepareStatement("DELETE FROM `buydataset` WHERE vehicle IN (SELECT id FROM vehicle WHERE dealer=?)");
			ps.setString(1, email);
			ps.executeUpdate();
			ps=conn.prepareStatement("DELETE FROM `rentdataset` WHERE vehicle IN (SELECT id FROM vehicle WHERE dealer=?)");
			ps.setString(1, email);
			ps.executeUpdate();
			ps=conn.prepareStatement("DELETE FROM `contactdealer` WHERE dealer=?");
			ps.setString(1, email);
			ps.executeUpdate();
			ps=conn.prepareStatement("DELETE FROM `rentvehicle` WHERE dealer=?");
			ps.setString(1, email);
			ps.executeUpdate();
			ps=conn.prepareStatement("DELETE FROM `vehicle` WHERE dealer=?");
			ps.setString(1, email);
			ps.executeUpdate();
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.println("<script type='text/javascript'>");
		out.println("alert('Dealer Deleted Successfully!!!')");
		out.println("window.location = 'admin-viewdealer'");
		out.println("</script>");
		
	}


}
