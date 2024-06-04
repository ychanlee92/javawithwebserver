package sample;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MyFirstSevletTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyFirstSevletTest() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청한 페이지를 만들어서 보내야 한다.
		//문자셋을 설정한다.
		response.setContentType("text/html; charset=UTF-8");
		//필요한 자료가 있으면 데이터베이스에서 자료를 가져온다.(오라클 클래스로더, 접속, 쿼리, 정보 로드)
		Date date = new Date();
		//HTML문자구조를 만들어서 자료를 보낸다.
		PrintWriter pw = response.getWriter();
		pw.println("<!DOCTYPE html>");
		pw.println("<html lang=\"en\">");
		pw.println("<head>");
		pw.println("<title>my first sevlet</title>");
		pw.println("</head>");
		pw.println("<body>");
		for(int i=0;i<3;i++) {
			pw.println("<h1>"+date.toString()+"success</h1>");			
		}
		pw.println("</body>");
		pw.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
