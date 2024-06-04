package sample;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LifeCycle extends HttpServlet {
	// 생성자
	public LifeCycle() {
		System.out.println("LifeServlet의 생성자 호출됨...");
	}

	@Override
	// LifeServlet의 초기화 작업을 담당한다.
	// Servlet객체 생성시 단 한번 수행됨
	public void init() throws ServletException {
		System.out.println("init() 호출됨...");
	}

	@Override
	// LifeServlet 객체가 WAS에서 소멸될때 수행됨.
	public void destroy() {
		System.out.println("destroy() 호출됨...");
	}

	@Override
	// 클라이언트의 연결요청이 있을때 마다 호출된다.
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service() 호출됨...");
	}
}
