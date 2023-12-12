<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id 중복 검사</title>
<script src="../resources/js/jquery-3.7.1.js"></script>
<script>
	$(function name() {
		$("h3").css("color", "red");
	});
	
	function checkId() {
		// alert("test");
		if($("#t_id").val()== "") {
			alert("아이디를 입력해 주세요");
			t_id.focus();
			return false;
		}
		$.ajax({
			type: "get",
			dataType: "text",
			url: "/test/checkid", // "http://localhost:8080/test/checkid"
			data: {id: $("#t_id").val()}, // id 속성이 서버로 전달됨
			success: function (data) {
				if(data == "usable"){
					$("#message").text("사용할 수 없는 아이디입니다.")
				}else {
					$("#message").text("이미 가입된 아이디입니다.")
				}
			},
			error: function() {
				alert("에러 발생!!");
			}
		});
	}
</script>
</head>
<body>
	<h3>ID 중복 검사</h3>
	<p><input type="text" id="t_id" name="t_id">
	   <input type="button" value="ID 중복" onclick="checkId()"></p>
	<div id="message"></div>
</body>
</html>