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
	<h1>Ajax</h1>
	<!-- 버튼 클릭 -> 서버의 데이터를 가져와서 화면에 출력하기 -->
	<div>
		<input type="button" value="데이터 가져오기" id="btn1" />
		<hr />
		<!-- 
		<pre>태그
		The pre element represents a block of preformatted text,
		in which structure is represented by typographic conventions rather than by elements.
		textarea처럼 개행이 가능하고 whitespace가 모두 인식됨
		-->
		<pre class="message"></pre>
	</div>
	<hr />
	<div>
		다른 콘텐츠: <input type="text">
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		/* $('#btn1').click(() => {
			//alert();
			location.href = '/ajax/ex03data.do';
		}); */

		<c:if test = "${not empty id}"> 
		$('.message').text('${id}');
		</c:if>
		
		$('#btn1').click(() => {
			/* Ajax, 비동기 자바스크립트 통신 */
			//ajax 객체 역할
			// - 눈에 안보이는 객체
			// - 눈에 안보이는 무전기, 전화기 느낌
			// - 브라우저와는 별도로 서버와 통신을 할 수 있다.

			//1. ajax 객체 생성
			const ajax = new XMLHttpRequest();

			//console.log(ajax.readyState); //0
			//2. 이벤트 매핑
			ajax.onreadystatechange = function() {
				//console.log(ajax.readyState); //4일 때가 중요(데이터가 모두 수신완료된 상태)
				if(ajax.readyState ==4 && ajax.status==200) {
					//돌려받은 데이터에 접근
					// $('.message').text(ajax.responseText);
					$('.message').append('<div>' + ajax.responseText + '</div>');

					//상태 코드(HTTP 상태 코드)
					$('.message').append('<div>' + ajax.status + '</div><hr>');
					// 200 OK(정상적으로 처리)
					// 4XX 에러 -> 클라이언트 측 에러(400, 403, 404 Not found)
					// 5XX 에러 -> 서버 측 에러(500 Internal Error)

				} else if (ajax.readyState ==4 && ajax.status !=200) {
					$('.message').append('<div>오류가 발생하였습니다.</div><hr>');
				}
			};

			//3. 연결 설정(아직 아무 일도 발생하지 않은 상태)
			//<form action="/ajax/ex03data.do" method="post">와 같은 역할
			ajax.open('get', '/ajax/ex03data.do');
			// ajax.open('get', '/ajax/ex01.do');

			//4. 연결 시도(서버에게 요청)
			//submit 버튼 역할
			ajax.send();
		});
		
	</script>
</body>
</html>