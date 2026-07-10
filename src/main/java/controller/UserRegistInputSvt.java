package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserRegistInputSvt
 */
@WebServlet("/uii")
public class UserRegistInputSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegistInputSvt() {

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//送信情報の取得
		String action = request.getParameter("action");
		RequestDispatcher dispatcher = null;

		if ("新規登録".equals(action)) {
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");

		} else if ("キャンセル".equals(action)) {

			String loginId = request.getParameter("loginId");
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			String icon = request.getParameter("icon");
			String profile = request.getParameter("profile");

			request.setAttribute("loginId", loginId);
			request.setAttribute("userName", userName);
			request.setAttribute("password", password);
			request.setAttribute("icon", icon);
			request.setAttribute("profile", profile);

			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");

		} else {
			dispatcher = request.getRequestDispatcher("index.jsp");
		}

		dispatcher.forward(request, response);
	}

}
