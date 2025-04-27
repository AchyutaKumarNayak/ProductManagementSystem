package in.achyuta.cust.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/payment")
public class PaymentServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession hs = req.getSession(false);
		if(hs==null) {
			req.setAttribute("errMsg", "Session Expired...!");
			req.getRequestDispatcher("session-fail.jsp").forward(req, res);
		}
		Double price=Double.parseDouble(req.getParameter("pprice"));
		Integer rqty=Integer.parseInt(req.getParameter("rqty"));
	   Double totalPrice=price*rqty;
		
		req.setAttribute("pcode", req.getParameter("pcode"));
		req.setAttribute("pname", req.getParameter("pname"));
		req.setAttribute("pprice", price);
		req.setAttribute("rqty", rqty);
		req.setAttribute("total", totalPrice);
		
		req.getRequestDispatcher("payment.jsp").forward(req, res);
		
		
	}

}
