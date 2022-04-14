<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <link rel="icon" href="./images/favicon.png" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<title>Document</title>

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
						<th class="text-center">사번</th>
						<th class="text-center">이름</th>
						<th class="text-center">JOB</th>
						<th class="text-center"></th>
					</tr>
				</thead>
				
				<tbody>
					<!-- <tr>
						<td class="text-center">100</td>
						<td class="text-center">홍길동</td>
						<td class="text-center">PROGRAMER</td>
						<td class="text-center">
							<button class="btnUpd">조회</button>
							<button class="btnDel">삭제</button>
						</td>
					</tr>	 -->
				</tbody>
			</table>
		</div>
		<div class="col" style="overflow:auto;">
			<form id="form1" class="form-horizontal">
				<h2>사원 등록 및 수정</h2>
				<div class="form-group">
					<label>사번:</label> <input type="text" class="form-control"
						name="employee_id">
				</div>
				<div class="form-group">
					<label>이름:</label> 
					<input type="text" class="form-control"	name="first_name">
					<input type="text" class="form-control"	name="last_name">
				</div>
				<div class="form-group">
					<label>이메일:</label> 
					<input type="text" class="form-control" name="email">
				</div>
				<div class="form-group">
					<label>입사일자:</label> 
					<input type="date" class="form-control" name="hire_date">
				</div>
				<div class="form-group">
					<label>역할:</label> 
					<select class="form-control" name="job_id">
						<option value="ST_CLERK">Stock Clerk</option>
						<option value="IT_PROG">Programmer</option>
						<option value="ST_MAN">Stock Manager</option>
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
<script>





function userList(){
	var url = "http://localhost:8000/myserver/empSelect";
	fetch(url)
	    .then(res => res.json())
	    .then(res =>{
	        for(user of res){
	            document.getElementsByTagName("tbody")[0].append(makeTr(user));
	        }
	    })
	}
	function makeTr(user){
	    var tr = document.createElement("tr");
	        tr.setAttribute("data-id",user.employee_id);
	             tr.innerHTML=`<tr>
							<td class="text-center">\${user.employee_id}</td>
							<td class="text-center">\${user.first_name}&nbsp;\${user.last_name}</td>
							<td class="text-center">\${user.job_id}</td>
							<td class="text-center">
								<button class="btnUpd">조회</button>
								<button class="btnDel">삭제</button>
							</td>
						</tr>`;
	                    return tr;
	}
	userList();

</script>
</body>
</html>