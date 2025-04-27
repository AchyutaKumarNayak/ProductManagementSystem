package in.achyuta.servlet;

import java.io.IOException;

import in.achyuta.bean.AdminBean;
import in.achyuta.dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminRegister")
public class AdminRegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String password = req.getParameter("password");
		String cnfPassword = req.getParameter("cnfpassword");
		String email = req.getParameter("email");
		if (password.equals(cnfPassword)) {

			if (!new AdminDAO().findByEmail(email)) {
				AdminBean bean = new AdminBean();
				bean.setFirstName(req.getParameter("fname"));
				bean.setLastName(req.getParameter("lname"));
				bean.setEmail(email);
				bean.setMob(req.getParameter("phn"));
				bean.setPassword(password);
				

				int k = new AdminDAO().register(bean);
				if (k > 0) {
					req.setAttribute("succMsg", "Register SuccesFull");
					req.getRequestDispatcher("admin-login.html").forward(req, res);
				} else {
					req.setAttribute("errMsg", "Password and Confirm Password Must be Same");
				}
			} else {
				req.setAttribute("errMsg", "Email id Already registered");
				req.getRequestDispatcher("invalid-reg.jsp").forward(req, res);
			}

		} else {
			req.setAttribute("errMsg", "Password and Confirm Password Must be Same");
			req.getRequestDispatcher("pass-cnfpass-err.jsp").forward(req, res);
		}

	}

}
