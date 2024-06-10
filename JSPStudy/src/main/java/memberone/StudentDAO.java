package memberone;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import controller.DBUtil;
import jakarta.servlet.http.HttpServletRequest;
import jdbc.DBPoolUtil;
import mymemberone.UserInfoVO;

public class StudentDAO {
	private static StudentDAO instance = null;// 멤버필드

	private StudentDAO() {
	}// 생성자

	public static StudentDAO getInstance() {// 메소드
		if (instance == null) {
			synchronized (StudentDAO.class) {
				instance = new StudentDAO();
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
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from userinfo where userid = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (!rs.next()) {
				result = false;
			}
			System.out.println(result);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}
		return result;
	}

	public Vector<ZipCodeVO> zipcodeRead(String dong) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<ZipCodeVO> vecList = new Vector<ZipCodeVO>();
		try {
			conn = DBPoolUtil.getConnection();
			String strQuery = "select * from zipcode where dong like '" + dong + "%'";
			pstmt = conn.prepareStatement(strQuery);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ZipCodeVO tempZipcode = new ZipCodeVO();
				tempZipcode.setZipcode(rs.getString("zipcode"));
				tempZipcode.setSido(rs.getString("sido"));
				tempZipcode.setGugun(rs.getString("gugun"));
				tempZipcode.setDong(rs.getString("dong"));
				tempZipcode.setBunji(rs.getString("bunji"));
				vecList.addElement(tempZipcode);
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException sqle1) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException sqle2) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException sqle3) {
				}
			}
		}
		return vecList;
	}

	public boolean memberInsert(StudentVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			conn = DBPoolUtil.getConnection();
			String strQuery = "insert into student values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone1());
			pstmt.setString(5, vo.getPhone2());
			pstmt.setString(6, vo.getPhone3());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getZipcode());
			pstmt.setString(9, vo.getAddress1());
			pstmt.setString(10, vo.getAddress2());
			int count = pstmt.executeUpdate();
			if (count > 0) {
				flag = true;
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException sqle1) {

				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException sqle2) {

				}
			}

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException sqle3) {

				}
			}
		}
		return flag;
	}

	public int loginCheck(String id, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;
		try {
			conn = DBPoolUtil.getConnection();
			String strQuery = "select userpassword from userInfo where userId = ?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPass = rs.getString("userpassword");
				if (pass.equals(dbPass))
					check = 1;
				else
					check = 0;
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException sqle1) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle2) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle3) {
				}
		}
		return check;
	}

	public UserInfoVO getMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserInfoVO vo = null;
		try {
			conn = DBPoolUtil.getConnection();
			pstmt = conn.prepareStatement("select * from userinfo where userid = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {// 해당 아이디에 대한 회원이 존재
				vo = new UserInfoVO();
				vo.setUserId(rs.getString("userid"));
				vo.setPassword(rs.getString("userpassword"));
				vo.setPasswordCheck(rs.getString("passwordcheck"));
				vo.setUserName(rs.getString("username"));
				vo.setEmail(rs.getString("email"));
				vo.setPostNum(rs.getInt("postnum"));
				vo.setAddress1(rs.getString("address1"));
				vo.setAddress2(rs.getString("Address2"));
				vo.setAddress3(rs.getString("Address3"));
				vo.setPhone(rs.getString("phone"));
				vo.setUserDate(rs.getString("userdate"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException sqle1) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle2) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle3) {
				}
		}
		return vo;
	}

	public void updateMember(HttpServletRequest request, UserInfoVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBPoolUtil.getConnection();
			pstmt = conn.prepareStatement(
					"update userinfo set userpassword=?, email=?, postnum=?,address1=?, address2=?,address3=?,phone=? where userid=?");
			String password = request.getParameter("userPw");
			String email = request.getParameter("userEmail");
			int postNum = Integer.parseInt(request.getParameter("userAddressNumber"));
			String address1 = request.getParameter("userAddress");
			String address2 = request.getParameter("userAddressDetailed");
			String address3 = request.getParameter("userAddressExtra");
			String phone1 = request.getParameter("userPhone1");
			String phone2 = request.getParameter("userPhone2");
			String phone3 = request.getParameter("userPhone3");
			String phone = phone1 + phone2 + phone3;
			pstmt.setString(1, password);
			pstmt.setString(2, email);
			pstmt.setInt(3, postNum);
			pstmt.setString(4, address1);
			pstmt.setString(5, address2);
			pstmt.setString(6, address3);
			pstmt.setString(7, phone);
			pstmt.setString(8, vo.getUserId());
			pstmt.executeUpdate();
			System.out.println("1");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle2) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle3) {
				}
		}
	}

	public int deleteMember(String id, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPass = "";// 데이터베이스에 실제 저장된 패스워드
		int result = -1;// 결과치
		try {
			conn = DBPoolUtil.getConnection();
			pstmt = conn.prepareStatement("select userpassword from userinfo where userid = ? ");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbPass = rs.getString("userpassword");
				if (dbPass.equals(pass)) {// true - 본인 확인
					pstmt = conn.prepareStatement("delete from userinfo where userid = ?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					result = 1;// 회원탈퇴 성공
				} else { // 본인확인 실패 - 비밀번호 오류
					result = 0;
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException sqle1) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle2) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle3) {
				}
		}
		return result;
	}
}