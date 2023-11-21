<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //한글 인코딩
   request.setCharacterEncoding("utf-8");

   String id = request.getParameter("uid");
   String pwd = request.getParameter("passwd");
   
   //id - today, pw = 1234
   if(id.equals("today") && pwd.equals("1234")){
      //out.println("로그인 성공");
      response.sendRedirect("loginSuccess.jsp");
   }else{
	   //out.println("로그인 실패");
	   response.sendRedirect("loginFail.jsp");
   }
   
   //out.println(id + ", " + pwd);
%>