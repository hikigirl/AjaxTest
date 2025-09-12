<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK" />
	<style>
		iframe {
			width: 100%;
			height: 200px;
			border:1px solid black;
			display: none;			
		}
		
		#item1 { background: tomato; }
		#item2 { background: gold; }
		#item3 { background: cornflowerblue; }
		#item4 { background: yellowgreen; }
		
		.item {
			margin: 10px;
			padding: 5px;
			text-align: right;
			padding-right: 15px;
			color: white;
			width: 150px;
			border-radius:7px; 
		}
		.item > span {
			font-size: 12px;
			background: white;
			border-radius: 50%;
			padding: 5px;
			margin-left: 5px;
		
		}
		
	</style>
</head>
<body>
	<!-- ex02.jsp -->
	<!-- <iframe src="/ajax/ex01.do" scrolling="no"></iframe> -->
	<h1>설문조사</h1>
	<table class="content">
		<%-- <tr>
			<th>${dto.question}</th>
		</tr>
		<tr>
			<td>${dto.item1}(${dto.cnt1})</td>
		</tr>
		<tr>
			<td>${dto.item2}(${dto.cnt2})</td>
		</tr>
		<tr>
			<td>${dto.item3}(${dto.cnt3})</td>
		</tr>
		<tr>
			<td>${dto.item4}(${dto.cnt4})</td>
		</tr> --%>
		<tr>
			<th></th>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td></td>
		</tr>
		
	</table>
	<hr />
	<div>
		<%-- <div class="item" id="item1">${dto.item1}<span>${dto.cnt1}</span></div>
		<div class="item" id="item2">${dto.item2}<span>${dto.cnt2}</span></div>
		<div class="item" id="item3">${dto.item3}<span>${dto.cnt3}</span></div>
		<div class="item" id="item4">${dto.item4}<span>${dto.cnt4}</span></div> --%>
		<div class="item" id="item1"></div>
		<div class="item" id="item2"></div>
		<div class="item" id="item3"></div>
		<div class="item" id="item4"></div>
	</div>
	
	<iframe src="/ajax/ex02data.do" frameborder="0"></iframe>
	
	
	<hr />
	<h2>다른 콘텐츠</h2>
	<div>
		<div><input type="text" /></div>
		<div><input type="text" /></div>
		<div><input type="text" /></div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		//투표수 시각화
		/* $('#item1').css('width', '${dto.cnt1 * 30+30}px');
		$('#item2').css('width', '${dto.cnt2 * 30+30}px');
		$('#item3').css('width', '${dto.cnt3 * 30+30}px');
		$('#item4').css('width', '${dto.cnt4 * 30+30}px'); */
		
		//1. 가장 원시적 방법..
		/* setTimeout(() => {
			location.reload(); //f5
		}, 5000); */
		
	</script>
</body>
</html>