package login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import sample.DBUtil;

public class LoginCheck extends HttpServlet {
//	public static final String SID = "admin";
//	public static final String SPASSWORD = "123456";

	public LoginCheck() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("성공");
		try {
			String id = request.getParameter("userId2");
			String password = request.getParameter("userPw2");
			con = DBUtil.getConnection();
			if (con != null) {
				System.out.println("성공2");
			} else {
				System.out.println("실패");
			}
			String sql = "select userId, userpassword from userInfo where userId = ? and userpassword =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				System.out.println("성공3");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

//		if (id.equals(SID) && password.equals(SPASSWORD)) {
//			System.out.println(id);
//		}
		response.sendRedirect("Login");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
