<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<input id="title"><br/>
	<button type="button" id="btn">등록</button>
	<div id="todoList">
		<div data-id="todo번호">title completed</div>
	</div>
	<script>
	var url = "https://jsonplaceholder.typicode.com/todos";
	$("#btn").on("click",function(){
		$.ajax(url , {
			method : "POST",
			data : JSON.stringify({title : $("#title").val(), userid:"20", completed: false}),
			contentType : "application/json; charset=utf-8" 
		})
		.done(function(res){
			
			console.log(res);
		})
	})
	
	
		$.ajax(url)
			.done(function(data){
				console.log(data);
				for(todo of data){
					let div = $("<div>") 
					//console.log(todo.completed);
					div.html(todo.title, todo.completed)
						  	  .data("id",todo.id)
						      .appendTo($("#todoList"))
				if(todo.completed){
					div.css("color","red");
				}
				}
			})
				
			
	
	</script>
</body>
</html>