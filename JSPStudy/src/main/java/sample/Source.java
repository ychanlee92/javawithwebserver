package sample;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Source extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Source() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("source start");
		request.setAttribute("name", "yehchan");
		// 1. forward방식으로 페이지 이동
//		RequestDispatcher view = request.getRequestDispatcher("Destination");
//		view.forward(request, response);
		// 2. redirect방식으로 이동
		response.sendRedirect("Destination");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
