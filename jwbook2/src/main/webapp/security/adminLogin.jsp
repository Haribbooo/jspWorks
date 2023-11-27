<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<body>
	<h3>로그인</h3>
	 <form action="j_security_check" method="post" name="member">
      <ul>
         <li>
            <label for="uid">계정 </label>
            <input type="text" id="uid" name="j_username">
         </li>
         <li>
            <label for="passwd">암호 </label>
            <input type="password" id="passwd" name="j_password">
         </li>     
         <li>
            <button type="submit">로그인</button>
            <button type="reset">취소</button>
         </li>
      </ul>
   </form>
</body>
</html>