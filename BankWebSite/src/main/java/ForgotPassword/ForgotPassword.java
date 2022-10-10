package ForgotPassword;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Register.Validation;

@WebServlet("/Index/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Validation val = new Validation();
		ForgotPasswordDao fbd = new ForgotPasswordDao();
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String passwd1 = request.getParameter("passwd1");
		String passwd2 = request.getParameter("passwd2");
		String username = request.getParameter("uname");
		
		try {
			
				if(val.validatePassword(passwd1)) {
				
					if(val.validatePasswords(passwd1, passwd2)) {
						
						if(fbd.updatePassword(passwd1, username) > 0) {
							
							out.println("<script type=text/javascript>");
						    out.println("alert('Password updated successfully !');");
						    out.println("location='SignIn.jsp';");
						    out.println("</script>");
						}
						
						else {
							out.println("<script type=text/javascript>");
						    out.println("alert('Sorry, Try again later !');");
						    out.println("location='index.html';");
						    out.println("</script>");
						}	
						
					}
					else {
						
						out.println("<script type=text/javascript>");
					    out.println("alert('Password doesn't match');");
					    out.println("location='ForgotPassword.jsp';");
					    out.println("</script>");
					}
				}
				else
				{
					
					out.println("<script type=text/javascript>");
				    out.println("alert('Password should contain uppercase and lowercase letters, "
				    		+ " numbers, special characters (@,#,$,%,^, &,+,=,*), "
				    		+ " minimum length of the password is 8');");
				    out.println("location='ForgotPassword.jsp';");
				    out.println("</script>");
				}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
	}
}
		
		
	

