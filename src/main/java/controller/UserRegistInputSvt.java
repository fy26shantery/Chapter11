package controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dto.UserDTO;
import usefulMethod.MyCounter;

@WebServlet("/uii")
public class UserRegistInputSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserRegistInputSvt() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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

		usefulMethod.InputCheck check = new usefulMethod.InputCheck();
		MyCounter counter = new MyCounter();
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
			alertMessage = "ログインIDは半角英数字で入力してください";

			errorCheck.add("error");
			request.setAttribute("alertLogId", alertMessage);
		}

		//ログインID入力文字数チェック
		if (check.checkFilled(loginId)) { //入力がない時は処理をしない（上でしているので）
			user.setLoginId(loginId);
			int inputLength = user.getLoginId().length();
			//メソッドを用いて最大桁数、最小桁数の条件に当てはまるか判定
			String result = counter.maxAndMinCounter(32, 4, inputLength);
			if (!(result.equals("OK"))) {
				errorCheck.add("error");
				result = "ログインIDは" + result; //resultのdefaltメッセージに該当項目を付け足す
				request.setAttribute("alertLogIdLen", result);
			}

		}

		//ユーザー名の入力チェック
		if (check.checkFilled(userName)) {
			//UserDTOオブジェクトに値をセット

		} else {
			//入力されていない
			alertMessage = "ユーザー名を入力してください";

			errorCheck.add("error");
			request.setAttribute("alertUN", alertMessage);
		}

		//ユーザー名入力文字数チェック
		if (check.checkFilled(userName)) { //入力がない時は処理をしない（上でしているので）
			user.setUserName(userName);
			int inputLength = user.getUserName().length();
			//メソッドを用いて最大桁数、最小桁数の条件に当てはまるか判定
			String result = counter.maxAndMinCounter(64, 1, inputLength);
			if (!(result.equals("OK"))) { //エラー時
				errorCheck.add("error");
				result = "ユーザー名は" + result; //resultのdefaltメッセージに該当項目を付け足す
				request.setAttribute("alertUN", result);
			}

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
			alertMessage = "パスワードは半角英数字で入力してください";
			errorCheck.add("error");
			request.setAttribute("alertPass", alertMessage);
		}

		//パスワード入力文字数チェック
		if (check.checkFilled(password)) { //入力がない時は処理をしない（上でしているので）
			user.setPassword(password);
			int inputLength = user.getPassword().length();
			//メソッドを用いて最大桁数、最小桁数の条件に当てはまるか判定
			String result = counter.maxAndMinCounter(32, 4, inputLength);
			if (!(result.equals("OK"))) { //エラー時
				errorCheck.add("error");
				result = "パスワードは" + result; //resultのdefaltメッセージに該当項目を付け足す
				request.setAttribute("alertPassLen", result);
			}

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

		//アイコン入力文字数チェック
		if (check.checkFilled(icon)) { //入力がない時は処理をしない（上でしているので）
			user.setIcon(icon);
			int inputLength = user.getIcon().length();
			//メソッドを用いて最大桁数、最小桁数の条件に当てはまるか判定
			String result = counter.maxCounter(128, inputLength);
			if (!(result.equals("OK"))) { //エラー時
				errorCheck.add("error");
				result = "アイコンは" + result; //resultのdefaltメッセージに該当項目を付け足す
				request.setAttribute("alertIcon", result);
			}

		}

		//プロフィールのセット
		if (!(profile == null || profile.isBlank())) {
			user.setProfile(profile);
			//入力文字数チェック
			int inputLength = user.getProfile().length();
			//メソッドを用いて最大桁数、最小桁数の条件に当てはまるか判定
			String result = counter.maxCounter(64, inputLength);
			if (!(result.equals("OK"))) { //エラー時
				errorCheck.add("error");
				result = "プロフィールは" + result; //resultのdefaltメッセージに該当項目を付け足す
				request.setAttribute("alertProfile", result);
			}

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
