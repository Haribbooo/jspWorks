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
      /*
      1. 계정은 문자로 시작
      2. 암호는 숫자만 입력
      3. 이름은 한 글자만 입력
      */
       let form = document.member;
       let id = form.uid.value;
       let pw = form.password.value;
       let name = form.uname.value;
      let phone = form.phone1.value + "-" +
                  form.phone2.value + "-" +
                  form.phone3.value
         
       //정규 표현식
      let regexId = /^[a-zA-Z가-힣]/;            //문자로 시작 1개
      let regexPw = /[0-9]+/;                  //숫자 1개 이상
      let regexName = /^[가-힣]+$/;               //한글 1자 이상
      //let regEn = [a-zA-Z]+/               //영문 1자 이상
      let regexPhone = /\d{2,3}-\d{3,4}-\d{4}/   //전화번호
     
      
      if(!regexId.test(id)){
         alert("계정은 문자로 시작해 주세요.");
         form.uid.select();
         return false;
      }else if(!regexPw.test(pw)){
         alert("암호는 숫자만 입력해 주세요.");
         form.password.select();
         return false;
      }else if(!regexName.test(name)){
         alert("이름은 한글만 입력해 주세요.");
         form.uname.select();
         return false;
      }else if(!regexPhone.test(콜)){
         alert("연락처를 입력해 주세요.");
         form.phone.select();
         return false;
      }else{
         form.submit();
      }     
   }
</script>
</head>
<body>
   <form action="joinprocess.jsp" method="post" name="member">
      <ul>
         <li>
            <label for="uid">계정 </label>
            <input type="text" id="uid" name="uid">
         </li>
         <li>
            <label for="passwd">암호 </label>
            <input type="password" id="password" name="password">
         </li>
         <li>
            <label for="uname">이름 </label>
            <input type="text" id="uname" name="uname">
         </li>
         <li>
            <label for="phone">연락처 </label>
            <select name="phone1">
               <option value="010">010</option>
               <option value="02">02</option>
               <option value="031">031</option>   
            </select> - <input type="text" name="phone2" maxlength="4" size="3">
            - <input type="text" name="phone3" maxlength="4" size="3">
         </li>
         <li>
            <button type="button" onclick="checkForm()">가입</button>
         </li>
      </ul>
   </form>
</body>
</html>