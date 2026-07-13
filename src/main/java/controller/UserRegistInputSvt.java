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
 * Servlet implementation class UserRegistInputSvt
 */
@WebServlet("/uii")
public class UserRegistInputSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//userRegistInput.jspで「送信」が押された時
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//文字化け対策
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String loginId = request.getParameter("loginId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String icon = request.getParameter("icon");
		String profile = request.getParameter("profile");

		String message1 = null;
		String message2 = null;
		String message3 = null;
		String message4 = null;
		String message5 = null;
		String message6 = null;
		String message7 = null;
		String message8 = null;
		String message9 = null;

		boolean isError = false;

		RequestDispatcher dispatcher = null;

		//ログインIDチェック
		if (loginId == null || loginId.equals("")) {
			//ログインID未入力
			message1 = "ログインIDは必須入力です";

			//エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert1", message1);

			//index.jspに処理を転送
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");

		} else if (!loginId.matches("^[0-9A-Za-z]*$")) {

			//ログインID
			message1 = "ログインIDの入力に半角英数字以外が使用されています";

			//エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert1", message1);

			//index.jspに処理を転送
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			isError = true;

		} else if (loginId.length() < 4 || loginId.length() > 32) {

			//ログインID
			message2 = "ログインIDの入力は4文字以上、32文字以内です";

			//エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert2", message2);

			//index.jspに処理を転送
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");

		} else {
			DBManager dbm = new DBManager();
			UserDTO exsituser = dbm.isLoginID(loginId);

			//ログインIDが使用されている場合
			if (exsituser != null) {
				//エラーメッセージ入力
				message3 = "入力されたログインIDは使用されています。他のIDを入力してください。";
				//エラーメッセージをリクエストオブジェクトに保存
				request.setAttribute("alert3", message3);

				dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
				isError = true;

			}

		}

		//ユーザーネームチェック
		if (userName == null || userName.equals("")) {
			//パスワード未入力
			message4 = "ユーザーネームは必須入力です";

			//エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert4", message4);

			//index.jspに処理を転送
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			isError = true;

		} else if (userName.length() < 1 || userName.length() > 64) {

			//ユーザーネーム文字数表現
			message5 = "ユーザーネームの入力は1文字以上64文字以内で入力してください";

			//エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert5", message5);

			//index.jspに処理を転送
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			isError = true;

		}

		//パスワードチェック
		if (password == null || password.equals("")) {
			//パスワード未入力
			message6 = "パスワードは必須入力です";

			//エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert6", message6);

			//index.jspに処理を転送
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			isError = true;

		} else if (!password.matches("^[0-9A-Za-z]*$")) {

			//パスワード正規表現
			message6 = "パスワードの入力に半角英数字以外が使用されています";

			//エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert6", message6);

			//index.jspに処理を転送
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			isError = true;

		} else if (password.length() < 4 || password.length() > 32) {

			//パスワード文字数表現
			message7 = "パスワードの入力は4文字以上,32文字以内で入力してください";

			//エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert7", message7);

			//index.jspに処理を転送
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			isError = true;

		}

		//アイコン選択チェック
		if (icon == null || icon.equals("")) {
			//アイコン未入力
			message8 = "アイコンは必須選択です";

			//エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert8", message8);

			//index.jspに処理を転送
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			isError = true;

		} else if (userName.length() > 128) {

			//アイコン文字数表現
			message8 = "アイコンは必須選択です";

			//エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert8", message8);

			//index.jspに処理を転送
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			isError = true;

		}

		//プロフィールチェック
		if (profile.length() > 128) {

			//プロフィール文字数表現
			message9 = "プロフィールは128文字以下の記入になります";

			//エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("alert9", message9);

			//index.jspに処理を転送
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			isError = true;

		}

		//正常な働きをしたとき
		if (isError == false) {
			//登録においてエラーが出ない場合

			UserDTO u = new UserDTO();

			u.setLoginId(loginId);
			u.setUserName(userName);
			u.setPassword(password);
			u.setIcon(icon);
			u.setProfile(profile);

			request.setAttribute("newUser", u);

			//入力されたものをそのまま送る場合
			//フォーワードで画面遷移

			dispatcher = request.getRequestDispatcher("userRegistConfirm.jsp");

		}

		dispatcher.forward(request, response);

	}

	//userRegistConfirm.jspでキャンセルが押された場合,情報を保持したまま登録画面にもどる
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//文字化け対策
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

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

		request.setAttribute("backUser", u);

		//入力されたものをそのまま送る場合
		//フォーワードで画面遷移

		RequestDispatcher rd = request.getRequestDispatcher("userRegistInput.jsp");
		rd.forward(request, response);

	}

}
