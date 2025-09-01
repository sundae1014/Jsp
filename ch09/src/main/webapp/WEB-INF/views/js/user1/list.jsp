<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::list</title>
		
		<script>
			document.addEventListener('DOMContentLoaded', function(){
				
				const table = document.getElementsByTagName('table')[0];
				
				// 목록 데이터 요청
				fetch('/ch09/js/user1/getUser1All.do')
					.then(res => res.json())
					.then(data => {						
						console.log(data);
						
						for(const user of data){
							
							const tr = `<tr>
											<td>\${user.user_id}</td>
											<td>\${user.name}</td>
											<td>\${user.hp}</td>
											<td>\${user.age}</td>
											<td>
												<a href='#' class='modify'>수정</a>
												<a href='#' class='remove'>삭제</a>
											</td>
										</tr>`;									
							
							table.insertAdjacentHTML('beforeEnd', tr);							
						}
					})
					.catch(err => {
						console.log(err);
					});
			});		
		</script>		
	</head>
	<body>
		<h3>JS/User1 목록</h3>
		
		<a href="/ch09">처음으로</a>
		<a href="/ch09/js/user1/register.do">등록하기</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>			
		</table>		
	</body>
</html>