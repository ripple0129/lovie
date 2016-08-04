<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/admin/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/dist/css/sb-admin-2.css"
	rel="stylesheet">


<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/admin/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/css/shop-homepage.css"
	rel="stylesheet">


<!-- MetisMenu CSS -->
<link
	href="${pageContext.request.contextPath}/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Timeline CSS -->
<link href="${pageContext.request.contextPath}/css/timeline.css"
	rel="stylesheet">


<!-- Morris Charts CSS -->
<link
	href="${pageContext.request.contextPath}/bower_components/morrisjs/morris.css"
	rel="stylesheet">





<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import charEncoding="UTF-8" url="/meta.jsp"></c:import>
<title>商城購物</title>

<style>
.navbar-default {
	margin-top: -0.5cm;
}

.nav {
	text-align: center;
}

.thumbnail {
	text-align: center;
	border: solid;
}



.col-lg-6{

	text-align: center;

}
</style>



<c:import charEncoding="UTF-8" url="/header.jsp"></c:import>
</head>
<body>

		<div class="row">

		<div class="navbar-default sidebar">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li><a href="/Lovie/products" class="show">首頁</a></li>

					<li><a href="/Lovie/product/memberproduct.jsp">購買會員</a></li>

					<li><a href="/Lovie/product/moviepostproduct.jsp">電影海報</a></li>
					<li><a href="/Lovie/product/dollproduct.jsp">人物公仔</a></li>
					<li><a href="/Lovie/product/clothesproduct.jsp">服飾</a></li>

					<li><a href="/Lovie/product/cart.jsp"><i class="glyphicon glyphicon-shopping-cart"></i> 購物車</a></li>
					<li><a href="/Lovie/product/tradedetail.jsp"><i class="selectbill"></i>訂單查詢</a></li>
					<li><a href=""><i class="customerservice"></i>回報客服</a> <!-- /.nav-second-level -->
					</li>


				</ul>
			</div>

		</div>
	</div>



	<div id="page-wrapper">

		<div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                                                                        購物車
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table id="ShoppingCart"class="table">
                                    <thead>
                                        <tr>
                                          
                                            <th>產品編號</th>
                                            <th>產品名稱</th>
                                            <th>產品樣式</th>
                                            <th>產品內容</th>
                                            <th>產品折扣</th>
                                            <th>產品價格</th>
                                             <th>數量</th>
                                             <th>小計</th>
                                        
                                         
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${addcartlist}" var="addtocart" varStatus="loop">
                                    		
                                           <tr id="Cart${addtocart.bean.productid}" data-cost="${addtocart.bean.cost*addtocart.amount}" class="success">
                                             <td>${addtocart.bean.productid}</td>
                                             <td>${addtocart.bean.name}</td>
                                             <td>${addtocart.bean.productphoto}</td>
                                             <td>${addtocart.bean.content}</td>
                                             <td>${addtocart.bean.discount}</td>
                                             <td>${addtocart.bean.cost}</td>
                                             <td>${addtocart.amount}</td>
                                             <td>${addtocart.bean.cost*addtocart.amount}</td>
                                            <c:if test="${loop.last}">
                                    		<script>
                                    		var itemAmount = ${loop.count}
                                    		</script>
                                    		</c:if>
                                    		
                                     </tr>
                                    </c:forEach> 
                                         <tr >
                                             <th>總金額</th>
                                             <td id="title">${param.allcost}</td>
                                         </tr>
                                        
                                    </tbody>
                                    
                                    
                                </table>
                                <div>
                          
                                </div>
                            </div>
                            
                            <div>
                            <a href="/Lovie/product/bill.jsp" type="button" class="btn btn-primary">確認結帳</a>
                       
                            <button type="button" class="btn btn-danger" onclick="history.back()">回上一頁</button>
                            </div>
                            </div>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->

<script> 


// //移除單筆
// function deleteCartItem(object){
// 	var cartlist = [];
// 	for(var i=1;i<itemAmount+1;i++){
// 		var item = {"productid": $('#Cart'+i+' td:eq(0)').text(), "amount": $('#Cart'+i+' td:eq(6)').text()}
// 		cartlist.push(item);
// 		alert(item);
// 		$("#").empty();
// 	}
//onclick="deleteCartItem(this)	
	
// 	//alert(object.id.substring(10));
// 	var cartid = object.id.substring(10);
// 	alert(cartid);
// 	alert($('#Cart'+cartid+' td:eq(6)').text());
	
	
// }
alert("${allcost}"+"AAA");

var allcost=0;
function titleCost(){
	var tbody = $('tbody:eq(1)')
   
	for(var i=0;i<itemAmount;i++){
	
     var allproductcost=$('tbody:eq(1)>tr:eq('+i+')').attr('data-cost');
		
		allcost=parseInt(allcost)+parseInt(allproductcost);

	}

}




</script>      







	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/admin/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/admin/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>


	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/admin/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Flot Charts JavaScript -->
	<script
		src="${pageContext.request.contextPath}/admin/bower_components/flot/excanvas.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/bower_components/flot/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/bower_components/flot/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/bower_components/flot/jquery.flot.resize.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/bower_components/flot/jquery.flot.time.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/bower_components/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
	

	<!-- Custom Theme JavaScript -->
	<script src="${pageContext.request.contextPath}/dist/js/sb-admin-2.js"></script>



</body>
<c:import charEncoding="UTF-8" url="/footer.jsp"></c:import>
</html>