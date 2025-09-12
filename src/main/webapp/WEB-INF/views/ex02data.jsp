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
	<h3>ex02data.jsp</h3>
	<div>데이터 업무 담당 페이지</div>
	<div>${dto}</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		//iframe문서가 부모 문서에 접근하는 방법 -> top.document
		//top은 부모 문서의 window 객체?
		
		//테이블 내용 채우기
		top.document.querySelector('table tr th').textContent = '${dto.question}';
		
		top.document.querySelector('table tr:nth-child(2) td').textContent = '${dto.item1} (${dto.cnt1}표)';
		top.document.querySelector('table tr:nth-child(3) td').textContent = '${dto.item2} (${dto.cnt2}표)';
		top.document.querySelector('table tr:nth-child(4) td').textContent = '${dto.item3} (${dto.cnt3}표)';
		top.document.querySelector('table tr:nth-child(5) td').textContent = '${dto.item4} (${dto.cnt4}표)';
		
		//그래프 내용 채우기
		top.document.querySelector('#item1').innerHTML = '${dto.item1}<span>${dto.cnt1}</span>';
		top.document.querySelector('#item2').innerHTML = '${dto.item2}<span>${dto.cnt2}</span>';
		top.document.querySelector('#item3').innerHTML = '${dto.item3}<span>${dto.cnt3}</span>';
		top.document.querySelector('#item4').innerHTML = '${dto.item4}<span>${dto.cnt4}</span>';
		
		//css조작
		top.document.querySelector('#item1').style.width = '${dto.cnt1 * 30 + 30}px';
		top.document.querySelector('#item2').style.width = '${dto.cnt2 * 30 + 30}px';
		top.document.querySelector('#item3').style.width = '${dto.cnt3 * 30 + 30}px';
		top.document.querySelector('#item4').style.width = '${dto.cnt4 * 30 + 30}px';
		
		//5초간격으로 새로고침
		setTimeout(() => {
			location.reload(); //f5
		}, 5000);
	</script>
</body>
</html>