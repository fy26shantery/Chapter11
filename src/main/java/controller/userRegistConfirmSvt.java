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

public class userRegistConfirmSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		//		入力された値を取得
		String loginId = request.getParameter("loginId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String icon = request.getParameter("icon");
		String profile = request.getParameter("profile");

		//		エラーメッセージ用の変数を用意
		String errId = "", errName = "", errPass = "", errIcon = "", errProfile = "";
		DBManager dbm = new DBManager();

		// 入力チェック
		if (loginId.equals("") || userName.equals("") || password.equals("")) {
			errId = "必須項目（ID、ユーザー名、パスワード）を入力してください";
		} else if (loginId.length() < 4 || loginId.length() > 32) {
			errId = "ログインIDは4文字以上で入力してください";
		} else if (!loginId.matches("^[a-zA-Z0-9]+$")) {
			errId = "ログインIDは半角英数字で入力してください（空白、スペース不可）";
		} else if (dbm.isOverlap(loginId)) {
			errId = "指定されたログインIDは既に使用されています";
		}

		if (userName == null || userName.isBlank()) {
			errName = "ユーザー名を入力してください(空白のみは不可）";
		} else if (userName.length() > 64) {
			errName = "ユーザー名は６４文字以下で入力してください";

		}

		if (password == null || password.equals("")) {
			errPass = "パスワードを入力してください";
		} else if (password.length() < 4 || password.length() > 32) {
			errPass = "パスワードを４文字以上３２文字以下で入力してください";
		} else if (!password.matches("^[a-zA-Z0-9]+$")) {
			errPass = "パスワードは半角英数字のみで入力してください（空白、スペース不可）";
		}
		if (icon == null || icon.equals("")) {
			errIcon = "アイコンを選択してください";
		}
		if (profile != null && profile.length() > 128) {
			errProfile = "プロフィールは１２８文字以下で入力してください";
		}
		if (!errId.equals("") || !errName.equals("") || !errPass.equals("") || !errIcon.equals("")
				|| !errProfile.equals("")) {
			// エラー時は登録画面へ戻る
			request.setAttribute("errId", errId);
			request.setAttribute("errName", errName);
			request.setAttribute("errPass", errPass);
			request.setAttribute("errIcon", errIcon);
			request.setAttribute("errProfile", errProfile);

			RequestDispatcher dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			dispatcher.forward(request, response);
		} else {
			// 成功時はDTOに詰めて確認画面へ
			UserDTO registUser = new UserDTO();
			registUser.setLoginId(loginId);
			registUser.setUserName(userName);
			registUser.setPassword(password);
			registUser.setIcon(icon);
			registUser.setProfile(profile);

			request.setAttribute("registUser", registUser);
			RequestDispatcher dispatcher = request.getRequestDispatcher("userRegistConfirm.jsp");
			dispatcher.forward(request, response);
		}

		//		String action = request.getParameter("action");
		//		String forwardFile = "";
		//		if ("back".equals(action)) {
		//			forwardFile = "userRegistInput.jsp";
		//		} else {
		//			forwardFile = "userRegistResult.jsp";
		//		}
		//		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardFile);
		//		dispatcher.forward(request, response);
	}
}