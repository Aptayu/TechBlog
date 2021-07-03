package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// fetch all form data;
		PrintWriter out = response.getWriter();

		String check = request.getParameter("check");
		if (check == null) {
			out.println("Please check Terms & Conditions");
		} else {
			String user_name = request.getParameter("user_name");
			String password = request.getParameter("user_password");
			String email = request.getParameter("user_email");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");
//			To pass all these create user object
			User user = new User(user_name, email, password, gender, about);

//			create a userdao object to fire your query
			UserDao dao = new UserDao(ConnectionProvider.getCon());
			if (dao.saveUser(user)) {
				out.println("Done");
			} else {
				out.println("Error");
			}
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
