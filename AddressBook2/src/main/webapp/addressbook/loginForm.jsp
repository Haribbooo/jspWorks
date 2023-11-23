<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel ="stylesheet" href ="../resources/css/style.css">
<body>
   <div id="container">
      <h2>로그인</h2>
      <hr>
      <form action="loginProcess.jsp" method="post">
         <table id="tbl_login">          
            <tr>
               <td><label>E-mail </label></td>
               <td><input type="text" name="email" required 
               			  size="30" maxlength ="30"></td>
            </tr>           
        	<tr>
               <td colspan="2">
                  <input type="submit" value="확인">
               </td>
            </tr>
         </table>
      </form>
   </div>
</body>