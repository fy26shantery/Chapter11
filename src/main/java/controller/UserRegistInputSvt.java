package controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.InputCheck;
import dto.UserDTO;

@WebServlet("/uii")
public class UserRegistInputSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserRegistInputSvt() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//文字化け対策
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;UTF-8");

		RequestDispatcher dispathcer = null;

		//フォームの値を取得
		String loginId = request.getParameter("loginId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String icon = request.getParameter("icon");
		String profile = request.getParameter("profile");

		InputCheck check = new InputCheck();
		UserDTO user = new UserDTO();

		String alertMessage = null;
		//リストの中に中身があるとエラー処理を実行
		ArrayList<String> errorCheck = new ArrayList<>();

		//ログインIDの入力チェック
		if (check.checkOnlyEngNum(loginId).equals("OK")) {
			user.setLoginId(loginId);
		} else if (check.checkOnlyEngNum(loginId).equals("EMPTY")) {
			//入力無しの場合
			alertMessage = "ログインIDを入力してください";

			errorCheck.add("error");
			request.setAttribute("alertLogId", alertMessage);

		} else {
			//半角英数字以外の入力の場合
			alertMessage = "半角英数字で入力してください";

			errorCheck.add("error");
			request.setAttribute("alertLogId", alertMessage);
		}

		//ユーザー名の入力チェック
		if (check.checkFilled(userName)) {
			//UserDTOオブジェクトに値をセット
			user.setUserName(userName);
		} else {
			//入力されていない
			alertMessage = "ユーザー名を入力してください";

			errorCheck.add("error");
			request.setAttribute("alertUN", alertMessage);
		}

		//パスワードの入力チェック
		if (check.checkOnlyEngNum(password).equals("OK")) {
			//UserDTOオブジェクトに値をセット
			user.setPassword(password);
		} else if (check.checkOnlyEngNum(password).equals("EMPTY")) {
			//入力無しの場合
			alertMessage = "パスワードをを入力してください";

			errorCheck.add("error");
			request.setAttribute("alertPass", alertMessage);

		} else {
			//半角英数字以外の入力の場合
			alertMessage = "半角英数字で入力してください";
			errorCheck.add("error");
			request.setAttribute("alertPass", alertMessage);
		}

		//アイコンのnullチェック
		if (check.checkFilled(icon)) {
			//UserDTOオブジェクトに値をセット
			user.setIcon(icon);
		} else {
			//手違いでformのrequiredが作動しないとき
			alertMessage = "アイコンを選択してください";

			errorCheck.add("error");
			request.setAttribute("alertIcon", alertMessage);
		}

		//プロフィールのセット
		if (!(profile == null || profile.isBlank())) {
			user.setProfile(profile);
		} else { //未入力の場合、空文字をいれてセット
			profile = "";
			user.setProfile(profile);
		}

		if (errorCheck.size() == 0) {
			//エラーがない場合は確認画面に
			//取得したuserオブジェクトをセット
			request.setAttribute("user", user);
			dispathcer = request.getRequestDispatcher("userRegistConfirm.jsp");
		} else {
			//エラーがある場合は登録画面に戻る
			dispathcer = request.getRequestDispatcher("userRegistInput.jsp");
		}
		//指定された遷移先に移動
		dispathcer.forward(request, response);
	}

}
