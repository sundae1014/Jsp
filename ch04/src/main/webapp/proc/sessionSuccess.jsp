<%@page import="vo.UserVo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 현재 세션(클라이언트) 객체 가져오기
	UserVo sessUser = (UserVo) session.getAttribute("sessUser");

	// 로그인 하지 않고 접근하면
	if(sessUser == null){
		response.sendRedirect("../session.jsp");
		
		return; // 처리종료
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>sessionSuccess</title>
	</head>
	<body>
		<h3>세션 로그인 성공</h3>		
		<p>
			<%= session.getId() %><br/>
			<%= sessUser.getId() %>님 반갑습니다.<br/>
			<a href="./sessionLogout.jsp">로그아웃</a>			
		</p>
		

	</body>
</html>