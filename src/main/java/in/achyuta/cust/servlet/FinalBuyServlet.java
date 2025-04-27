package in.achyuta.cust.servlet;

import java.io.IOException;

import in.achyuta.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/finalBuy")
public class FinalBuyServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession hs = req.getSession(false);
		if(hs==null) {
			req.setAttribute("errMsg", "Session Expired...!");
			req.getRequestDispatcher("session-fail.jsp").forward(req, res);
		}
		String pcode = req.getParameter("pcode");
		int qty = Integer.parseInt(req.getParameter("qty"));
		int k=new ProductDAO().buy(pcode,qty);
		if(k>0) {
			req.setAttribute("succMsg", "Payment SuccesFully Completed");
			req.getRequestDispatcher("payment-succ.jsp").forward(req, res);
		}else {
			System.out.println("Payment Not Completed");
		}
	}

}
