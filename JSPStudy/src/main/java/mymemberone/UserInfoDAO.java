package mymemberone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.DBPoolUtil;

public class UserInfoDAO {
	private static UserInfoDAO instance = null;// 멤버필드

	private UserInfoDAO() {
	}// 생성자

	public static UserInfoDAO getInstance() {// 메소드
		if (instance == null) {
			synchronized (UserInfoDAO.class) {
				instance = new UserInfoDAO();
			}
		}
		return instance;
	}

	public boolean idCheck(String id) {
		boolean result = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBPoolUtil.getConnection();
			pstmt = conn.prepareStatement("select * from userinfo where userid = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (!rs.next()) {
				result = false;
			}
			System.out.println(result);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}
		return result;
	}
}
