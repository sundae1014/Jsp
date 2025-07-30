<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.User2VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "sundae517";
	String password = "1234";
	
	List<User2VO> users = new ArrayList<>();

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");	
		Connection conn = DriverManager.getConnection(url, user, password);
		
		String sql = "SELECT * FROM USER2";
		PreparedStatement psmt = conn.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
				
		while(rs.next()){
			
			User2VO vo = new User2VO() ;
			vo.setUser_id(rs.getNString(1));
			vo.setName(rs.getNString(2));
			vo.setHp(rs.getNString(3));
			vo.setAge(rs.getNString(4));
			
			users.add(vo);
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
		<title>User2 list</title>
	</head>
	<body>
		<h3>User2 목록</h3>
		
		<a href="../jdbc.jsp">처음으로</a>
		<a href="./register.jsp">등록하기</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<%for(User2VO user2VO : users){%>
			<tr>
				<td><%= user2VO.getUser_id() %></td>
				<td><%= user2VO.getName() %></td>
				<td><%= user2VO.getHp() %></td>
				<td><%= user2VO.getAge() %></td>
				<td>
					<a href="./modify.jsp?user_id=<%= user2VO.getUser_id() %>">수정</a>
					<a href="./delete.jsp?user_id=<%= user2VO.getUser_id() %>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
	</body>
</html>