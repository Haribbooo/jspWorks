<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>
    <c:set var="dan" value="6"/>
    <c:forEach var="i" begin="1" end="9">
        ${dan} X ${i} = ${dan*i}<br>        
    </c:forEach>
    
    <table>
    <c:forEach var="i" begin="2" end="9">
    <tr>
        <c:forEach var="j" begin="1" end="9">
           <td width= "100"> ${i} X ${j} = ${i*j}<br>
        </c:forEach>
    </tr>
    </c:forEach>
    </table>
</body>
</html>