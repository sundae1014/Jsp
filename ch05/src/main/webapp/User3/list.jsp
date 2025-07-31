<%@page import="java.sql.ResultSet"%>
<%@page import="vo.User3VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<User3VO> users = new ArrayList<>();
	
	User3VO user3 = null;
	
	try{
		// 자바 기본 환경 객체 검색(WAS)
		Context ctx = (Context) new InitialContext().lookup("java:comp/env"); 
		DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");  
										
		// 커넥션풀에서 접속 커넥션 가져오기
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM USER3");
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			user3 = new User3VO();
			user3.setUser_id(rs.getString(1));
			user3.setName(rs.getString(2));
			user3.setHp(rs.getString(3));
			user3.setAge(rs.getString(4));
			
			users.add(user3);
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
		<title>User3:list</title>
	</head>
	<body>
		<h3>User3 목록</h3>
		
		<a href="/ch05/jdbc.jsp">처음으로</a>
		<a href="/ch05/User3/register.jsp">등록하기</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<tr>
				<td><%= user3.getUser_id() %></td>
				<td><%= user3.getName() %></td>
				<td><%= user3.getHp() %></td>
				<td><%= user3.getAge() %></td>
				<td>
					<a href="/ch05/User3/modify.jsp?user_id=<%= user3.getUser_id() %>">수정</a>
					<a href="#">삭제</a>
				</td>
			</tr>
		</table>
		
	</body>
</html>
















