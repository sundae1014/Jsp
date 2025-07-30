<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.CustomerDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cid = request.getParameter("cid");
	
	List<CustomerDTO> customers = new ArrayList<>();
	CustomerDTO dto = null;

	try{
		// 자바 기본 환경 객체 검색(WAS)
		Context ctx = (Context) new InitialContext().lookup("java:comp/env"); 
		DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");  
						
		// 커넥션풀에서 접속 커넥션 가져오기
		Connection conn = ds.getConnection();
		
		String sql = "SELECT * FROM CUSTOMER WHERE CID = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, cid);
		
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()){
			
			dto = new CustomerDTO();
			dto.setCid(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setHp(rs.getString(3));
			dto.setAddress(rs.getString(4));
			dto.setRdate(rs.getString(5));
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
		<title>Customer::modify</title>
	</head>
	<body>
		<h3>Customer 등록</h3>
		
		<a href="/ch05/dbcp.jsp">처음으로</a>
		<a href="/ch05/customer/list.jsp">목록으로</a>
		
		<form action="/ch05/customer/proc/modify.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" readonly name="cid" value=<%= dto.getCid() %> placeholder="아이디 입력"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value=<%= dto.getName() %> placeholder="이름 입력"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value=<%= dto.getHp() %> placeholder="휴대폰 입력(- 포함)"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value=<%= dto.getAddress() %> placeholder="주소 입력"></td>
				</tr>
				<tr>
					<td>등록일</td>
					<td><input type="date" name="rdate" value=<%= dto.getRdate() %> /></td>
				</tr>
				<tr>
					<td colspan="2" align="right"></td>
					<td><input type="submit" value="수정하기" >
				</tr>
			</table>
		</form>
		
	</body>
</html>