<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>거래목록</title>
	</head>
	<body>
		<h3>거래목록</h3>
		
		<a href="/ErdBank">처음으로</a>
		
		<table border="1">
			<tr>
				<th>거래 번호</th>
				<th>계좌번호</th>
				<th>거래 유형</th>
				<th>거래 금액</th>
				<th>거래 시각</th>				
			</tr>
			<c:forEach var="trn" items="${trans}">
				<tr>
					<td>${trn.t_no}</td>
					<td>${trn.t_a_no}</td>
					<td>${trn.t__dist}</td>
					<td>${trn.t_amount}</td>
					<td>${trn.t_datetime}</td>			
				</tr>
			</c:forEach>	
		</table>		
	</body>
</html>