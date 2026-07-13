package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.DBManager;
import dto.UserDTO;

/**
 * Servlet implementation class UserRegistResultSvt
 */
@WebServlet("/uir")
public class UserRegistResultSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegistResultSvt() {

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

		request.setCharacterEncoding("UTF-8");

		String loginId = request.getParameter("loginId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String icon = request.getParameter("icon");
		String profile = request.getParameter("profile");

		UserDTO udto = new UserDTO();

		udto.setLoginId(loginId);
		udto.setUserName(userName);
		udto.setPassword(password);
		udto.setIcon(icon);
		udto.setProfile(profile);

		DBManager dbm = new DBManager();
		String message = null;

		RequestDispatcher dispatcher = null;
		if (dbm.insertUser(udto)) { //trueならデータベースに登録完了

			request.setAttribute("loginId", loginId);
			request.setAttribute("userName", userName);
			request.setAttribute("password", password);
			request.setAttribute("icon", icon);
			request.setAttribute("profile", profile);
			dispatcher = request.getRequestDispatcher("userRegistResult.jsp");

		} else {
			// すでにデータベースにIDがあったら
			message = "すでにデータベースにIDがあります";
			// エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert", message);
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
		}
		dispatcher.forward(request, response);

	}

}
