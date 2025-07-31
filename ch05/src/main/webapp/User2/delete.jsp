<%@page import="vo.User2VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
	
	User2VO user2 = null;

	try{
		// 자바 기본 환경 객체 검색(WAS)
		Context ctx = (Context) new InitialContext().lookup("java:comp/env"); 
		DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");  
								
		// 커넥션풀에서 접속 커넥션 가져오기
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM USER2 WHERE USER_ID=?");
		psmt.setString(1, user_id);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			user2 = new User2VO();
			user2.setUser_id(rs.getString(1));
			user2.setName(rs.getString(2));
			user2.setHp(rs.getString(3));
			user2.setAge(rs.getString(4));			
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
		<title>list::delete</title>
	</head>
	<body>
		<h3>정말 삭제 하시겠습니까?</h3>
		
		<a href="/ch05/jdbc.jsp">처음으로</a>
		<a href="/ch05/User2/list.jsp">목록으로</a>
		
		<form action="/ch05/User2/proc/delete.jsp?user_id=<%= user2.getUser_id() %>" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" readonly name="user_id" value="<%= user2.getUser_id() %>" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" readonly name="name" value="<%= user2.getName() %>" /></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" readonly name="hp" value="<%= user2.getHp() %>" /></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" readonly name="age" value="<%= user2.getAge() %>" /></td>
				</tr>
				<tr>
					<td colspan="2" align="right"></td>
					<td><input type="submit" value="삭제하기"  /></td>
				</tr>
			</table>
		</form>
		
	</body>
</html>