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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	// index.jspの[ログイン]ボタンから呼び出される
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//送信情報の取得
		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");

		RequestDispatcher dispatcher = null;
		String message1 = null;
		String message2 = null;
		//InputCheck check = new InputCheck();

		if (loginId == null || password == null || loginId.isBlank() || password.isBlank()) {
			//ログインIDかパスワード、ユーザ名、どれかが一つでも未入力なら
			message1 = "ログインIDとユーザ名・パスワードは必須入力です";

			//エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert1", message1);
			dispatcher = request.getRequestDispatcher("index.jsp");

		}

		//直下条件式に当てはまるときは上で処理をしているため対応不要
		if (!(loginId == null || password == null)) { //nullチェック
			if (!(loginId.matches("^[0-9a-zA-Z]*$") && password.matches("^[0-9a-zA-Z]*$"))) {

				//半角英数字のみ
				message2 = "半角英数字で入力してください";
				request.setAttribute("alert2", message2);
				dispatcher = request.getRequestDispatcher("index.jsp");

			} else if (!(loginId.isBlank() || password.isBlank())) {
				//ログイン認証を行い、ユーザ情報を取得
				DBManager dbm = new DBManager();
				UserDTO user = dbm.getLoginUser(loginId, password);

				if (user != null) {
					//ユーザ情報を取得できたら、書き込み内容リストを取得
					ArrayList<ShoutDTO> list = dbm.getShoutsList();
					HttpSession session = request.getSession();

					//ログインユーザ情報、書き込み内容リストとしてセッションに保存
					session.setAttribute("user", user);
					session.setAttribute("shouts", list);
					dispatcher = request.getRequestDispatcher("top.jsp");

				} else {
					//ユーザ情報が取得できない場合
					//エラーメッセージをリクエストオブジェクトに保存
					message2 = "ログインID・ユーザ名・パスワードのいずれかが違います";
					request.setAttribute("alert2", message2);
					dispatcher = request.getRequestDispatcher("index.jsp");

				}
			}
		}

		dispatcher.forward(request, response);
	}

}
