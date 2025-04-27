package in.achyuta.servlet;

import java.io.IOException;

import in.achyuta.bean.AdminBean;
import in.achyuta.dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@SuppressWarnings("serial")
@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("name");
		String password=req.getParameter("password");
		
		AdminBean adminBean = new AdminDAO().login(name,password);
		if(adminBean==null) {
			req.setAttribute("errMsg", "Invalid credentials");
			req.getRequestDispatcher("invalid-login.jsp").forward(req, res);
		}else {
			HttpSession session = req.getSession();
			session.setAttribute("adminBean", adminBean);
			System.out.println(adminBean.getFirstName());
			req.getRequestDispatcher("admin-dashboard.jsp").forward(req, res);
		}
		
	}

}
