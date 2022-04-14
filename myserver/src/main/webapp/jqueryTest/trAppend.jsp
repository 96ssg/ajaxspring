<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	#btn{width:50%}
	table {width: 70%;}
	tr td{text-align:center;}
	input {width:30%}
</style>
</head>
<body>
		<div>
		ID :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id ="userid"><br/>
		NAME : &nbsp;  <input id ="username"><br/>
		SALARY : <input id ="sal"><br/>
		</div>
		<div>
		<button type="button" id="btn">등록</button>
		</div>
		<p>
		<table border="1">
			<thead>
			<tr>
			<td>이름</td>
			<td>급여</td>
			
			</tr>
			</thead>
			<tbody>
			
			<tr data-userid="101">
			<td>홍길동</td>
			<td>500</td>
			
			</tr>
			</tbody>
		</table>
	
	<script>
	
	// `` 안에 EL표현식을 쓸경우 $앞에 \을 붙혀야 값이 나온다
	$("#btn").on("click" , function(){
		
		
		/* var $tr = $("<tr>");
		var $tdName = $("<td>").html( $("#username").val() );
		var $tdSal = $("<td>").html( $("#sal").val());
		
		$tr.append($tdName , $tdSal);
		$tr.data("userid" , $("#userid").val());
		$("table").append($tr); */
		
		
		
		$("<tr>").append($("<td>").html( $("#username").val() ), 
						 $("<td>").html( $("#sal").val() ) )
				 .data("userid",$("#userid").val())
				 .appendTo($("table"))
	})
	$("tbody").on("mouseover","tr",function(){
		//console.log($(event.target));
		console.log($(event.target).parent().data("userid"));
	})
	
	
	
	</script>
</body>
</html>