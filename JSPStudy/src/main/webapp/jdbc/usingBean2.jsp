<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.*, jdbc.*"%>
<html>
<head>
<title>JSP���� �����ͺ��̽� ����</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<h2>Beans�� ����� �����ͺ��̽� ���� �����Դϴ�....</h2>
	<br></br>
	<h3>ȸ������</h3>
	<table bordercolor="#0000ff" border="1">
		<tr>
			<td><strong>ID</strong></td>
			<td><strong>PASSWD</strong></td>
			<td><strong>NAME</strong></td>
			<td><strong>MEM_NUM1</strong></td>
			<td><strong>MEM_NUM2</strong></td>
			<td><strong>E_MAIL</strong></td>
			<td><strong>PHONE</strong></td>
			<td><strong>ZIPCODE/ADDRESS</strong></td>
			<td><strong>JOB</strong></td>
		</tr>
		<jsp:useBean id="dao" class="jdbc.TempMemberDAO2" scope="page" />
		<%
		Vector<TempMemberVO> vlist = dao.getMemberList();
		int counter = vlist.size();
		for (int i = 0; i < vlist.size(); i++) {
			TempMemberVO vo = vlist.elementAt(i);
		%>
		<tr>
			<td><%=vo.getId()%></td>
			<td><%=vo.getPasswd()%></td>
			<td><%=vo.getName()%></td>
			<td><%=vo.getMem_num1()%></td>
			<td><%=vo.getMem_num2()%></td>
			<td><%=vo.getEmail()%></td>
			<td><%=vo.getPhone()%></td>
			<td><%=vo.getZipcode()%>/<%=vo.getAddress()%></td>
			<td><%=vo.getJob()%></td>
			<%
			}
			%>
		</tr>
	</table>
	<br></br> total records :
	<%=counter%>
</body>
</html>