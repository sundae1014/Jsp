<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>file upload</title>
		<!-- 
			날짜 : 2025/07/30
			이름 : 정순권
			내용 : JSP 파일 업로드 실습하기
		 -->
	</head>
	<body>
		<h3>파일 업로드</h3>
		
		<form action="/ch06/proc/fileUpload.jsp" method="post" enctype="multipart/form-data">
			<input type="text" name="title" placeholder="파일 제목 입력" /><br/>
			<input type="text" name="name" placeholder="이름 입력" /><br/>
			<input type="file" name="file1" /><br/>
			<input type="file" name="file2" /><br/>
			<input type="submit" value="파일 업로드 전송하기" />
		</form>		
	</body>
</html>