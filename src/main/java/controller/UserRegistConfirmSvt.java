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
public class UserRegistConfirmSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserRegistConfirmSvt() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//文字化け対策
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		//パラメータの取得

		String loginId = request.getParameter("loginId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String icon = request.getParameter("icon");
		String profile = request.getParameter("profile");

		UserDTO user = new UserDTO(loginId, password, userName, icon, profile);

		//データベース接続のためのオブジェクト作成
		DBManager dbm = new DBManager();
		RequestDispatcher dispatcher = null;
		//Insertの実行＋実行結果が変数に代入される
		String result = dbm.insertUserData(user);

		if (result.equals("success")) {
			//データベースに正常登録できた場合
			request.setAttribute("user", user); //遷移先のjspに登録したデータを受け渡す

			dispatcher = request.getRequestDispatcher("userRegistResult.jsp");

		} else if (result.equals("used")) {
			//登録しようとしたIDがすでに使用されていた場合
			String message = "そのログインIDはすでに使用されています";
			request.setAttribute("alertRegist", message); //エラーメッセージを登録確認画面jspに送る

			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
		} else {
			//データベース登録でエラーが発生した場合
			String message = "登録に失敗しました";
			request.setAttribute("alertRegist", message); //エラーメッセージを登録確認画面jspに送る

			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
		}

		//正常かエラーかで指定された遷移先に移動
		dispatcher.forward(request, response);

	}

}
