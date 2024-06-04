package login;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("login ok");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();

		HttpSession session = request.getSession(false);
		
		if (session != null) {
			pw.println("<!DOCTYPE html>");
			pw.println("<html lang=\"en\">");
			pw.println("<head>");
			pw.println("<title>Document</title>");
			pw.println("</head>");
			pw.println("<body>");
			String id = (String) session.getAttribute("id");
			pw.print(id);
			pw.println("<table border=\"1 width=300\">");
			pw.println("<tr>");
			String data = String.format("<td width=\"300\" align=\"center\"> %s 님 환영합니다. </td>", id);
			pw.println(data);
			pw.println("</tr>");
			pw.println("<tr>");
			pw.println("<td align=\"center\">");
			pw.println("<a href=\"#\">회원정보</a>");
			pw.println("<a href=\"Logout\">로그아웃</a>");
			pw.println("</td>");
			pw.println("</tr>");
			pw.println("</table>");
			pw.println("</body>");
			pw.println("</html>");
		} else {
			response.sendRedirect("member/login.html");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
