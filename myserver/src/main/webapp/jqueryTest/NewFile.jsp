<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<div id="abc">
	<div>ㅋㅋ</div>
</div>
<script>
$("#abc").prepend($("<div>").text("first"));
</script>
</body>
</html>