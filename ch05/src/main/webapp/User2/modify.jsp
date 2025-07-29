<%@page import="vo.User2VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "sundae517";
	String password = "1234";
	
	User2VO user2 = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(url, user, password);
		
		String sql = "SELECT * FROM USER2 WHERE USER_ID = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, user_id);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			
			user2 = new User2VO();
			user2.setUser_id(rs.getNString(1));
			user2.setName(rs.getNString(2));
			user2.setHp(rs.getNString(3));
			user2.setAge(rs.getNString(4));
		}
		
		psmt.close();
		conn.close();		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User2::modify</title>
	</head>
	<body>
		<h3>User2 수정</h3>
		
		<a href="../jdbc.jsp">처음으로</a>
		<a href="./list.jsp">목록으로</a>
		
		<form action="./proc/modify.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" readonly name="user_id" value=<%= user2.getUser_id() %> ></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value=<%= user2.getName() %> placeholder="이름 입력" ></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value=<%= user2.getHp() %> placeholder="휴대폰 입력(- 포함)" ></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" value=<%= user2.getAge() %> placeholder="나이 입력" ></td>
				</tr>
				<tr>
					<td colspan="2" align="right"></td>
					<td><input type="submit" value="수정하기" >
				</tr>
			</table>
		</form>		
	</body>
</html>