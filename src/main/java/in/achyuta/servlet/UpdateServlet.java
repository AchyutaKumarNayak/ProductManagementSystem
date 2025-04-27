package in.achyuta.servlet;

import java.io.IOException;

import in.achyuta.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if(session==null) {
			req.setAttribute("errMsg", "Session Expired Please LogIN Again");
			req.getRequestDispatcher("session-fail.jsp").forward(req, res);
		}
		String pcode = req.getParameter("pcode");
		String pname = req.getParameter("pname");
		String pprice = req.getParameter("pprice");
		String pqty = req.getParameter("pqty");
		
		int k = new ProductDAO().update(pcode, pprice, pqty);
		if(k>0) {
			req.setAttribute("succMsg", "Product "+pname+" Editted SuccesFully");
			req.getRequestDispatcher("prod-update-succ.jsp").forward(req, res);
		}else {
			req.setAttribute("errMsg", "Product is Not Editted");
			req.getRequestDispatcher("pass-cnfpass-err.jsp").forward(req, res);
		}
	}

}
