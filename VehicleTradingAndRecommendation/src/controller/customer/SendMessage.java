package controller.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utility.DBConnection;
import utility.SendMail;

/**
 * Servlet implementation class SendMessage
 */
@WebServlet("/SendMessage")
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=DBConnection.getConnection();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session=request.getSession();

		String name=(String) session.getAttribute("name");
		String email=(String) session.getAttribute("email");
		String driver=request.getParameter("driver");
		String message=request.getParameter("message");
		
		String sub="Message Send From "+name+"("+email+")";

		SendMail.send(driver, sub, message);
		out.println("<script type='text/javascript'>");
		out.println("alert('Mail has been send to the driver!!!')");
		out.println("window.location = 'customer-checkmessages'");
		out.println("</script>");
		
		
	}

}
