<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사</title>
<style type="text/css">
   ul li{list-style: none; margin: 10px;}
</style>
<script type="text/javascript">
	function checkForm(){
		//폼 이름 선택
		let form = document.loginForm;
		
		if(form.uid.value == ""){
			alert("아이디를 입력해주세요");
			return false;
		}else if(form.passwd.value ==""){
			alert("비밀번호를 입력해주세요");
			return false;
		}else{
			form.submit(); //자바스크립트에서 폼을 전송하는 메서드
		}
		
	}
</script>
</head>
<body>
   <form action="loginProcess.jsp" method="post" name="loginForm">
      <ul>
         <li>
            <label for="uid">계정 </label>
            <input type="text" id="uid" name="uid">
         </li>
         <li>
            <label for="passwd">암호 </label>
            <input type="text" id="passwd" name="passwd">
         </li>
         <li>
            <button type="button" onclick="checkForm()">로그인</button>
         </li>
      </ul>
   </form>
</body>
</html>