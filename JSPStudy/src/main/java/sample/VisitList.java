package sample;

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

public class VisitList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public VisitList() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		List<Visit> visitList = new ArrayList<Visit>();

		String sql = "select * from visit";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			visitList = new ArrayList<Visit>();
			while (rs.next()) {
				Visit vi = new Visit();
				vi.setNo(rs.getInt("no"));
				vi.setWriter(rs.getString("writer"));
				vi.setMemo(rs.getString("memo"));
				vi.setRegDate(rs.getString("regdate"));
				visitList.add(vi);
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
		pw.println(" <title>방명록 리스트</title>");
		pw.println(" </head>");
		pw.println(" <body>");
		pw.println("<table align=\"center\" width=\"500\" border=\"1\">");
		for (Visit data : visitList) {
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">번호</th>");
			pw.println("  <td width=\"430\">" + data.getNo() + "</td>");
			pw.println(" </tr>");
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">작성자</th>");
			pw.println("  <td width=\"430\">" + data.getWriter() + "</td>");
			pw.println(" </tr>");
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">메모</th>");
			pw.println("  <td width=\"430\">" + data.getMemo() + "</td>");
			pw.println(" </tr>");
			pw.println(" <tr>");
			pw.println(" <th width=\"70\">날짜</th>");
			pw.println("  <td width=\"430\">" + data.getRegDate() + "</td>");
			pw.println(" </tr>");
		}
		pw.println(" </table>");
		pw.println(" </form>");
		pw.println("</body>");
		pw.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
