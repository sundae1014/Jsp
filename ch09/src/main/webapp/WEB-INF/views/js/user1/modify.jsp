<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::modify</title>
		
		<script>
			document.addEventListener('DOMContentLoaded', function(){
				
				// 문서객체 생성
				const form = document.getElementsByTagName('form')[0];
				
				// 파라미터(쿼리스트링) 파싱
				const params = location.href.split('?')[1];
				console.log('params : ' + params);
				
				const value = params.split('=')[1];
				console.log('value : ' + value);
				
				// 수정 데이터 요청하기
				fetch('/ch09/js/user1/getUser1.do?uid='+value)
					.then(response => response.json())
					.then(data => {
						console.log(data);
						
						// 수정 데이터 입력
						form.user_id.value = data.user_id;
						form.name.value = data.name;
						form.hp.value = data.hp;
						form.age.value = data.age;
					})
					.catch(err => {
						console.log(err);
					});				
				
				// 폼 이벤트
				form.addEventListener('submit', function(e){
					e.preventDefault();
					
					// JSON 생성
					const jsonData = {
						"user_id": form.user_id.value,
						"name": form.name.value,
						"hp": form.hp.value,
						"age": form.age.value
					};
					
					console.log(jsonData);
					
					// JSON 전송
					fetch('/ch09/js/user1/modify.do', {
						method: 'POST',
						headers: {"Content-Type": "application/json"}, // 반드시 설정
						body: JSON.stringify(jsonData)
					})
						.then(res => res.json())
						.then(data => {
							console.log(data);
							
							if(data.result > 0){
								alert('수정 되었습니다.');								
							}else{
								alert('수정 실패 했습니다.');
							}
							
							location.href = '/ch09/js/user1/list.do';
						})
						.catch(err => {
							console.log(err);
						});
				});
				
			}); // DOMContentLoaded 끝
		</script>
	</head>
	<body>
		<h3>JS/User1 수정</h3>
		
		<a href="/ch09">처음으로</a>
		<a href="/ch09/js/user1/list.do">목록이동</a>
		
		<form>
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="user_id" readonly placeholder="아이디 입력"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="이름 입력"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" placeholder="휴대폰 입력(- 포함)"/></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" placeholder="숫자 입력"/></td>
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