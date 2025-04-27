package in.achyuta.cust.servlet;

import java.io.IOException;

import in.achyuta.bean.CustomerBean;
import in.achyuta.dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/custRegister")
public class CustRegisterServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String password = req.getParameter("password");
		String cnfPassword = req.getParameter("cnfpassword");
		String email = req.getParameter("email");
		if (password.equals(cnfPassword)) {

			if (!new CustomerDAO().findByEmail(email)) {
				CustomerBean bean = new CustomerBean();
				bean.setFirstName(req.getParameter("fname"));
				bean.setLastName(req.getParameter("lname"));
				bean.setEmail(email);
				bean.setMob(req.getParameter("phn"));
				bean.setPassword(password);
				

				int k = new CustomerDAO().register(bean);
				if (k > 0) {
					req.setAttribute("succMsg", "Register SuccesFull");
					req.getRequestDispatcher("customer-login.html").forward(req, res);
				} else {
					System.out.println("Data is not Inserted");
				}
			} else {
				req.setAttribute("errMsg", "Email id Already registered");
				req.getRequestDispatcher("cust-invalid-reg.jsp").forward(req, res);
			}

		} else {
			req.setAttribute("errMsg", "Password and Confirm Password Must be Same");
			req.getRequestDispatcher("cust-pass-cnfpass-err.jsp").forward(req, res);
		}

	}

}
