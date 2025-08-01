<%@page import="vo.User7VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	List<User7VO> users = new ArrayList<>()	;

	User7VO user7 = null;

	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");
		Connection conn = ds.getConnection();
		
		String sql = "SELECT * FROM USER7";
		PreparedStatement psmt = conn.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()){
			user7 = new User7VO();
			user7.setId(rs.getInt(1));
			user7.setName(rs.getString(2));
			user7.setAge(rs.getString(3));
			user7.setEmail(rs.getString(4));
			
			users.add(user7);
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
		<title>User7::list</title>
	</head>
	<body>
		<h3>User7 목록</h3>
		
		<a href="/ch05/jdbc.jsp">처음으로</a>
		<a href="/ch05/User7/register.jsp">등록하기</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>나이</th>
				<th>이메일</th>
				<th>관리</th>
			</tr>
			<%for(User7VO user : users){ %>
			<tr>
				<td><%= user.getId() %></td>
				<td><%= user.getName() %></td>
				<td><%= user.getAge() %></td>
				<td><%= user.getEmail() %></td>
				<td>
					<a href="/ch05/User7/modify.jsp?id=<%= user.getId() %>">수정</a>
					<a href="/ch05/User7/delete.jsp?id=<%= user.getId() %>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
	</body>
</html>