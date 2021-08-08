package utility;

import java.security.spec.InvalidKeySpecException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;


public class SendMail {
	public static final String useremail="xyz@gmail.com";
	public static final String userpass="abcxyz";
	

	public static void send(String to, String sub, String msg) {
		Properties props = new Properties();

		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.user", useremail);
		props.put("mail.smtp.password", userpass);
		//below mentioned mail.smtp.port is optional
		props.put("mail.smtp.port", "587");		
		props.put("mail.smtp.auth", "true");
		props.put("mail.debug", "false");
		// props.put("mail.smtp.starttls.enable", "true");

		/* Pass Properties object(props) and Authenticator object   
	           for authentication to Session instance 
		 */
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(useremail, userpass);
			}
		});

		try
		{
			/* Create an instance of MimeMessage, 
	 	      it accept MIME types and headers 
			 */

			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(useremail));
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));			
			message.setSubject(sub);
			message.setText(msg,"UTF-8", "html");
			
			

			/* Transport class is used to deliver the message to the recipients */

			Transport transport = session.getTransport("smtp");
			transport.connect("smtp.gmail.com", useremail, userpass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
	}  
	
	public static void main(String[] args) throws InvalidKeySpecException {
		
		
	}
}
