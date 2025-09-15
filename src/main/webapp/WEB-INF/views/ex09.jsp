<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK" />
	<style>
		h1{
			display: flex;
			justify-content: space-between;
		}
		h1 > span {
			font-size: 1.5rem;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<!-- 주소록 읽기+쓰기 -> Ajax 처리 -->
	<h1>주소록 <span data-sidebar-button="sidebar">⚙️</span></h1>
	<table id="list">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
				<th>전화</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<!-- <tr>
				<td>1</td>
				<td>홍길동</td>
				<td>25</td>
				<td>남자</td>
				<td>010-1111-2222</td>
				<td>서울시 강남구 역삼동</td>
			</tr> -->
		</tbody>
	</table>
	
	<div data-sidebar-window="sidebar" 
		 data-sidebar-title="주소록 추가하기"
		 data-sidebar-direction="right">
		 <form action="" id="form1">
		 <div>
			 <label>이름: </label>
			 <input type="text" id="name" name="name"/>
		 </div>
		 <div>
			 <label>나이: </label>
			 <input type="text" id="age" name="age"/>
		 </div>
		 <div>
			 <label>성별: </label>
			 <select name="gender" id="gender">
			 	<option value="m">남자</option>
			 	<option value="f">여자</option>
			 </select>
		 </div>
		 <div>
			 <label>전화: </label>
			 <input type="text" id="tel" name="tel"/>
		 </div>
		 <div>
			 <label>주소: </label>
			 <input type="text" id="address" name="address"/>
		 </div>		 
		 <div>
			 <input type="button" id="btn1" value="추가하기"/>
		 </div>
		 </form>
		
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		//페이지 로딩 -> 주소록 목록 출력
		
		function list() {
			$.ajax({
				type: 'get',
				url: '/ajax/ex09data.do',
				dataType: 'json',
				success: function(result) {
					$('#list tbody').html('');
					result.forEach(item => {
						$('#list tbody').append(`
						<tr>
							<td>\${item.seq}</td>
							<td>\${item.name}</td>
							<td>\${item.age}</td>
							<td>\${item.gender}</td>
							<td>\${item.tel}</td>
							<td class="left">\${item.address}</td>
						</tr>
						`);
					});
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		}
		
		list();
		
		
		$('#btn1').click(()=>{
			//form태그 + name 속성으로 만들어짐
			//console.log($('#form1').serialize());
			//주소록 추가하기(ajax)
			$.ajax({
				type: 'post',
				url: '/ajax/ex09data.do', //doget dopost 메서드가 구별되어있어서 하나의 서블릿
				/* 방법1)노가다...
					data: 'name=' 	  + $('#name').val() 
					+ '&age='	  + $('#age').val() 
					+ '&gender='  + $('#gender').val()
					+ '&tel='	  + $('#tel').val() 
					+ '&address=' + $('#address').val(), */
				//2. serialize 사용	
				//data: $('#form1').serialize(),
				
				//3. javascript 객체 직접 대입
				data: {
					name: $('#name').val(),
					age: $('#age').val(),
					gender: $('#gender').val(),
					tel: $('#tel').val(),
					address: $('#address').val(),
				},
				dataType: 'json',
				success: function(result) {
					//alert(result.result);
					if (result.result>0) {
						
						//고민?
						//list() 함수는 새로운 것만 갱신하는 것이 아니라
						//모든 데이터를 다시 가져오는 방식..
						//list();
						
						//새로운 항목을 db에서 가져오지 않고 동적으로 tr을 생성...
						$('#list tbody').prepend(`
						<tr>
							<td>\${result.seq}</td>
							<td>\${$('#name').val()}</td>
							<td>\${$('#age').val()}</td>
							<td>\${$('#gender').val()}</td>
							<td>\${$('#tel').val()}</td>
							<td class="left">\${$('#address').val()}</td>
						</tr>
						`);
						
						$('#name').val('');
						$('#age').val('');
						$('#gender').val('m');
						$('#tel').val('');
						$('#address').val('');
						$('body > div > div > span.material-symbols-outlined').click();
					} else {
						alert('failed');
					}
				},
				error: function(a,b,c){
					console.log(a,b,c);
				}
			});
			
			
			
		});
		
	</script>
</body>
</html>