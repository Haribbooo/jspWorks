<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 폼</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div id="container">
		<section id ="join">
			<h2>회원 가입</h2>
				<form action="/insertmember.do" method="post">
					<fieldset>
						<ul>
							<li>
								<label for="id">아이디</label>
								<input tpye="test" id ="id" name="id" required>
							</li>
							<li>
								<label for="passwd">비밀번호</label>
								<input tpye="password" id ="passwd" name="passwd" required>
							</li>
							<li>
								<label for="passwd2">비밀번호 확인</label>
								<input tpye="password" id ="passwd2" name="passwd2" required>
							</li>
							<li>
								<label for="name">이름</label>
								<input tpye="test" id ="name" name="name" required>
							</li>
							<li>
								<label for="email">이메일</label>
								<input tpye="test" id ="email" name="email" >
							</li>
							<li>
								<label for="gender">성별</label>
								<input type ="radio" id="gender" name="gender" value="남" checked >남
								<input type ="radio" id="gender" name="gender" value="여" checked>여
							</li>
						</ul>
					</fieldset>
					<div class="button">
						<button type="submit">가입</button>
						<button type="reset">취소</button>
						
					</div>
				</form>
		</section>
	</div>
	<%@ include file="../footer.jsp" %>
</body>
</html>