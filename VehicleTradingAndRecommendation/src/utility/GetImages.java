package utility;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;



/**
 * Servlet implementation class GetImages
 */
@WebServlet("/GetImages")
public class GetImages extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //used to read images
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String id=request.getParameter("id");
			String type=request.getParameter("type");
			byte[] image = null;
			Connection conn=DBConnection.getConnection();
			try {
				PreparedStatement ps=conn.prepareStatement("SELECT `image` FROM `vehicle` where id=?");
				ps.setString(1, id);
				ResultSet rs=ps.executeQuery();
				if(rs.next()){
					image=rs.getBytes(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			String b64 = DatatypeConverter.printBase64Binary(image);	
			//setContentType as image/jpeg to send the file to webpage
			response.setContentType("image/jpeg");
			response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.addHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
			//send the image using OutputStream
			response.setContentLength(image.length);
			response.getOutputStream().write(image);

	} catch (IOException e) {
			System.out.println("Error: " + e);
		}
	}

}
