<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<meta charset="UTF-8">
<title>주소 등록 처리</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<jsp:useBean id = "addrBook" class="addressbook.AddrBook" />
	<jsp:setProperty property="*" name="addrBook"/>
	<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application" />
	<%
		abDAO.addAddrBook(addrBook); //주소 추가
		//회원 가입후 자동로그인
		session.setAttribute("sessionId", addrBook.getEmail());
		session.setAttribute("sessionName", addrBook.getUsername());
	%>
	<div id ="container">
		 <h2>등록 내용</h2>
	      <hr>
	      <p>이름 : <%=addrBook.getUsername() %></p>
	      <p>연락처 :  <%=addrBook.getTel() %></p>
	      <p>E-mail : <%=addrBook.getEmail() %></p>
	      <p>gender : <%=addrBook.getGender() %></p>
	      <p><a href="addrList.jsp">목록</a></p>		
	</div>
</body>
