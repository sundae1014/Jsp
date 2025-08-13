<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user4::modify</title>
	</head>
	<body>
		<h3>User4 수정</h3>
		
		<a href="/ch10">처음으로</a>
		<a href="/ch10/user4/list.do">목록이동</a>
		
		<form action="/ch10/user4/modify.do" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" readonly value="${user4DTO.uid}" placeholder="아이디 입력"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${user4DTO.name}" placeholder="이름 입력"/></td>
				</tr>
				<tr>
    				<td>성별</td>
    				<td>
    					<label><input type="radio" name="gender" value="M" ${user4DTO.gender == 'M' ? 'checked' : ''}> 남</label>
    					<label><input type="radio" name="gender" value="F" ${user4DTO.gender == 'F' ? 'checked' : ''}> 여</label>
    				</td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" value="${user4DTO.age}" placeholder="나이 입력"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="${user4DTO.hp}" placeholder="휴대폰 입력(- 포함)"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" value="${user4DTO.addr}" placeholder="주소 입력"/></td>
				</tr>
				<tr>					
					<td colspan="2" align="right">
						<input type="submit" value="수정하기"/>
					</td>
				</tr>			
			</table>		
		</form>			
	</body>
</html>