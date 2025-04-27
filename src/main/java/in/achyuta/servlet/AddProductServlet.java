package in.achyuta.servlet;

import java.io.IOException;

import in.achyuta.bean.ProductBean;
import in.achyuta.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if(session==null) {
			req.setAttribute("errMsg", "Session Expired Please LogIN Again");
			req.getRequestDispatcher("session-fail.jsp").forward(req, res);
		}
		ProductBean pbean = new ProductBean();
		String code = req.getParameter("pcode");
		System.out.println(code);
		if (new ProductDAO().findByProductCode(code)) {
			req.setAttribute("errMsg", "This Product Code is Already Exist In Store");
			req.getRequestDispatcher("add-product-failure.jsp").forward(req, res);
		} else {
			String pname = req.getParameter("name");
			pbean.setProductCode(code);
			pbean.setProductName(pname);
			pbean.setProductName(pname);
			pbean.setProductPrice(Double.parseDouble(req.getParameter("price")));
			pbean.setProductQty(Integer.parseInt(req.getParameter("qty")));
			pbean.setProductCategory(req.getParameter("ptype"));
			System.out.println(pbean);
			int k = new ProductDAO().addProduct(pbean);

			if (k > 0) {
				req.setAttribute("succMsg", pname + " added SuccesFully..");
				req.getRequestDispatcher("prod-add-succ.jsp").forward(req, res);
			} else {
				req.setAttribute("errMsg", "Product is Not Added");
				req.getRequestDispatcher("pass-cnfpass-err.jsp").forward(req, res);
			}
		}
	}

}
