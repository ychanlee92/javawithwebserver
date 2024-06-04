package jdbc;

import java.sql.*;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.naming.*;

public class DBPoolUtil2 {
	public static Connection getConnection() {
//		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/myOracle");
			con = ds.getConnection();
			System.out.println("성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연결 실패");
		}
		return con;

	}

	public static void dbReleaseClose(ResultSet rs, Statement stmt, Connection con) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (con != null) {
				ConnectionPool pool = ConnectionPool.getInstance();
				pool.releaseConnection(con);
			}
		} catch (Exception e) {
		}
	}

	public static void dbReleaseClose(Statement stmt, Connection conn) {
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException ex) {
		}
		try {
			if (conn != null) {
				ConnectionPool pool = ConnectionPool.getInstance();
				pool.releaseConnection(conn);
			}
		} catch (Exception ex) {
		}
	}

}