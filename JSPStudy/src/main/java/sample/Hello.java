package sample;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String tel;
	private String email;

	public Hello() {
		super();
	}

	@Override
	public void init() throws ServletException {
		System.out.println("초기값을 가져올때 진행함");
		ServletConfig svc = getServletConfig();
		tel = svc.getInitParameter("tel");
		email = svc.getInitParameter("email");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		Date date = new Date();
		// HTML문자구조를 만들어서 자료를 보낸다.
		pw.println("<!DOCTYPE html>");
		pw.println("<html lang=\"en\">");
		pw.println("<head>");
		pw.println("<title>my second sevlet</title>");
		pw.println("</head>");
		pw.println("<body>");
		for (int i = 0; i < 3; i++) {
			pw.println("<h1>" + date.toString() + "success</h1>");
		}
		pw.println("<ul>");
		pw.println("<li>전화번호: " + tel + "</li>");
		pw.println("<li>이메일: " + email + "</li>");
		pw.println("</ul>");
		pw.println("</body>");
		pw.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
