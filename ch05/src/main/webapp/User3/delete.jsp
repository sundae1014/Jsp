<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="vo.User3VO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
	
	User3VO user3 = null;

	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");
		Connection conn = ds.getConnection();
		
		String sql = "SELECT * FROM USER3 WHERE USER_ID = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, user_id);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			user3 = new User3VO();
			user3.setUser_id(rs.getString(1));
			user3.setName(rs.getString(2));
			user3.setHp(rs.getString(3));
			user3.setAge(rs.getString(4));
		}
		
		rs.close();
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
		<title>User3:modify</title>
	</head>
	<body>
		<h3><%= user_id %> 정말 삭제하시겠습니까?</h3>
		
		<a href="/ch05/jdbc.jsp">처음으로</a>
		<a href="/ch05/User3/list.jsp">뒤로가기</a>
		
		<form action="/ch05/User3/proc/delete.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td> <input type="text" readonly name="user_id" value="<%= user3.getUser_id() %>" placeholder="아이디 입력하시오"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td> <input type="text" readonly name="name" value="<%= user3.getName() %>" placeholder="이름 입력하시오"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td> <input type="text" readonly name="hp" value="<%= user3.getHp() %>" placeholder="전화번호 입력하시오(- 포함)"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td> <input type="text" readonly name="age" value="<%= user3.getAge() %>" placeholder="나이를 입력하시오"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"></td>
					<td> <input type="submit" value="삭제하기" >
				</tr>
			</table>
		</form>
	</body>
</html>