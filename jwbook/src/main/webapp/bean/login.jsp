<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Login" class="bean.LoginBean"/>
<jsp:setProperty property="uid" name="Login"/>
<jsp:setProperty property="passwd" name="Login"/>
<!-- seuUid(), setPasswd()를 참조함  -->
<%
	String id = request.getParameter("uid");
	String pw = request.getParameter("passwd");
	
	if(id == "" || pw ==""){
		out.println("<script>");
		out.println("alert('아이디나 비밀번호를 입력해주세요')");
		out.println("history.back()"); //이전 페이지로 이동
		out.println("</script>");		
	}else{
		boolean result = Login.checkUser();
		if(result){
			out.println("로그인 성공");
		}else{
			out.println("로그인 실패");
		}
	}
	
	

%>
<p>아이디 : <%= Login.getUid() %>
<p>비밀번호 : <%= Login.getPasswd() %>