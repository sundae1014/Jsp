<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>수강목록</title>
	</head>
	<body>
		<h3>수강목록</h3>
		
		<a href="/ErdCollege">처음으로</a>
		
		<table border="1">
			<tr>
				<th>학생번호</th>
				<th>강좌번호</th>
				<th>중간고사</th>
				<th>기말고사</th>
				<th>총점수</th>
				<th>등급</th>
			</tr>			
			<c:forEach var="dto" items="${dtoList}">
			<tr>
				<td>${dto.regStdNo}</td>
				<td>${dto.regLecNo}</td>
				<td>${dto.regMidScore}</td>
				<td>${dto.regFinalScore}</td>
				<td>${dto.regTotalScore}</td>
				<td>${dto.regGrade}</td>
			</tr>		
			</c:forEach>	
		</table>		
	</body>
</html>