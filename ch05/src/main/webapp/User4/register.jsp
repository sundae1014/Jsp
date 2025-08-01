<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User4::register</title>
	</head>
	<body>
		<h4>User4 등록</h4>
		
		<a href="/ch05/jdbc.jsp">처음으로</a>
		<a href="/ch05/User4/list.jsp">목록으로</a>
		
		<form action="/ch05/User4/proc/register.jsp" method="post">
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="이름을 입력하시오"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<label><input type="radio" name="gender" value="M"/>남자</label>
						<label><input type="radio" name="gender" value="F"/>여자</label>
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age" placeholder="나이를 입력하시오"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" placeholder="주소를 입력하시오"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"></td>
					<td><input type="submit" value="등록하기" />
				</tr>
			</table>
		</form>
	</body>
</html>