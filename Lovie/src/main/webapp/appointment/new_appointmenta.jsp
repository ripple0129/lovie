<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<c:import charEncoding="UTF-8" url="/meta.jsp"></c:import>
<style>
.col-lg-12 label {
	margin: 10px;
}
#div1{
	position: absolute;
	z-index: 1;
}
.col-md-3 a img{
	height: 280px;
}
.col-md-3{
	margin-bottom: 20px;
}
.form-group {
    margin-bottom: 6px;
}
.clearselspan {
   line-height:30px;
   //color:green;
}
.movie_intro
{
   border: #E0E0E0 1px dashed; 
   height:200px;
   overflow: auto; 
   //margin-left: 5px;
   //margin-right: 5px;   
}
.movie_showtime
{
   //height:180px;
   //margin-left: 5px;
   //margin-right: 5px;   
}
.movie_showtime_inside
{
   border: #BBB 2px dotted; 
   height: 180px; 
   overflow: auto; 
   padding-left: 1px;
   font-size:15px;
}
.movie_showtime_inside a:hover 
{ 
   text-decoration:none;
} 
</style>
<title>邀請新約會</title>
</head>
<body>
<c:import charEncoding="UTF-8" url="/header.jsp"></c:import>
<sec:authorize access="!hasRole('USER')">
	<div style="color:red;font-size:1.2em;">　請先登入，一般會員以上等級才可執行邀請新約會功能.</div>
</sec:authorize>
<sec:authorize access="hasRole('USER')"> 
<!-- beg sec-->	
<div class="container">

<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		步驟1:輸入查詢條件:
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
      <!-- 1查詢條件 beg -->
	  <form class="form-horizontal" role="form" name="form1" action="#">
	  <fieldset>
		<div class="form-group">
		    <label class="control-label col-md-2" for="city" style="margin-right: 0px;">城　　市：</label>
		    <div class="col-md-9"> 
	    		<select name="city" id="city" class="form-control" multiple="multiple">
					<c:forEach var="cityVO" items="${citynames}">
						<option value="${cityVO}">${cityVO}</option>
   					</c:forEach>
				</select>
		    </div>	
		    <span class="glyphicon glyphicon-remove-sign clearselspan" aria-hidden="true" onclick="clearinput(1);"></span>
		</div>
		<div class="form-group">
		    <label class="control-label col-md-2" for="theaterName" style="margin-right: 0px;">戲院名稱：</label>
		    <div class="col-md-9"> 
		    	<select name="theaterName" id="theaterName" class="form-control" >
					<option value=""  class="form-control"></option>
					<c:forEach var="theaterVO" items="${theaternames}">
						<option value="${theaterVO}">${theaterVO}</option>
   					</c:forEach>
				</select>
		    </div>
		    <span class="glyphicon glyphicon-remove-sign clearselspan" aria-hidden="true" onclick="clearinput(2);"></span>
		</div>
		<div class="form-group">
		    <label class="control-label col-md-2" for="genreId" style="margin-right: 0px;">電影類型：</label>
		    <div class="col-md-9"> 
	    		<select name="genreId" id="genreId"  class="form-control" multiple="multiple">
					<c:forEach var="genreVO" items="${genrenames}">
						<option value="${genreVO.id}">${genreVO.name}</option>
   					</c:forEach>
				</select>
		    </div>		 
		    <span class="glyphicon glyphicon-remove-sign clearselspan" aria-hidden="true" onclick="clearinput(3);"></span>
		</div>
		<div class="form-group">
		    <label class="control-label col-md-2" for="movieName" style="margin-right: 0px;">電影名稱：</label>
		    <div class="col-md-9"> 
		    	<select name="movieName" id="movieName" class="form-control" >
					<option value=""  class="form-control"></option>
					<c:forEach var="movieVO" items="${movienames}">
						<option value="${movieVO}">${movieVO}</option>
   					</c:forEach>
				</select>
		    </div>	
		    <span class="glyphicon glyphicon-remove-sign clearselspan" aria-hidden="true" onclick="clearinput(4);"></span>
		</div>
		<div class="form-group">
		    <label class="control-label col-md-2" for="showtimeDate" style="margin-right: 0px;">放映日期：</label>
		    <div class="col-md-9"> 
		    	<input type="text" class="form-control" id="showtimeDate" name="showtimeDate" placeholder="請選擇放映日期" readonly>
		    </div>
		    <span class="glyphicon glyphicon-remove-sign clearselspan" aria-hidden="true" onclick="clearinput(5);"></span>
	    </div>
		<div class="form-group"> 
		  <div class="col-md-offset-2 col-md-9">
			  <div class="btn-group" role="group" aria-label="...">
		      <button type="button" class="btn btn-warning " 
			      	onClick="formsubmit();">查询</button>
		      <button type="reset" class="btn btn-default" onClick="formreset();">重設</button>
			  </div>
		</div></div>
	  </fieldset>
	  </form>
      <!-- 1查詢條件 end -->
      </div>
    </div>
  </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		步驟2:選擇電影時刻表:
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
      <!-- 2 showtime beg -->
	  <div id="movieshowtime">
        	目前沒有符合條件的電影,請重新查詢。
      </div> 
      <!-- 2 showtime end -->
      </div>
    </div>
  </div>
</div>
<!-- end sec-->
</sec:authorize>
<c:import charEncoding="UTF-8" url="/footer.jsp"></c:import>
<!-- beg script -->
<script src='${pageContext.request.contextPath}/js/multiselect/select2.js'></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/multiselect/select2.css" type="text/css"/>

