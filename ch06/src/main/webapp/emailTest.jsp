<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>emailTest</title>
		<%--
			날짜 : 2025/07/30
			이름 : 정순권
			내용 : JSP 이메일 발송 실습하기
		 --%>
	</head>
	<body>
		<h3>이메일 발송 실습</h3>
		
		<form action="/ch06/proc/emailSend.jsp" method="post">
			<table border="1">
				<tr>
					<td>보내는사람</td>
					<td><input type="email" name="sender" placeholder="보내는사람 이메일 입력" /></td>
				</tr>
				<tr>
					<td>받는사람</td>
					<td><input type="email" name="receiver" placeholder="받는사람 이메일 입력" /></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" placeholder="이메일 제목 입력" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="content" rows="10" cols="50"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="submit" value="이메일 발송" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>