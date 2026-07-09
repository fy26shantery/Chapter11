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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 送信情報の取得
		String loginId = request.getParameter("loginId");
		//String userName = request.getParameter("userName");
		String password = request.getParameter("password");

		RequestDispatcher dispatcher = null;
		String message = null;
		String message2 = null;

		//ログインIDのチェック（結果は message に入れる）
		if (loginId == null || loginId.equals("")) {
			message = "ログインIDを入力してください。";
		} else if (!loginId.matches("^[a-zA-Z0-9]+$")) {
			message = "ログインIDは半角英数字のみで入力してください。";
		}

		//パスワードのチェック（結果は message2 に入れる）
		if (password == null || password.equals("")) {
			message2 = "パスワードを入力してください。";
		}

		//どちらか片方でもエラーがあれば、この時点で index.jsp に戻す
		if (message != null || message2 != null) {
			//alert と alert2）で保存して上書きを防ぐ
			if (message != null) {
				request.setAttribute("alert", message);
			}
			if (message2 != null) {
				request.setAttribute("alert2", message2);
			}

			// index.jsp に処理を転送して、ここで処理を終了(return)する
			dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
			return;
		}

		//認証処理（入力チェックがどちらも null の時だけ来る）
		DBManager dbm = new DBManager();
		UserDTO user = dbm.getLoginUser(loginId, password);

		if (user != null) {
			// ログイン成功：必要なデータをセッションに詰めて top.jspにいく
			ArrayList<ShoutDTO> list = dbm.getAllShouts();
			HttpSession session = request.getSession();

			session.setAttribute("user", user);
			session.setAttribute("shouts", list);

			dispatcher = request.getRequestDispatcher("top.jsp");
		} else {
			// ログイン失敗：組み合わせが違う場合
			message = "ログインIDまたはパスワードが違います。";
			request.setAttribute("alert", message); // ここは片方（alert）だけ使う

			dispatcher = request.getRequestDispatcher("index.jsp");
		}

		// 処理を転送
		dispatcher.forward(request, response);
	}
}