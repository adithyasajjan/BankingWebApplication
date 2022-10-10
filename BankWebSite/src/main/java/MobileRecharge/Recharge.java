package MobileRecharge;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Index/Recharge")
public class Recharge extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String amount1 = request.getParameter("amount");
		double amount = Double.parseDouble(amount1);
		
		request.getSession().setAttribute("amount", amount);
		
		RequestDispatcher rd = request.getRequestDispatcher("Payment.jsp");
        rd.forward(request, response);
	}

}
