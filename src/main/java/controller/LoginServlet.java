package controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.DBManager;
import dto.ShoutDTO;
import dto.UserDTO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	// index.jspの「ログイン」ボタンから呼び出される
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 送信情報の取得
		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");

		RequestDispatcher dispatcher = null;
		String missMatchMsg = null;
		String notInputMsg = null;
		String halfwidthMsg = null;

		if (loginId.equals("") || password.equals("")) {
			// ログインID かユーザー名、パスワードどれか、もしくは双方未入力なら
			notInputMsg = "ログインIDとユーザー名、パスワードは必須入力です";

			// エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("notInputAlert", notInputMsg);

			// index.jsp に処理を転送
			dispatcher = request.getRequestDispatcher("index.jsp");

		}

		if (!loginId.matches("^[a-z0-9]+$") || !password.matches("^[a-z0-9]+$")) {
			//半角英数字でないなら
			halfwidthMsg = "半角英数字で入力してください。";

			// エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("halfwidthAlert", halfwidthMsg);

			// index.jsp に処理を転送
			dispatcher = request.getRequestDispatcher("index.jsp");

		} else {

			// ログイン認証を行い、ユーザー情報を取得
			DBManager dbm = new DBManager();
			UserDTO user = dbm.getLoginUser(loginId, password);

			if (user != null) {
				// ユーザー情報を取得できたら、書き込み内容リストを取得
				ArrayList<ShoutDTO> list = dbm.getShoutList();
				HttpSession session = request.getSession();

				//ログインユーザー情報、書き込み内容リストとしてセッションに保存
				session.setAttribute("user", user);
				session.setAttribute("shouts", list);

				// 処理の転送先をtop.jspに指定
				dispatcher = request.getRequestDispatcher("top.jsp");
			} else {
				// ユーザー情報が取得できない場合
				// エラーメッセージをリクエストオブジェクトに保存
				missMatchMsg = "ログインIDまたはパスワードが違います";
				request.setAttribute("missMatchAlert", missMatchMsg);

				//処理の転送先をindex.jspに指定
				dispatcher = request.getRequestDispatcher("index.jsp");
			}

		}
		//処理を転送
		dispatcher.forward(request, response);
	}

}
