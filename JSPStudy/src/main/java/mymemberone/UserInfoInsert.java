package mymemberone;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sample.DBUtil;

public class UserInfoInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserInfoInsert() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBPoolUtil.getConnection();
			if (con != null) {
				System.out.println("success");
			}
			String userId = request.getParameter("userId");
			String password = request.getParameter("userPw");
			String passwordCheck = request.getParameter("userPwEqual");
			String userName = request.getParameter("userName");
			String email = request.getParameter("userEmail");
			String postNum = request.getParameter("userAddressNumber");
			String address1 = request.getParameter("userAddress");
			String address2 = request.getParameter("userAddressDetailed");
			String address3 = request.getParameter("userAddressExtra");
			String phone1 = request.getParameter("userPhone1");
			String phone2 = request.getParameter("userPhone2");
			String phone3 = request.getParameter("userPhone3");
			String phone = phone1 + phone2 + phone3;
			String sql = "insert into userinfo values (user_seq.nextval, ?,?,?,?,?,?,?,?, ?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, password);
			pstmt.setString(3, passwordCheck);
			pstmt.setString(4, userName);
			pstmt.setString(5, email);
			pstmt.setString(6, postNum);
			pstmt.setString(7, address1);
			pstmt.setString(8, address2);
			pstmt.setString(9, address3);
			pstmt.setString(10, phone);
			int value = pstmt.executeUpdate();
			if (value == 1) {
				response.sendRedirect("mymemberone/mainsection.jsp");
				System.out.println("성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
