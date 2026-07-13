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

@WebServlet("/uic")
public class UserRegistConfirmSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = null;

		//入力情報取得
		String loginId = request.getParameter("loginId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String icon = request.getParameter("icon");
		String profile = request.getParameter("profile");

		UserDTO u = new UserDTO();

		u.setLoginId(loginId);
		u.setUserName(userName);
		u.setPassword(password);
		u.setIcon(icon);
		u.setProfile(profile);

		DBManager dbm = new DBManager();

		boolean result = dbm.registerUser(loginId, userName, password, icon, profile);

		if (result) {
			//成功

			request.setAttribute("finalUser", u);
			dispatcher = request.getRequestDispatcher("userRegistResult.jsp");

		} else {
			//	新規登録失敗
			String message = "なにも入力されていません。";

			//エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert", message);

			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");

		}
		dispatcher.forward(request, response);

	}

}
