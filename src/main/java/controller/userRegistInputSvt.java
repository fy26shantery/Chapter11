package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class userRegistInputSvt
 */
@WebServlet("/uii")
public class userRegistInputSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public userRegistInputSvt() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String forwardFile = "";

		//		ただログイン画面を開こうとしているのか、戻るボタンでログイン画面に戻ってきたのかを判断して、フォワード先をスイッチする
		if ("back".equals(action)) {
			forwardFile = "index.jsp";
		} else {
			forwardFile = "userRegistInput.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardFile);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 文字化け対策
		RequestDispatcher dispatcher = request.getRequestDispatcher("userRegistInput.jsp");
		dispatcher.forward(request, response);
	}

}
