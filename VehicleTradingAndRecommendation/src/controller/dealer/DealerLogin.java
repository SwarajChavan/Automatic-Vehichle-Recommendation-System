package controller.dealer;

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
 * Servlet implementation class DealerLogin
 */
@WebServlet("/DealerLogin")
public class DealerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=DBConnection.getConnection();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session=request.getSession();

		String name=request.getParameter("email");
		String pass=request.getParameter("pass");

		try {
			if(name.equals("Admin") && pass.equals("Admin")) {
				out.println("<script type='text/javascript'>");
				out.println("window.location = 'admin-index'");
				out.println("</script>");
			}else {
				PreparedStatement ps=conn.prepareStatement("select * from dealer where email=? and password=?");
				ps.setString(1, name);
				ps.setString(2, pass);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
					session.setAttribute("name", rs.getString("firstname")+" "+rs.getString("lastname"));
					session.setAttribute("email", rs.getString("email"));
					out.println("<script type='text/javascript'>");
					out.println("window.location = 'dealer-index'");
					out.println("</script>");
				}else {
					out.println("<script type='text/javascript'>");
					out.println("alert('Username or Password Incorrect!!!')");
					out.println("window.location = 'dealer-login'");
					out.println("</script>");
				}
				rs.close();
				ps.close();
			}
			out.close();		
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
	}

}
