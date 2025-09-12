<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK" />
	<style>
		#txt2 {width: 400px;}
	</style>
</head>
<body>
	<h1>Ajax <small>데이터 주고받기</small></h1>
	<h2>GET <small>보내기</small></h2>
	<div>
		<div><input type="text" id="txt1" /></div>
		<div><input type="button" value="확인" id="btn1" /></div>
	</div>
	<h2>GET <small>받아오기</small></h2>
	<div>
		<div><input type="text" id="txt2"></div>
		<div><input type="button" value="확인" id="btn2"></div>
	</div>

	<h2>GET <small>보내기 + 받아오기</small></h2>
	<div>
		<div><input type="number" id="num3" min="1001" max="1060"></div>
		<div><input type="text" id="txt3"></div>
		<div><input type="button" value="확인" id="btn3"></div>
	</div>

	<h2>POST <small>보내기</small></h2>
	<div>
		<div><input type="text" id="txt4" /></div>
		<div><input type="button" value="확인" id="btn4" /></div>
	</div>
	
	<h2>POST <small>받아오기</small></h2>
	<div>
		<div><input type="text" id="txt5"></div>
		<div><input type="button" value="확인" id="btn5"></div>
	</div>
	
	<h2>POST <small>보내기 + 받아오기</small></h2>
	<div>
		<div><input type="number" id="num6" min="1001" max="1060"></div>
		<div><input type="text" id="txt6"></div>
		<div><input type="button" value="확인" id="btn6"></div>
	</div>
	
	<!---------------------------------------------------------------->
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		$('#btn1').click(() => {
			const ajax = new XMLHttpRequest();
			// 보내기만 하므로 이번엔 구현할 필요가 없음
			// ajax.onreadystatechange = function() {}; 
			ajax.open('get', '/ajax/ex04data.do?txt1=' + $('#txt1').val());
			ajax.send(); //연결 요청


		});
		
		$('#btn2').click(() => {
			const ajax = new XMLHttpRequest();
			
			ajax.onreadystatechange = function() {
				if (ajax.readyState ==4 && ajax.status ==200) {
					$('#txt2').val(ajax.responseText);
				}
				
			}; 
			ajax.open('get', '/ajax/ex04data.do');
			ajax.send(); //연결 요청


		});

		//GET + 보내기 + 받아오기
		$('#btn3').click(() => {
			
			const ajax = new XMLHttpRequest();
			
			ajax.onreadystatechange = () => {
				if (ajax.readyState == 4 && ajax.status == 200) {
					$('#txt3').val(ajax.responseText);
				}
			};
			
			ajax.open('GET', '/ajax/ex04data.do?num3=' + $('#num3').val());
			
			ajax.send();
			
		});
		
		//POST 보내기
		$('#btn4').click(() => {
			const ajax = new XMLHttpRequest();
			
			ajax.open('post', '/ajax/ex04data.do');
			//<form method="POST" enctype="기본값">
			ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

			ajax.send('txt4=' + $('#txt4').val()); //연결 요청


		});
		
		
		//POST로 받아오기 -> 발생안함
		$('#btn5').click(() => {
			const ajax = new XMLHttpRequest();
			
			ajax.onreadystatechange = function() {
				if (ajax.readyState == 4 && ajax.status == 200) {
					$('#txt5').val(ajax.responseText);
				}
				
			}; 
			ajax.open('post', '/ajax/ex04data.do');
			ajax.send(); //연결 요청


		});

		//POST + 보내기 + 받아오기
		$('#btn6').click(() => {
			
			const ajax = new XMLHttpRequest();
			
			ajax.onreadystatechange = () => {
				if (ajax.readyState == 4 && ajax.status == 200) {
					$('#txt6').val(ajax.responseText);
				}
			};
			
			ajax.open('POST', '/ajax/ex04data.do');
			ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

			ajax.send('num6=' + $('#num6').val());
			
		});
		
		
	</script>
</body>
</html>