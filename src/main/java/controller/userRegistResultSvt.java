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

@WebServlet("/uir")

public class userRegistResultSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		//		確認画面からhiddenで送られてきた値を取得
		String loginId = request.getParameter("loginId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String icon = request.getParameter("icon");
		String profile = request.getParameter("profile");

		//		登録用のオブジェクトを作る
		UserDTO newUser = new UserDTO();
		newUser.setLoginId(loginId);
		newUser.setUserName(userName);
		newUser.setPassword(password);
		newUser.setIcon(icon);
		newUser.setProfile(profile);

		//		DAOを読んでデータベースに追加
		DBManager dbm = new DBManager();
		dbm.insertUser(newUser);

		request.setAttribute("registUser", newUser);

		RequestDispatcher dispatcher = request.getRequestDispatcher("userRegistResult.jsp");
		dispatcher.forward(request, response);
	}
}