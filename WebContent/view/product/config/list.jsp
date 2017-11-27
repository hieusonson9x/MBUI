<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Cấu hình tỉ lệ giảm phí</title>

    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />" />
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/font-awesome/css/font-awesome.min.css" />" />
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/datatable/datatables.min.css"/>" />
    
		<link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/custom.min.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/view/product/product.css" />" />
</head>
<body class="nav-md">
	<div class="container body">
	<input type="hidden" id="tab-active" value="${tab }" />
	    <div class="main_container">
	        <!-- BEGIN HEADER -->
	        <%@include file="/view/layout/header.jsp" %>
	        <!-- END HEADER -->
	
	        <!-- page content -->
			<div class="right_col" role="main">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12" id="mainRateId">
						<div class="x_panel">
							<div class="x_title">
								<h2 class="col-md-7">Cấu hình tỷ lệ giảm phí</h2>
								<div class="clearfix"></div>
							</div>
							<div id="filter" class="x_content">
								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<s:if test="hasActionMessages()">
											<div id="errorLogin" class="alert alert-success col-xs-12 col-sm-12 col-md-12">
												<s:actionmessage />
											</div>
										</s:if>
										<ul class="nav nav-tabs">
											<li class="active"><a data-toggle="tab"
												href="#discountByCusGroup">Giảm phí theo nhóm khách hàng</a></li>
											<li><a data-toggle="tab" href="#discountByMoney">Giảm
													phí theo số tiền</a></li>
										</ul>
										<div class="tab-content">
											<div id="discountByCusGroup" class="tab-pane fade in active">
												<table id="customerGroupDatatable"
													class="datatable table table-striped table-hover no-footer"
													width="100%">
													<thead>
														<tr>
															<th>STT</th>
															<th>Nhóm khách hàng</th>
															<th>Tỉ lệ giảm</th>
															<th>Ngày bắt đầu</th>
															<th>Ngày kết thúc</th>
															<th>Chức năng</th>
														</tr>
													</thead>
													<tbody>
														<s:iterator value="groupDiscounts" status="stt">
															<tr>
																<td class="discount-no"><s:property
																		value="%{#stt.index + 1}" /></td>
																<td><s:property value="customerGroup"></s:property></td>
																<td><s:property value="rate"></s:property></td>
																<td><s:property value="beginDate"></s:property></td>
																<td><s:if test="endDate==null">
																</s:if>
																<s:else>
																<s:property value="endDate"></s:property></td>
																</s:else>
																<td><s:url var="edit" action="edit"
																		namespace="/web/product/config">
																		<s:param name="type">group</s:param>
																		<s:param name="id">
																			<s:property value="id"></s:property>
																		</s:param>
																	</s:url> <a href="${edit}" class="btn btn-default btn-xs"> Sửa
																		
																</a></td>
															<tr>
														</s:iterator>
													</tbody>
												</table>
												<div class="row">
													<div class="col-md-12" style="text-align: center;">
														<s:url var="group" action="new"
															namespace="/web/product/config">
															<s:param name="type">group</s:param>
														</s:url>
														<a href="${group}" class="btn btn-default">Thêm mới</a>
													</div>
												</div>
											</div>
											<div id="discountByMoney" class="tab-pane fade">
												<table id="moneyDatatable"
													class="table table-striped table-hover no-footer"
													width="100%">
													<thead>
														<tr>
															<th>STT</th>
															<th>Số tiền nhỏ nhất</th>
															<th>Số tiền lớn nhất</th>
															<th>Tỉ lệ giảm</th>
															<th>Ngày bắt đầu</th>
															<th>Ngày kết thúc</th>
															<th>Chức năng</th>
														</tr>
													</thead>
													<tbody>
														<s:iterator value="moneyDiscounts" status="stt">
														
															<tr>
																<td class="discount-no"><s:property
																		value="%{#stt.index + 1}" /></td>
																<td>
																<fmt:formatNumber maxFractionDigits = "3" value ="${minMoney}" />
																</td>
																<td><fmt:formatNumber maxFractionDigits = "3"  value ="${maxMoney}" />
																</td>
																<td><s:property value="rate"></s:property></td>
																<td><s:property value="beginDate"></s:property></td>
																<td><s:if test="endDate==null">
																</s:if>
																<s:else>
																<s:property value="endDate"></s:property></td>
																</s:else></td>
																<td><s:url var="edit" action="edit"
																		namespace="/web/product/config">
																		<s:param name="type">money</s:param>
																		<s:param name="id">
																			<s:property value="id"></s:property>
																		</s:param>
																	</s:url> <a href="${edit}"class="btn btn-default btn-xs"> Sửa
																</a></td>
															<tr>
														</s:iterator>
													</tbody>
												</table>
												<div class="row">
													<div class="col-md-12" style="text-align: center;">
														<s:url var="money" action="new"
															namespace="/web/product/config">
															<s:param name="type">money</s:param>
														</s:url>
														<a href="${money}" class="btn btn-default">Thêm mới</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->
	
	        <!-- BEGIN FOOTER -->
	        <%@include file="/view/layout/footer.jsp" %>
	        <!-- END FOOTER -->
	    </div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/moment.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/locale/vi.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/view/product/rate.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/app.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/datatable/datatables.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("tr").each(function(){
				if(this.innerHTML.trim() == "") 
					this.remove();
			});
			$("#moneyDatatable").DataTable({
				"searching" : false
			});
			$("#customerGroupDatatable").DataTable({
				"searching" : false
			});
			$("#errorLogin").fadeTo(2000, 500).slideUp(500, function() {
				$("#errorLogin").slideUp(500);
				$("#errorLogin").remove();
			});
			history.pushState(null, null, getContextPath() + "/web/product/config/list.action");
/* 			let a = $("#tab-active").val();
			console.log("tab active:" + a);
			if(a == '2'){
				console.log("ok");
						  
			}
 */		});
	</script>

</body>
</html>