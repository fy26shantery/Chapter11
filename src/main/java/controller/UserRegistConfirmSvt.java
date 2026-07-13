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
		String messageIcon = null;
		String messagePro = null;

		String action = request.getParameter("action");
		RequestDispatcher dispatcher = null;

		if ("登録".equals(action)) {

			if (loginId == null || loginId.isBlank()) {//空白だったら
				messageId = "IDは必須入力です。4～32桁の半角英数字を入力してください";
				// エラーメッセージをリクエストオブジェクトに保存
				request.setAttribute("alertId", messageId);
			} else if (!loginId.matches("^[0-9a-zA-Z]{4,32}$")) {//半角英数字じゃなくて4-32桁じゃなかった場合
				messageId = "IDは4～32桁の半角英数字を入力してください";
				request.setAttribute("alertId", messageId);
			}

			if (userName == null || userName.isBlank()) {//空白だったら
				messageName = "ユーザ名は必須入力です。1～64文字で入力してください";
				// エラーメッセージをリクエストオブジェクトに保存
				request.setAttribute("alertName", messageName);
			} else if (!userName.matches("^.{1,64}$")) {//半角英数字じゃなくて1-64桁じゃなかった場合
				messageName = "ユーザ名は1～64文字でで入力してください";
				request.setAttribute("alertName", messageName);
			}

			if (password == null || password.isBlank()) {//空白だったら
				messagePass = "パスワードは必須入力です。4～32桁の半角英数字を入力してください";
				// エラーメッセージをリクエストオブジェクトに保存
				request.setAttribute("alertPass", messagePass);
			} else if (!password.matches("^[0-9a-zA-Z]{4,32}$")) {//半角英数字じゃなくて4-32桁じゃなかった場合
				messagePass = "パスワードは4～32桁の半角英数字を入力してください";
				request.setAttribute("alertPass", messagePass);
			}

			if (icon.equals(null)) {
				messagePro = "アイコンを選択してください";
				request.setAttribute("alertIcon", messageIcon);
			}
			if (!userName.matches("^.{0,128}$")) { //128文字よりも大きかったら
				messagePro = "プロフィールは128文字以内で入力してください";
				request.setAttribute("alertPro", messagePro);

			}

			if (messageId == null && messageName == null && messagePass == null && messageIcon == null
					&& messagePro == null) {

				request.setAttribute("loginId", loginId);
				request.setAttribute("userName", userName);
				request.setAttribute("password", password);
				request.setAttribute("icon", icon);
				request.setAttribute("profile", profile);
				dispatcher = request.getRequestDispatcher("userRegistConfirm.jsp");

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
