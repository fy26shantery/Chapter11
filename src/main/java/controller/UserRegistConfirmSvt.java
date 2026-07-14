package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.DBManager;

/**
 * Servlet implementation class UserRegistConfirmSvt
 */
@WebServlet("/UserRegistConfirmSvt")
public class UserRegistConfirmSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegistConfirmSvt() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("userRegistConfirm.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String loginId = request.getParameter("loginId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String userIcon = request.getParameter("userIcon");
		String profile = request.getParameter("profile");

		DBManager dbm = new DBManager();

		String action = request.getParameter("action");
		RequestDispatcher dispatcher = null;
		String insertMsg = null;

		//キャンセルが選択されたなら送り返す
		if ("キャンセル".equals(action)) {
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
			dispatcher.forward(request, response);
			return;
		} else { //OKだったらデータベースに登録
			boolean check = dbm.insertUser(userName, loginId, password, userIcon, profile);
			if (check) { //データベースに登録が完了したら
				dispatcher = request.getRequestDispatcher("userRegistResult.jsp");

			} else { //データベースに登録できなかったら
				insertMsg = "登録できませんでした。もう一度入力し直してください。";
				// エラーメッセージをリクエストオブジェクトに保存
				request.setAttribute("insertAlert", insertMsg);
				dispatcher = request.getRequestDispatcher("userRegistInput.jsp");

			}
			dispatcher.forward(request, response);
		}

	}

}
