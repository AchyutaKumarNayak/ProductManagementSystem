package in.achyuta.servlet;

import java.io.IOException;

import in.achyuta.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/delete")
public class AdminDeleteServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session==null) {
			req.setAttribute("errMsg", "Session Expired Please LogIN Again");
			req.getRequestDispatcher("session-fail.jsp").forward(req, res);
		}
		String pcode = req.getParameter("pcode");
		int k=new ProductDAO().delete(pcode);
		if(k>0) {
			req.setAttribute("succMsg", "Product having Code "+pcode+" deleted SuccessFully");
			req.getRequestDispatcher("prod-update-succ.jsp").forward(req, res);
			
		}else {
			req.setAttribute("errMsg", "Product is Not deleted");
			req.getRequestDispatcher("pass-cnfpass-err.jsp").forward(req, res);
		}
	}

}
