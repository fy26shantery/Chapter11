package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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

		String loginId = request.getParameter("loginId");//半角英数字、4桁、32桁
		String userName = request.getParameter("userName");//最小1最大６４桁
		String password = request.getParameter("password");//半角英数字、４桁、３２桁
		String icon = request.getParameter("icon");
		String profile = request.getParameter("profile");

		String message = null;
		String messageId = null;
		String messageName = null;
		String messagePass = null;

		String action = request.getParameter("action");
		RequestDispatcher dispatcher = null;

		if ("登録".equals(action)) {

			if (loginId == null || loginId.isBlank()) {//空白だったら
				messageId = "Idは必須入力です。4～32桁の半角英数字を入力してください";
				// エラーメッセージをリクエストオブジェクトに保存
				request.setAttribute("alertId", messageId);
			} else if (!loginId.matches("^[0-9a-zA-Z]{4,32}$")) {//半角英数字じゃなくて4-32桁じゃなかった場合
				messageId = "4～32桁の半角英数字を入力してください";
				request.setAttribute("alertId", messageId);
			}

			if (userName == null || userName.isBlank()) {//空白だったら
				messageName = "名前は必須入力です。4～32桁の半角英数字を入力してください";
				// エラーメッセージをリクエストオブジェクトに保存
				request.setAttribute("alertName", messageName);
			} else if (!userName.matches("^.{1,64}$")) {//半角英数字じゃなくて1-64桁じゃなかった場合
				messageName = "1～64桁で入力してください";
				request.setAttribute("alertName", messageName);
			}

			if (password == null || password.isBlank()) {//空白だったら
				messagePass = "パスワードは必須入力です。4～32桁の半角英数字を入力してください";
				// エラーメッセージをリクエストオブジェクトに保存
				request.setAttribute("alertPass", messagePass);
			} else if (!password.matches("^[0-9a-zA-Z]{4,32}$")) {//半角英数字じゃなくて4-32桁じゃなかった場合
				messagePass = "4～32桁の半角英数字を入力してください";
				request.setAttribute("alertPass", messagePass);
			}

			if (messageId == null && messageName == null && messagePass == null) {

				request.setAttribute("loginId", loginId);
				request.setAttribute("userName", userName);
				request.setAttribute("password", password);
				request.setAttribute("icon", icon);
				request.setAttribute("profile", profile);
				dispatcher = request.getRequestDispatcher("userRegistConfirm.jsp");

				dispatcher.forward(request, response);
			} else {
				dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			}
			dispatcher.forward(request, response);
		} else if ("戻る".equals(action)) {
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			dispatcher.forward(request, response);
		} else {
			message = "問題が発生したので、もう一度やり直してください";
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			request.setAttribute("alert", message);
			dispatcher.forward(request, response);
		}

	}

}
