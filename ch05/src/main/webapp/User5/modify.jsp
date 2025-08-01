<%@page import="vo.User5VO"%>
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
	String name = request.getParameter("name");
	
	List<User5VO> users = new ArrayList<>();
	
	User5VO user5 = null;

	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");
		Connection conn = ds.getConnection();
		
		String sql = "SELECT * FROM USER5 WHERE NAME=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()){
			user5 = new User5VO();
			user5.setName(rs.getString(1));
			user5.setGender(rs.getString(2));
			user5.setAge(rs.getString(3));
			user5.setAddress(rs.getString(4));
			
			users.add(user5);
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
		<a href="/ch05/User5/list.jsp">목록으로</a>
		
		<form action="/ch05/User5/proc/modify.jsp" method="post">
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= user5.getName() %>" placeholder="이름을 입력하시오"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<label><input type="radio" name="gender" value="M" <%= "M".equals(user5.getGender()) ? "checked" : "" %> />남자</label>
						<label><input type="radio" name="gender" value="F" <%= "F".equals(user5.getGender()) ? "checked" : "" %> />여자</label>
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age" value="<%= user5.getAge() %>" placeholder="나이를 입력하시오"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="<%= user5.getAddress() %>" placeholder="주소를 입력하시오"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"></td>
					<td><input type="submit" value="수정하기" />
				</tr>
			</table>
		</form>
	</body>
</html>