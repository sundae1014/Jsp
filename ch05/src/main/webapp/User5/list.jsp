<%@page import="vo.User5VO"%>
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
	List<User5VO> users = new ArrayList<>();
	
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");
		Connection conn = ds.getConnection();
		
		String sql = "SELECT * FROM USER5";
		PreparedStatement psmt = conn.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()){
			User5VO vo = new User5VO();
			vo.setName(rs.getString(1));
			vo.setGender(rs.getString(2));
			vo.setAge(rs.getString(3));
			vo.setAddress(rs.getString(4));
			
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
		<title>User5::list</title>
	</head>
	<body>
		<h3>User5 목록</h3>
		
		<a href="/ch05/jdbc.jsp">처음으로</a>
		<a href="/ch05/User5/register.jsp">등록하기</a>
		
		<table border="1">
			<tr>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
				<th>관리</th>
			</tr>
			<%for(User5VO user5 : users){ %>
			<tr>
				<td><%= user5.getName() %></td>
				<td><%= user5.getGender() %></td>
				<td><%= user5.getAge() %></td>
				<td><%= user5.getAddress() %></td>
				<td>
					<a href="/ch05/User5/modify.jsp?name=<%=user5.getName() %>">수정</a>
					<a href="/ch05/User5/delete.jsp?name=<%=user5.getName() %>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
	</body>
</html>