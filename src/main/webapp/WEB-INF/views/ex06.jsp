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
	<h1>아이디 중복검사</h1>
	<form action="/ajax/ex06ok.do" method="post">
	<table class="vertical">
		<tr>
			<th>이름</th>
			<td><input type="text" class="short" name="name" id="name" /></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" class="short" name="id" id="id" />
				<input type="button" value="중복 검사" id="btnCheck">
				<span id="result"></span>
			</td>
		</tr>
		<tr>
			<th>암호</th>
			<td><input type="password" class="short" name="pw" id="pw" /></td>
		</tr>
	</table>
	<div><input type="submit" value="가입하기" id="btnRegister"></div>
	</form>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		$('#btnCheck').click(() => {
			//입력한 아이디 전송 -> 결과 반환(기존 데이터가 날아가면안되니 ajax 사용)
			if($('#id').val().trim() == '') {
				alert('아이디를 입력하세요.');
				return;
			}

			$.ajax({
				type: 'get',
				url: '/ajax/ex06data.do',
				data: 'id=' + $('#id').val(),
				success: function(result) {
					//alert(result);
					if (result==0) {
						$('#result').text('사용 가능한 아이디입니다.');
						complete = 1;

					} else {
						$('#result').text('이미 사용중인 아이디입니다.');
						complete = 0;
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});

		});

		//전송 가능(1), 불가능(0)
		let complete = 0;
		$('form').submit((evt) => {
			
			//중복검사 유무로 전송여부를 정한다
			if (complete == 0) {
				alert('중복검사를 진행하세요.');
				evt.preventDefault();
				return false;
			} else if (complete == 2){
				//전송하기
				alert('아이디를 변경 후에 반드시 중복검사를 진행하세요.');
				evt.preventDefault();
				return false;
			}

		});

		$('#id').change(()=> {
			// alert();
			complete = 2;
		});


	</script>
</body>
</html>