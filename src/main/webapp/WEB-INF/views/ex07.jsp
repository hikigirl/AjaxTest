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
	<h1>우편번호 검색</h1>
	<table class="vertical">
		<tr>
			<th>검색</th>
			<td>
				<input type="text" id="dong" name="dong" required="required" placeholder="동 이름을 입력하세요.">
				<input type="button" value="검색하기" id="btnSearch">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<select name="address1" id="address1">
					<option selected="selected" disabled="disabled">검색하세요.</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td>
				<input type="text" id="address2" name="address2" class="full">
			</td>
		</tr>
	</table>

	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		//btnSearch를 클릭했을때 검색어를 넘겨서 sql 작업 후 반환
		$('#btnSearch').click(()=> {
			//alert();
			$.ajax({
				type: 'get',
				url: '/ajax/ex07data.do',
				data: 'dong=' + $('#dong').val(),
				success: function(result){
					
				},
				error: function(a,b,c){
					console.log(a,b,c);
				}

			});
		});
	</script>
</body>
</html>