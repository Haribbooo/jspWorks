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

</head>
<body>
   <form action="member02Process.jsp" method="post" name="member">
      <ul>
         <li>
            <label for="uid">계정 </label>
            <input type="text" id="uid" name="uid">
         </li>
         <li>
            <label for="passwd">암호 </label>
            <input type="password" id="passwd" name="passwd">
         </li>
         <li>
            <label for="uname">이름 </label>
            <input type="text" id="uname" name="uname">
         </li>
         
         <li>
            <button type="submit">가입</button>
            <button type="reset">취소</button>
         </li>
      </ul>
   </form>
</body>
</html>