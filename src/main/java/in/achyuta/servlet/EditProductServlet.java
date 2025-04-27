package in.achyuta.servlet;

import java.io.IOException;
import java.util.List;

import in.achyuta.bean.ProductBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/edit")
public class EditProductServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if(session==null) {
			req.setAttribute("errMsg", "Session Expired Please LogIN Again");
			req.getRequestDispatcher("session-fail.jsp").forward(req, res);
		}
		List<ProductBean> products=(List<ProductBean>)session.getAttribute("products");
		if (products==null || products.isEmpty()) {
			req.getRequestDispatcher("admin-view-all.jsp").forward(req, res);
		}
		String pcode = req.getParameter("pcode");
		int k=0;
		ProductBean pb=null;
		for(ProductBean pbean : products) {
			if(pbean.getProductCode().equals(pcode)) {
				pb=pbean;
				break;
			}
		}
		if(pb!=null) {
			req.setAttribute("pbean", pb);
			req.getRequestDispatcher("edit-prod.jsp").forward(req, res);
		}else {
			req.setAttribute("errMsg", "Product Not Found");
			req.getRequestDispatcher("pass-cnfpass-err.jsp").forward(req, res);
		}
		
	}

}
