<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>
<title>주소 추가</title>
<link rel="stylesheet" href="../resources/css/style.css">
   <!-- Addrbook 클래스의 객체 : addrbook(new 한 것) -->
   <jsp:useBean id="addrbook" class="addressbook.Addrbook" />
   <!-- property의 username : setUsername() -->
   <jsp:setProperty property="username" name="addrbook"/>
   <jsp:setProperty property="tel" name="addrbook"/>
   <jsp:setProperty property="email" name="addrbook"/>
   <jsp:setProperty property="gender" name="addrbook"/>
   <!-- AddrBookDAO abDAO = new AddrBookDAO()와 같음
      scope="application"은 프로그램이 종료될 때까지 유지됨(request, session) -->
   <jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application"/>
   <%
      abDAO.addAddrBook(addrbook);
   %>
   <div id="container">
      <h2>등록 내용</h2>
      <hr>
      <p>이름 : <%=addrbook.getUsername() %></p>
      <p>연락처 :  <%=addrbook.getTel() %></p>
      <p>E-mail : <%=addrbook.getEmail() %></p>
      <p>gender : <%=addrbook.getGender() %></p>
      <p><a href="addrList.jsp">목록보기</a></p>
   </div>