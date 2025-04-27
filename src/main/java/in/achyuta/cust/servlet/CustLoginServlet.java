package in.achyuta.cust.servlet;

import java.io.IOException;

import in.achyuta.bean.CustomerBean;
import in.achyuta.dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@SuppressWarnings("serial")
@WebServlet("/customerLogin")
public class CustLoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email = req.getParameter("name");
		String password = req.getParameter("password");
		CustomerBean cbean=new CustomerDAO().login(email,password);
		if(cbean==null) {
			req.setAttribute("errMsg", "Invalid Credentials");
			req.getRequestDispatcher("failure.jsp").forward(req, res);
		}
		HttpSession hs=req.getSession();
		hs.setAttribute("cbean", cbean);
		req.getRequestDispatcher("cust-dashboard.jsp").forward(req, res);
	}

}
