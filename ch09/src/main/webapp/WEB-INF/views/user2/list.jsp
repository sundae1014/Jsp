<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User2::list</title>
	</head>
	<body>
		<h3>User2 목록</h3>
		
		<a href="/ch09">처음으로</a>
		<a href="/ch09/user2/register.do">등록하기</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<c:forEach var="dto" items="${requestScope.dtoList}">
			<tr>
				<td>${dto.user_id}</td>
				<td>${dto.name}</td>
				<td>${dto.hp}</td> 
				<td>${dto.age}</td>
				<td>					
					<a href="/ch09/user2/modify.do?user_id=${dto.user_id}" >수정</a>					
					<a href="/ch09/user2/delete.do?user_id=${dto.user_id}" >삭제</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</body>
</html>