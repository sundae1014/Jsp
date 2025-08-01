<%@page import="vo.User7VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="org.apache.catalina.startup.ContextConfig.ContextXml"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	
	List<User7VO> users = new ArrayList<>();
	
	User7VO user7 = null;

	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");
		Connection conn = ds.getConnection();
		
		String sql = "SELECT * FROM USER7 WHERE ID=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);
		
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
		<title>User5::modify</title>
	</head>
	<body>
		<h4>User5 수정</h4>
		
		<a href="/ch05/jdbc.jsp">처음으로</a>
		<a href="/ch05/User7/list.jsp">목록으로</a>
		
		<form action="/ch05/User7/proc/modify.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="number" name="id" value="<%= user7.getId() %>" placeholder="아이디를 입력하시오"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= user7.getName() %>" placeholder="이름을 입력하시오"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age" value="<%= user7.getAge() %>" placeholder="나이를 입력하시오"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" value="<%= user7.getEmail() %>" placeholder="메일 주소를 입력하시오"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"></td>
					<td><input type="submit" value="수정하기" />
				</tr>
			</table>
		</form>
	</body>
</html>