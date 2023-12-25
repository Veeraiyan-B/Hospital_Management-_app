package com.hospital.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.dao.UserDao;
import com.hospital.dto.User;
import com.hospital.service.DbConnect;

@WebServlet("/user_register")
public class UserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String fullName = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			User u = new User(fullName, email, password);

			UserDao dao = new UserDao(DbConnect.getConn());

			boolean f = dao.register(u);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("sucMsg", "Register Sucessfully");
				resp.sendRedirect("Signup.jsp");
			} else {

				session.setAttribute("errorMsg", "Something wrong on server");
				resp.sendRedirect("Signup.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
