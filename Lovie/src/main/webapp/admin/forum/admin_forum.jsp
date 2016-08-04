<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import charEncoding="UTF-8" url="../meta.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
		<c:import charEncoding="UTF-8" url="../nav.jsp"></c:import>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-md-4">
					<h2 class="">討論區管理</h2>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-10">
					<div id="crawloutput"></div>
				</div>
				<div class="col-md-2">
					<button id="update_button" onclick="movieCrawler()">更新電影</button>
					
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-12">
					<div class="panel-heading">被檢舉文章</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="dataTable_wrapper">
							<table class="table table-striped table-bordered table-hover"
								id="movietable">
								<thead>
									<tr>
										<th>操作</th>
										<th>ID</th>
										<th>會員</th>
										<th>分類</th>
										<th>文章標題</th>
										<th>文章內容</th>
										<th>發佈時間</th>
										<th>檢舉會員</th>
										<th>被檢舉原因</th>
										<th>檢舉次數</th>
									</tr>
								</thead>
								<tbody id="forum_tbody">				
										<tr id="admim_forum">

										</tr>								
								</tbody>
							</table>
						</div>
					</div>



				</div>
			</div>
			<c:import charEncoding="UTF-8" url="../footer.jsp"></c:import>
			
			
			
<script>

$.ajax({
	url : "${pageContext.request.contextPath}/forumsAdmin",
	type : "get",
	dataType : "json",
	success : function(report) {
			
		for(var i =0;i<report.length;i++){
			var td0 = $("<td id='"+'img'+report[i].id+"'></ul>").append("X");
			var td1 = $("<td id='"+'id'+report[i].id+"'></ul>").append(report[i].id);
			var td2 = $("<td id='"+'member'+report[i].id+"'></ul>").append(report[i].memberAccount);
			var td3 = $("<td id='"+'title'+report[i].id+"'></ul>").append(report[i].title);
			var td4 = $("<td id='"+'content'+report[i].id+"'></ul>").append(report[i].content);
			var td5 = $("<td id='"+'genre'+report[i].id+"'></ul>").append(report[i].genre);
			var td6 = $("<td id='"+'pubTime'+report[i].id+"'></ul>").append(report[i].pubTime);
			var td7 = $("<td id='"+'editTime'+report[i].id+"'></ul>").append(report[i].editTime);
			var td8 = $("<td id='"+'reportMember'+report[i].id+"'></ul>").append(report[i].reportMember);
			var td9 = $("<td id='"+'reportReason'+report[i].id+"'></ul>").append(report[i].reportReason);
			
			var tr = $("#admim_forum").append(td0);
			tr.append(td1);
			tr.append(td2);			
			tr.append(td3);
			tr.append(td4);
			tr.append(td5);
			tr.append(td6);
			tr.append(td7);
			tr.append(td8);
			tr.append(td9);
			
			$("#forum_tbody").append(tr);
			
		}
		
	
	}					
})


</script>		
			
			
</body>
</html>