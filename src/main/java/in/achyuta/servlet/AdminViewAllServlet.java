package in.achyuta.servlet;

import java.io.IOException;
import java.util.List;

import in.achyuta.bean.ProductBean;
import in.achyuta.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@SuppressWarnings("serial")
@WebServlet("/adminViewAll")
public class AdminViewAllServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if(session==null) {
			req.setAttribute("errMsg", "Session Expired Please LogIN Again");
			req.getRequestDispatcher("session-fail.jsp").forward(req, res);
		}
		List<ProductBean> products = new ProductDAO().viewAll();
		session.setAttribute("products", products);
		req.getRequestDispatcher("admin-view-all.jsp").forward(req, res);
	}

}
