<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String seq = request.getParameter("seq");

	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");
		Connection conn = ds.getConnection();
		
		String sql = "DELETE FROM USER6 WHERE SEQ=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, seq);

		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

	response.sendRedirect("/ch05/User6/list.jsp");
%>


