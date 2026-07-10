package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.DBManager;
import dto.UserDTO;

/**
 * Servlet implementation class UserRegistConfirmSvt
 */
@WebServlet("/uic")
public class UserRegistConfirmSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegistConfirmSvt() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = null;

		//入力情報取得
		String loginId = request.getParameter("loginId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String Icon = request.getParameter("icon");
		String profile = request.getParameter("profile");

		UserDTO u = new UserDTO();

		u.setLoginId(loginId);
		u.setUserName(userName);
		u.setPassword(password);
		u.setIcon(Icon);
		u.setProfile(profile);

		DBManager dbm = new DBManager();

		UserDTO user = dbm.registerUser(loginId, userName, password, Icon, profile);

		if (!user.equals("")) {
			//成功
			ServletContext sc = getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher("/userRegestResult.jsp");
			rd.forward(request, response);

		} else {
			//	新規登録失敗
			String message = "なにも入力されていません。";

			//エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert", message);

			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			dispatcher.forward(request, response);
		}

	}

}
