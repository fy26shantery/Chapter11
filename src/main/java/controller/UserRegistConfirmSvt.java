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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
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

		if (dbm.insertUserData(user)) {
			//データベースに正常登録できた場合
			request.setAttribute("user", user); //遷移先のjspに登録したデータを受け渡す

			dispatcher = request.getRequestDispatcher("userRegistResult.jsp");

		} else {
			//データベース登録でエラーが発生した場合
			String message = "登録に失敗しました";
			request.setAttribute("alert", message); //エラーメッセージを登録確認画面jspに送る

			dispatcher = request.getRequestDispatcher("userRegistConfirm.jsp");
		}

		//正常かエラーかで指定された遷移先に移動
		dispatcher.forward(request, response);

	}

}