<!--  為了用 datapicker..才引用的js -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<script>
function clearinput(sel) {
	switch(sel)
	{  case 1:
			$("#city").val('').trigger('change'); break; 
	   case 2:
			$("#theaterName").val('').trigger('change'); break; 
	   case 3:
			$("#genreId").val('').trigger('change'); break; 
	   case 4:
			$("#movieName").val('').trigger('change'); break; 
	   case 5:
			$("#showtimeDatebeg").val(""); 
			$("#showtimeDateend").val(""); 
			break; 
	}
}

function formreset() {
	$("#city").val('').trigger('change');
	$("#theaterName").val('').trigger('change');
	$("#genreId").val('').trigger('change');
	$("#movieName").val('').trigger('change');
	$("#showtimeDate").val(""); 
}

function formsubmit() {
	var citysels = $("#city").val();
	var theatersels = $("#theaterName").val();
	var genresels = $("#genreId").val();
	var moviesels = $("#movieName").val();
<<<<<<< HEAD
	var showtimeDatebeg = $("#showtimeDatebeg").val();
	var showtimeDateend = $("#showtimeDateend").val();

	if ((showtimeDatebeg != ''  && showtimeDateend != '')
		&& (showtimeDatebeg > showtimeDateend)) 
	{
		alert("放映起日不可大於放映迄日,請重新選擇.");
		return;
	}	
	
	console.log(citysels);  //array
	console.log(theatersels);
	console.log(genresels);   //array
	console.log(moviesels);
	console.log(showtimeDatebeg+"~"+showtimeDateend);

	$.ajax({
		url : "new_appointmoviea_json",
		data:{citysels:citysels,theatersels:theatersels,
			genresels:genresels,moviesels:moviesels,
			showtimeDatebeg:showtimeDatebeg,showtimeDateend:showtimeDateend},
		type:"get",
		success : function(data) {
		if (data != null) {
				//var result = JSON.parse(data);
				var result =data;
				var movieshowtime = $("#movieshowtime");
				console.log(movieshowtime);
				if (result.length > 0) {
					movieshowtime.empty();
				for (var i = 0; i < result.length; i++) {
					var item = result[i];
				//**one movie template beg
				    var drow = document.createElement('div');
				    $(drow).addClass("row").appendTo(movieshowtime); //row div
				    var drow_c1 = document.createElement('div');
				    $(drow_c1).addClass("col-md-2").appendTo(drow); //row div_col-2
				    $("<img src=${pageContext.request.contextPath }/photo/movie/"+item.id+" style='height:200px;'>").appendTo(drow_c1);				
				    var drow_c2 = document.createElement('div');
				    $(drow_c2).addClass("col-md-5").appendTo(drow); //row div_col-5
				    $(drow_c2).addClass("movie_intro");
				    $("<p><img src='${pageContext.request.contextPath }/image/movie/"+item.rank+".png' width='40'	></p>").appendTo(drow_c2);				
				    $("<b style='font-size: 13px;'>片名："+item.name+"</b>").appendTo(drow_c2);				
				    $("<p>上映時間:"+item.startTime+"</p>").appendTo(drow_c2);				
				    $("<p>類型:"+item.genrelist+"</p>").appendTo(drow_c2);				
				    $("<p align='justify'>簡介:<br>"+item.intro+"</p>").appendTo(drow_c2);				
				    var drow_c3 = document.createElement('div');
				    $(drow_c3).addClass("col-md-5").appendTo(drow); //row div_col-5
				    $(drow_c3).addClass("movie_showtime");
				    $("<h3 style='margin:1px;'>電影時刻表</h3>").appendTo(drow_c3);
				    var drow_c3_1 = document.createElement('div');
				    $(drow_c3_1).addClass("movie_showtime_inside").appendTo(drow_c3); 
				    var item_s =  item.showtimeBeans;
					for (var j = 0; j < item_s.length; j++) {
						var item_s_i = item_s[j];
						$("<a href='${pageContext.request.contextPath }/appointmentaadd/"+item_s_i.id+"'><p>　"+
								item_s_i.theaterName+"　"+item_s_i.showtimeDate+"　"+item_s_i.showtimeTime+"</p></a>").appendTo(drow_c3_1);
					}
				//**one movie template end	
				}
					$("#collapseOne").removeClass('in');
				 	//alert("查詢完成.....");
				} else {
					movieshowtime.text("目前沒有符合條件的電影,請重新查詢。");
				 	//alert("沒有相符的電影,請重新查詢。");
				}
				$("#collapseTwo").addClass('in');
					
		}}
	});
=======
	var showtimesels = $("#showtimeDate").val();
console.log(citysels);
console.log(theatersels);
console.log(genresels);
console.log(moviesels);
console.log(showtimesels);
  alert("查詢.....");
  
  
  
>>>>>>> branch 'master' of https://github.com/eeit86lovie/lovie.git
}
</script>

<script type="text/javascript">
     $(function () {
		 $('#city').select2({
			 placeholder: '請選擇城市'
		 });
		 $('#theaterName').select2({
			 placeholder: '請選擇戲院名稱',
			 allowClear: true
		 });
		 $('#genreId').select2({
			 placeholder: '請選擇劇情類型'
		 });
		 $('#movieName').select2({
			 placeholder: '請選擇電影名稱',
			 allowClear: true
		 });
         $('#showtimeDate').datepicker({ dateFormat: "yy-mm-dd" });
     });
</script>
<!-- end script -->
</body>
</html>