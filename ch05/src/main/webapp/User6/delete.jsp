<%@page import="vo.User6VO"%>
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
	String seq = request.getParameter("seq");
	
	List<User6VO> users = new ArrayList<>();
	
	User6VO user6 = null;

	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");
		Connection conn = ds.getConnection();
		
		String sql = "SELECT * FROM USER6 WHERE SEQ=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, seq);
		
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
		<title>User6::delete</title>
	</head>
	<body>
		<h4><%= user6.getName()%> 정말 삭제하시겠습니까?</h4>
		
		<a href="/ch05/jdbc.jsp">처음으로</a>
		<a href="/ch05/User6/list.jsp">뒤로가기</a>
		
		<form action="/ch05/User6/proc/delete.jsp" method="post">
			<table border="1">
				<tr>
					<td>SEQ</td>
					<td><input type="number" readonly name="seq" value="<%= user6.getSeq() %>" ></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" readonly name="name" value="<%= user6.getName() %>" placeholder="이름을 입력하시오"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<label><input type="radio" readonly name="gender" value="M" <%= "M".equals(user6.getGender()) ? "checked" : "" %> />남자</label>
						<label><input type="radio" readonly name="gender" value="F" <%= "F".equals(user6.getGender()) ? "checked" : "" %> />여자</label>
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age" readonly value="<%= user6.getAge() %>" placeholder="나이를 입력하시오"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" readonly value="<%= user6.getAddress() %>" placeholder="주소를 입력하시오"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"></td>
					<td><input type="submit" value="삭제하기" />
				</tr>
			</table>
		</form>
	</body>
</html>