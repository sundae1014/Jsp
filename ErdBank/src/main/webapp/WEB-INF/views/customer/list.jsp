<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객목록</title>
	</head>
	<body>
		<h3>고객목록</h3>
		
		<a href="/ErdBank">처음으로</a>
		<a href="/ErdBank/customer/register.do">등록하기</a>
		
		<table border="1">
			<tr>
				<th>주민번호</th>
				<th>이름</th>
				<th>고객유형</th>
				<th>연락처</th>
				<th>주소</th>
				<th>관리</th>
			</tr>
			<c:forEach var="dto" items="${dtoList}">
				<tr>
					<td>${dto.c_no}</td>
					<td>${dto.c_name}</td>
					<td>${dto.c_dist}</td>
					<td>${dto.c_phone}</td>
					<td>${dto.c_addr}</td>
					<td>
						<a href="/ErdBank/customer/register.do?c_no=">수정</a>
						<a href="/ErdBank/customer/delete.do?c_no=">삭제</a>
					</td>
				</tr>
			</c:forEach>	
		</table>		
	</body>
</html>