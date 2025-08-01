<%@page import="java.util.ArrayList"%>
<%@page import="vo.User6VO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	List<User6VO> users = new ArrayList<>()	;

	User6VO user6 = null;

	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");
		Connection conn = ds.getConnection();
		
		String sql = "SELECT * FROM USER6";
		PreparedStatement psmt = conn.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()){
			user6 = new User6VO();
			user6.setSeq(rs.getInt(1));
			user6.setName(rs.getString(2));
			user6.setGender(rs.getString(3));
			user6.setAge(rs.getString(4));
			user6.setAddress(rs.getString(5));
			
			users.add(user6);
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
		<title>User6::list</title>
	</head>
	<body>
		<h3>User6 목록</h3>
		
		<a href="/ch05/jdbc.jsp">처음으로</a>
		<a href="/ch05/User6/register.jsp">등록하기</a>
		
		<table border="1">
			<tr>
				<th>SEQ</th>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
				<th>관리</th>
			</tr>
			<%for(User6VO user : users){ %>
			<tr>
				<td><%= user.getSeq() %></td>
				<td><%= user.getName() %></td>
				<td><%= user.getGender() %></td>
				<td><%= user.getAge() %></td>
				<td><%= user.getAddress() %></td>
				<td>
					<a href="/ch05/User6/modify.jsp?seq=<%= user.getSeq() %>">수정</a>
					<a href="/ch05/User6/delete.jsp?seq=<%= user.getSeq() %>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
	</body>
</html>