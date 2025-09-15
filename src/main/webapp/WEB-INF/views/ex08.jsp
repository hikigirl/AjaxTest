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
	<h1>Ajax <small>전송데이터(수신데이터)의 형식</small></h1>
	<h2>수신(응답)데이터</h2>
	<h3>Text <small>ajax.responseText</small></h3>
	<div>
		<input type="button" value="확인" id="btn1">
		<div class="message" id="div1"></div>
	</div>
	<h3>Text <small>ajax.responseText</small></h3>
	<div>
		<input type="button" value="확인" id="btn2">
		<div class="message" id="div2"></div>
	</div>

	<hr>
	
	<h3>XML <small>ajax.responseXML</small></h3>
	<div>
		<input type="button" value="확인" id="btn3">
		<div class="message" id="div3"></div>
	</div>
	<h3>XML <small>ajax.responseXML</small></h3>
	<div>
		<input type="button" value="확인" id="btn4">
		<div class="message" id="div4"></div>
	</div>
	
	<hr>
	
	<h3>JSON <small>ajax.responseText</small></h3>
	<div>
		<input type="button" value="확인" id="btn5">
		<div class="message" id="div5"></div>
	</div>
	<h3>JSON <small>ajax.responseText</small></h3>
	<div>
		<input type="button" value="확인" id="btn6">
		<div class="message" id="div6"></div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		// $.ajax({
		// 	type: 'get',					//메서드방식
		// 	url: '/ex01.do',				//서버측 URL
		// 	async: true,					//동기(false), 비동기(true)
		// 	data: 'key=value&key=value',	//전송할 데이터
		// 	dataType:'text',				//수신할 데이터 형식(text, xml, json)
		// 	success: function(result){
		// 		//result(수신데이터)
		// 	},
		// 	error: function(a,b,c) {
		// 		//예외처리
		// 	}
		// });

		$('#btn1').click(() => {
			//서버로부터 -> 텍스트 반환 + 단일값
			$.ajax({
				type:'get',
				url:'/ajax/ex08data.do',
				
				//예제 구분용 데이터
				data: 'm=1',
				
				//result(돌려받는값)의 형식
				dataType: 'text',
				success: function(result){
					$('#div1').text(result);
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}

			});


		});
		
		$('#btn2').click(() => {
			//서버로부터 -> 텍스트 반환 + 다중값(CSV)
			$.ajax({
				type:'get',
				url:'/ajax/ex08data.do',
				
				//예제 구분용 데이터
				data: 'm=2',
				
				//result(돌려받는값)의 형식
				dataType: 'text',
				success: function(result){
					//alert(result);
					const users = result.trim().split('\r\n');
					users.forEach(user => {
						const prop = user.split(',');
						$('#div2').append(`
							<ul>
								<li>아이디: \${prop[0]}</li>
								<li>암호: \${prop[1]}</li>
								<li>이름: \${prop[2]}</li>
								<li>등급: \${prop[3]}</li>
							</ul>
						`);
					});
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});

		});
	
	
		$('#btn3').click(() => {
			$.ajax({
				type:'get',
				url:'/ajax/ex08data.do',
				
				//예제 구분용 데이터
				data: 'm=3',
				
				//result(돌려받는값)의 형식
				dataType: 'xml',
				success: function(result){
					// alert();
					// alert(result.documentElement.id);
					// alert(result.documentElement.textContent);
					// alert($(result).find('CSS 선택자').text());
					//alert($(result).find('#q1').text());
					$('#div3').text($(result).find('#q1').text());
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}

			});
		});
		
		$('#btn4').click(() => {
			$.ajax({
				type: 'get',
				url: '/ajax/ex08data.do',
				
				data: 'm=4',
				dataType:'xml',
				success: function(result) {
					$(result).find('user').each((index, user) => {
						let temp = '';
						temp += '<ul>';
						temp += '<li>아이디: ' + $(user).find('id').text() + '</li>';
						temp += '<li>비밀번호: ' + $(user).find('pw').text() + '</li>';
						temp += '<li>이름: ' + $(user).find('name').text() + '</li>';
						temp += '<li>등급: ' + $(user).find('grade').text() + '</li>';
						temp += '</ul>';
						
						$('#div4').append(temp);
						
					});
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		});
		
		$('#btn5').click(()=>{
			//json 단일값
			$.ajax({
				type: 'get',
				url: '/ajax/ex08data.do',
				data: 'm=5',
				dataType: 'json',
				success: function(result){
					//ajax에서 응답 데이터로 json을 사용하는 이유
					// - csv: 파싱(split) 필요
					// - xml: 파싱(xmldocument) 필요
					// - json: 파싱 불필요 -> json을 그냥 자바스크립트 객체(배열)로 처음부터 인식
					//console.log(result); 
					//alert(result.question);
					$('#div5').text(result.question);
					
				},
				error: function(a,b,c){
					console.log(a,b,c);
				}
			});
			
		});
		
		$('#btn6').click(()=>{
			//json 다중값
			$.ajax({
				type: 'get',
				url: '/ajax/ex08data.do',
				data: 'm=6',
				dataType: 'json',
				success: function(result){
					//alert(result);
					$(result).each((index, user) => {
						let temp = '';
						temp += '<ul>';
						temp += '<li>아이디: ' 	 + user.id + '</li>';
						temp += '<li>비밀번호: ' + user.pw + '</li>';
						temp += '<li>이름: ' 	 + user.name + '</li>';
						temp += '<li>등급: '     + user.grade + '</li>';
						temp += '</ul>';
						
						$('#div6').append(temp);
					});
				},
				error: function(a,b,c){
					console.log(a,b,c);
				}
			});
		});
	
	</script>
</body>
</html>