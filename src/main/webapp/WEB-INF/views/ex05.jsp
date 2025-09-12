<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK" />
	<style>
		
	</style>
</head>
<body>
	<h1>Ajax <small>jQuery</small></h1>
	<div>
		<div><input type="text" id="txt1" /></div>
		<div><input type="button" value="확인" id="btn1" /></div>
	</div>
	<div class="message"></div>
	<!-------------------------------------------------------------->
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		$('#btn1').click(() => {
			//vanilla javascript 버전
			//1. const ajax = new XMLHttpRequest();
			//2. ajax.onreadystatechange = function() {}; 
			//3. ajax.open('METHOD', 'URL')
			//4. ajax.send();


			//jQuery 버전
			//1번 + 4번 역할 -> send
			$.ajax({
				type: 'GET',						//open() 내용
				url: '/ajax/ex05data.do',			//open() 내용
				data: 'txt1=' + $('#txt1').val(),	//전송 데이터
				success: function(result) {			//데이터 수신 성공 -> 호출
					//ajax.responseText == result
					$('.message').text(result);
				},
				error: function(a, b, c) {			//에러 -> 호출
					console.log(a, b, c);
				}
			});


		}); //$('#btn1').click

	</script>
</body>
</html>