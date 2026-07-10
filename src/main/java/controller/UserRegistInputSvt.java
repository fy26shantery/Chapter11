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
@WebServlet("/userregistinputsvt")
public class UserRegistInputSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegistInputSvt() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 送信情報の取得
		String loginId = request.getParameter("tourokuId");
		String userName = request.getParameter("tourokuName");
		String password = request.getParameter("tourokuPass");
		String icon = request.getParameter("tourokuIcon");
		String profile = request.getParameter("tourokuProf");

		RequestDispatcher dispatcher = null;

		String notInputMsg = null;
		String halfwidthMsg = null;
		String existingIdMsg = null;

		if (loginId.equals("") || password.equals("") || userName.equals("")) {
			// ログインID 、ユーザー名、パスワードのどれか、もしくは未入全て未入力なら
			notInputMsg = "ログインID、ユーザー名、パスワードは必須入力です。";

			// エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("notInputAlert", notInputMsg);

			// userRegistInput.jsp に処理を転送
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");

		}

		if (!loginId.matches("^[a-z0-9]+$") || !password.matches("^[a-z0-9]+$")) {
			//半角英数字でないなら
			halfwidthMsg = "ログインIDとパスワードは半角英数字のみで入力してください。";

			// エラーメッセージをリクエストオブジェクトに保存
			request.setAttribute("halfwidthAlert", halfwidthMsg);

			// userRegistInput.jsp に処理を転送
			dispatcher = request.getRequestDispatcher("userRegistInput.jsp");

		} else {

			// ユーザー情報を取得、使用されているログインIDか
			DBManager dbm = new DBManager();
			boolean TourokuUser = dbm.getTourokuUser(loginId);

			if (TourokuUser != false) {
				// ユーザー情報を取得できたら、エラーメッセージを表示
				existingIdMsg = "既に使用されているログインIDです。";
				// エラーメッセージをリクエストオブジェクトに保存
				request.setAttribute("existingIdAlert", existingIdMsg);
				// userRegistInput.jsp に処理を転送
				dispatcher = request.getRequestDispatcher("userRegistInput.jsp");

			} else if (TourokuUser == true) {
				// 入力されたものが新しいIDの場合 DTOにつめる
				UserDTO user = dbm.setTouroku(userName, loginId, password, icon, profile);

				//登録確認画面へ進む
				request.setAttribute("user", user);
				dispatcher = request.getRequestDispatcher("userRegistResult.jsp");
			}

		}
		//処理を転送
		dispatcher.forward(request, response);
	}

}
