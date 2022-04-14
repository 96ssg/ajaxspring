<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>

<style >
	.active{background-color:black ; color:blue;}
</style>

</head>
<body>
	<ul>
		<li data-isbn="101"><span>Spring</span>
		<li data-isbn="102"><span>JAVA</span>
		<li data-isbn="103"><span>DB</span>
	</ul>
	<input id="book">
	
	<script>
	
			var cnt = 104;
		$("#book").on("keypress" , function(){
			
				if(event.keyCode == 13){
					$("<li>").append( $("<span>").html( $("#book").val() ) )
						.data("isbn", cnt)
						.appendTo($("ul")); // append() : nodelist의 마지막에 항상 추가된다
					$("#book").val("");
					
					cnt=cnt+1;
			}
					
		})
		$("ul").on("mouseover mouseout","span", function(){
			
			$(this).toggleClass("active"); // this : span tag
			
			console.log("isbn: "+$(event.target).parent().data("isbn"));
			//console.log("isbn: "+ event.target.parent.data() );
		})
		
		
	</script>
	
	
	
</body>
</html>