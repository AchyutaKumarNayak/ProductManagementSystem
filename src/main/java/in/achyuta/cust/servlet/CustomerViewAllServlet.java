package in.achyuta.cust.servlet;

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
import jakarta.websocket.Session;

@SuppressWarnings("serial")
@WebServlet("/custViewAll")
public class CustomerViewAllServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession hs = req.getSession(false);
		if(hs==null) {
			req.setAttribute("errMsg", "Session Expired...!");
			req.getRequestDispatcher("session-fail.jsp").forward(req, res);
		}
		List<ProductBean> products = new ProductDAO().viewAll();
		hs.setAttribute("products", products);
		req.getRequestDispatcher("cust-view-all.jsp").forward(req, res);
	}

}
