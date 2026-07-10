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
	//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//		doGet(request, response);
	//	}

}
