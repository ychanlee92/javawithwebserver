package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.UserInfo;
import sample.DBUtil;
import sample.Visit;

public class UserInfoPrint extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserInfoPrint() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		List<UserInfo> userList = null;

		String sql = "select * from userInfo";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			userList = new ArrayList<UserInfo>();
			while (rs.next()) {
				UserInfo user = new UserInfo();
				user.setUserNo(rs.getInt("userno"));
				user.setUserId(rs.getString("userId"));
				user.setPassword(rs.getString("userpassword"));
				user.setPasswordCheck(rs.getString("passwordCheck"));
				user.setUserName(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setPostNum(rs.getInt("postnum"));
				user.setAddress1(rs.getString("address1"));
				user.setAddress2(rs.getString("address2"));
				user.setAddress3(rs.getString("address3"));
				user.setPhone(rs.getInt("phone"));
				user.setUserDate(rs.getString("userdate"));
				userList.add(user);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception se) {
			}
		}
		pw.println("<html>");
		pw.println(" <head>");
		pw.println(" <title>회원가입 리스트</title>");
		pw.println(" </head>");
		pw.println(" <body>");
		pw.println("<table align=\"center\" width=\"500\" border=\"1\">");
		for (UserInfo data : userList) {
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">번호</th>");
			pw.println("  <td width=\"430\">" + data.getUserNo() + "</td>");
			pw.println(" </tr>");
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">ID</th>");
			pw.println("  <td width=\"430\">" + data.getUserId() + "</td>");
			pw.println(" </tr>");
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">비밀번호</th>");
			pw.println("  <td width=\"430\">" + data.getPassword() + "</td>");
			pw.println(" </tr>");
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">이름</th>");
			pw.println("  <td width=\"430\">" + data.getUserName() + "</td>");
			pw.println(" </tr>");
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">이메일</th>");
			pw.println("  <td width=\"430\">" + data.getEmail() + "</td>");
			pw.println(" </tr>");
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">우편번호</th>");
			pw.println("  <td width=\"430\">" + data.getPostNum() + "</td>");
			pw.println(" </tr>");
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">주소</th>");
			pw.println("  <td width=\"430\">" + data.getAddress1() + "</td>");
			pw.println(" </tr>");
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">상세주소</th>");
			pw.println("  <td width=\"430\">" + data.getAddress2() + "</td>");
			pw.println(" </tr>");
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">세부주소</th>");
			pw.println("  <td width=\"430\">" + data.getAddress3() + "</td>");
			pw.println(" </tr>");
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">전화번호</th>");
			pw.println("  <td width=\"430\">" + data.getPhone() + "</td>");
			pw.println(" </tr>");
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">날짜</th>");
			pw.println("  <td width=\"430\">" + data.getUserDate() + "</td>");
			pw.println(" </tr>");
			pw.println(0);
		}
		pw.println(" </table>");
		pw.println("<p align=center> <a href=/JSPStudy/member/signup.html>회원가입으로 돌아가기</a></p>");
		pw.println(" </form>");
		pw.println("</body>");
		pw.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
