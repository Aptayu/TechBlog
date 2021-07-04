package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		Fetch eamil and password from request
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");

		PrintWriter out = response.getWriter();

		UserDao dao = new UserDao(ConnectionProvider.getCon());
		User u = dao.getUserByEmailAndPassword(userEmail, userPassword);
		if (u == null) {
//			login unsuccess
//			out.println("Invalid Credentials...try with valid one")
			Message msg = new Message("Invalid Credentials...try with a valid one", "error", "alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("login_page.jsp");

		} else {
//			login success lets store it in session you can also use cookies(more code)
			HttpSession s = request.getSession();
			s.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
