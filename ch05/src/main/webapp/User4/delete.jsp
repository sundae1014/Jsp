<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.User4VO"%>
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
	
	List<User4VO> users = new ArrayList<>();
	
	User4VO user4 = null;

	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");
		Connection conn = ds.getConnection();
		
		String sql = "SELECT * FROM USER4 WHERE NAME=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()){
			user4 = new User4VO();
			user4.setName(rs.getString(1));
			user4.setGender(rs.getString(2));
			user4.setAge(rs.getString(3));
			user4.setAddress(rs.getString(4));
			
			users.add(user4);
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
		<title>User4::delete</title>
	</head>
	<body>
		<h4><%= user4.getName()%> 정말 삭제하시겠습니까?</h4>
		
		<a href="/ch05/jdbc.jsp">처음으로</a>
		<a href="/ch05/User4/list.jsp">뒤로가기</a>
		
		<form action="/ch05/User4/proc/delete.jsp" method="post">
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" readonly name="name" value="<%= user4.getName() %>" placeholder="이름을 입력하시오"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<label><input type="radio" readonly name="gender" value="M" <%= "M".equals(user4.getGender()) ? "checked" : "" %> />남자</label>
						<label><input type="radio" readonly name="gender" value="F" <%= "F".equals(user4.getGender()) ? "checked" : "" %> />여자</label>
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age" readonly value="<%= user4.getAge() %>" placeholder="나이를 입력하시오"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" readonly value="<%= user4.getAddress() %>" placeholder="주소를 입력하시오"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"></td>
					<td><input type="submit" value="삭제하기" />
				</tr>
			</table>
		</form>
	</body>
</html>