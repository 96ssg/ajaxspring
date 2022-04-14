<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <link rel="icon" href="./images/favicon.png" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="template/js/json.min.js"></script>
	<title>user_jquery</title>

	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<script>
$('.col').scrollTop($('.col').prop('scrollHeight'));
</script>
<div class="container">
	<div class="row">
		<div class="col">
			<h2>사원 목록</h2>
			<table class="table text-center">
				<thead>
					<tr>
						<th class="text-center">아이디</th>
						<th class="text-center">비밀번호</th>
						<th class="text-center">이름</th>
						<th class="text-center">권한</th>
						<th class="text-center"></th>
					</tr>
				</thead>
				
				<tbody>
					<!-- 내용부 script -->
				</tbody>
			</table>
		</div>
		<div class="col" style="overflow:auto;">
			<form id="frm" name="frm" class="form-horizontal">
				<h2>사원 등록 및 수정</h2>
				<div class="form-group">
					<label>아이디:</label> <input type="text" class="form-control"
						name="id">
				</div>
				<div class="form-group">
					
					<label>이름:</label> <input type="text" class="form-control"
					name="name">
				</div>
				<div class="form-group">
					<label>패스워드:</label> <input type="text" class="form-control"
					name="password">
				</div>
				<div class="form-group">
				<label>역할:</label> <select class="form-control" name="role">
					<option value="Admin">관리자</option>
					<option value="User">사용자</option>
				</select>
				</div>
				<div class="form-group">
					<input type="button" class="btn btn-primary" value="등록" id="btnInsert" /> 
					<input type="button" class="btn btn-primary" value="수정" id="btnUpdate" /> 
					<input type="button" class="btn btn-primary" value="초기화" id="btnInit" />
				</div>
			</form>
		</div>
	</div>
		
</div>

<!-- 일단  >> data : JSON.stringify($("#frm").serializeObject()), 이들어간 부분이 안되고 있고
	삭제 와 수정 부분의 document.querySelector('[name='+data.id+']').remove(); 이부분의
	.remove()가 정상적으로 안먹힙니다 
	어떤 의미이냐 하면 삭제가 먹히는데 새로고침해야 먹힙니다 ;;
	 

 -->

		<script type= "text/javascript">

		// 등록  : 직접이벤트로 걸기
		$("#btnInsert").bind("click", userInsert);
		function userInsert(){
			const url = "http://localhost:8000/myserver/users";
			 let id = frm.id.value; 
		     let password = frm.password.value;
		     let name = frm.name.value;
		     let role = frm.role.value;
		     let obj = {id , password , name, role};
			$.ajax(url, {
				method : "POST",
				data : JSON.stringify($("#frm").serializeObject()),
				contentType : "application/json"
			})
			.done(function(data){
				document.getElementsByTagName("tbody")[0].append(makeTr(data));
			})
		     
		}
		
		//단건 조회
		
		function userSelect(){
			
			//console.log();
			// var uid = 
			// 그룹이벤트로 시작
			$("tbody").on("click",".btnUpd",function(){
				var uid = event.target.closest("tr").children[0].innerHTML;	
				
			var url = "http://localhost:8000/myserver/users/"+uid;
				$.ajax(url)
				.done(function(data){
					frm.id.value=data.id
					frm.password.value=data.name
					frm.name.value=data.password
					frm.role.value=data.role
				})
				
			})
			
		}
		
		
		// 삭제 
		function userDel(){
			// 그룹로 이벤트 시작
			$("tbody").on("click",".btnDel",function(){
				var uid = event.target.closest("tr").children[0].innerHTML;
				var url = "http://localhost:8000/myserver/users/"+uid;
				$.ajax(url,
						{
					method : "DELETE",
					contentType : "application/json" 
						})
				.done(function(data){
					document.querySelector('[data-id='+data.id+']').remove();
				})
			})
		}
		
		// 수정 : 직접이벤트
		
		  $("#btnUpdate").bind("click",userUpdate);
		function userUpdate(){
		  //	버튼 클릭이벤트 -> ajax처리
		let id = frm.id.value;
        let password = frm.password.value;
        let name = frm.name.value;
        let role = frm.role.value;
        let obj = {id , password , name, role};
		  var url = "http://localhost:8000/myserver/users"
		  $.ajax(url , {
			  method :  "PUT",
			  data : JSON.stringify($("#frm").serializeObject()),
			  contentType : "application/json"
		  })
		  .done(function(user){
			  console.log(user);
			  let newTr = makeTr(user);
			  let oldTr = $('[data-id='+user.id+']');
		        
              	document.getElementsByTagName("tbody")[0].replaceChild(newTr, oldTr);
		  })
		  
		  
		}
		
		// 전체조회 ajax
		function list(){
		var url = "http://localhost:8000/myserver/users"
		 $.ajax(url)
		 	.done(function(res){
		 		//console.log(res);
		 		
		 		for(tab of res){
			 		
		 			$("tbody").append(makeTr(tab));
		 		}
		 	})
  
		}
		
		function makeTr(user){
		   var tr = $("<tr>");
		   tr.attr("data-id",user.id);
		   tr.append(`
					<td class="text-center">\${user.id}</td>
					<td class="text-center">\${user.password}</td>
					<td class="text-center">\${user.name}</td>
					<td class="text-center">\${user.role}</td>
					<td class="text-center">
						<button class="btnUpd">조회</button>
						<button class="btnDel">삭제</button>
					</td>
				`)
		 return tr;
		}
		$(function(){
			userInsert();
			userUpdate();
			userSelect();
			userDel();
			list();
		})
		
		</script>
</body>
</html>