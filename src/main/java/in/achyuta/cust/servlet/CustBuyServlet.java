package in.achyuta.cust.servlet;

import java.io.IOException;
import java.util.List;

import in.achyuta.bean.ProductBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/buy")
public class CustBuyServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession hs = req.getSession(false);
		if(hs==null) {
			req.setAttribute("errMsg", "Session Expired...!");
			req.getRequestDispatcher("session-fail.jsp").forward(req, res);
		}
		String pcode = req.getParameter("pcode");
		List<ProductBean> products=(List<ProductBean>)hs.getAttribute("products");
		ProductBean pbean=null;
		for(ProductBean pb:products) {
			if(pb.getProductCode().equals(pcode)) {
				pbean=pb;
			}
		}
		if(pbean!=null) {
			req.setAttribute("pbean", pbean);
			req.getRequestDispatcher("buy-prod.jsp").forward(req, res);
		}else {
			System.out.println("Product is not getting from the table");
		}
		
	}

}
