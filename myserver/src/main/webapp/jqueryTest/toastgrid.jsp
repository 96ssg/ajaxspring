<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>toastgrid.jsp</title>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script>
	$(function(){
		const Grid = tui.Grid;
		const instance = new Grid({
			  el: document.getElementById('grid'), // Container element
			  columns: [
			    {
			      header: '사원번호',
			      name: 'employee_id'
			    },
			    {
			      header: '이름',
			      name: 'last_name',
			      editor : 'text'
			    },
			    {
			      header: '이메일',
			      name: 'email',
			      editor : 'text'
			    },
			    {
			      header: '담당',
			      name: 'job_id',
			      editor : {
			    	  type: 'select',
			            options: {
			              listItems: [
			                { text: 'President', value: 'AD_PRES' },
			                { text: 'Administration', value: 'Assistant' },
			                { text: 'IT_PROG', value: 'IT_PROG' },
			                { text: 'Sales Manager', value: 'ST_MAN' },
			                { text: 'MK_MAN', value: 'ST_CLERK' },
			              ]
			    	  }
			      }
			    },
			    {
				  header: '급여',
				  name: 'salary',
			      editor : 'text'
				},
			    {
			      header: '입사일',
				  name: 'hire_date',
			      editor : 'text'				    
			    }
			  ],
			  data: {
				  api: {
					  readData: { url: '/readEmp', method : 'GET'},
					  modifyData: { url: '/modifyEmp', method: 'POST'}
					}
			  },
			  contentType: 'application/json',
			});
			
			//ajax 데이터 호출
			//let jsonData;
		/* 	$.ajax({
			url : "/empSelect"
			}).done(function(datas){
				//jsonData = datas
			instance.resetData(datas); // Call API of instance's public method
			}) */
			
			Grid.applyTheme('striped'); // Call API of static method
			
			$("#btnInsert").on("click",function(){
				instance.appendRow();
			})
			$("#btnDelete").on("click",function(){
				if(instance.getFocusedCell()){
					instance.removeRow(instance.getFocusedCell().rowKey);
				}
				//instance.removeRow(getFocusedCell());
			})
			$("#btnUpdate").on("click",function(){
				instance.request('modifyData');
			})
	})
</script>
</head>
<body>
<button id="btnInsert">추가</button>
<button id="btnDelete">삭제</button>
<button id="btnUpdate">저장</button>
	<div id="grid"></div>
</body>
</html>