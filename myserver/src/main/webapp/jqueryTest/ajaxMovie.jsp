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
	<script >
	const url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20220412";
	$.ajax(url)
	.done(function(data){
		console.log(typeof data, data);
		
		// {content-infoList} >> data.~~  / [] >> data.~~.~~[index]
		console.log(data.boxOfficeResult.dailyBoxOfficeList[0].movieNm);
	})
	const detailInfo = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=20204431"
	$.ajax(detailInfo)
		.done(function(data){
			//console.log(data);
			var director = data.movieInfoResult.movieInfo.directors[0];
			console.log(director.peopleNm +" "+director.peopleNmEn);
			
		})
	</script>






</body>
</html>