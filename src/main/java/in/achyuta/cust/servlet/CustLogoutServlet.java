package in.achyuta.cust.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/custLogout")
public class CustLogoutServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession hs = req.getSession(false);
		if(hs==null) {
			req.setAttribute("errMsg", "    Session Expired......!");
			req.getRequestDispatcher("session-fail.jsp").forward(req, res);
		}
		hs.invalidate();
		req.getRequestDispatcher("customer-login.html").forward(req, res);
	}

}
