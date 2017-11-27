<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Quản lý cấu hình sản phẩm</title>

<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/font-awesome/css/font-awesome.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/css/custom.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/css/view/product/product.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/datatable/datatables.min.css"/>" />

</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- BEGIN HEADER -->
			<%@include file="/view/layout/header.jsp"%>
			<!-- END HEADER -->

			<!-- page content -->
			<div class="right_col" role="main">
			
			<div class="page-title">
					<div class="col-lg-6">
									<h3>Quản lý cấu hình sản phẩm</h2>
								</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12" id="mainRateId">
						<div class="x_panel">
							<div class="x_title">
								
							</div>
							<div id="filter" class="x_content">
								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="x_panel">
											<div class="x_content">
												<s:if test="hasActionMessages()">
													<div class="alert alert-success col-xs-12 col-sm-12 col-md-12" id="errorLogin">
														<s:actionmessage id="actionmessage"/>
														${requestScope.thongbao}
													</div>
												</s:if>
												<form id="formProduct"
													action="<s:url action= "find" namespace="/web/product"/>"
													class="form-horizontal form-label-left" method="post">
													<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" /> <input type="hidden"
														name="agency.id">
													<div class="row">
														<div class="col-md-6">
															<div class="item form-group">
																<label class="control-label col-md-4 col-sm-3 col-xs-12"
																	for="firstName">Mã sản phẩm </label>
																<div class="col-md-7 col-sm-7 col-xs-12">
																	<s:textfield class="form-control" type="text"
																		name="product.code" />
																</div>
															</div>
														</div>
														<div class="col-md-6">
															<div class="item form-group">
																<label class="control-label col-md-4 col-sm-3 col-xs-12"
																	for="firstName">Tên sản phẩm </label>
																<div class="col-md-8 col-sm-7 col-xs-12" style="padding-right: 15px;">
																	<s:textfield class="form-control" type="text"
																		name="product.name" />
																</div>
															</div>
														</div>
													</div>
													<div class="col-md-6"></div>
													<div class="col-md-6" style="text-align: end;">
														<button id="find" type="submit" class="btn btn-default">Tìm
															kiếm</button>
														<a class="btn btn-default"
															href="<s:url action='new' namespace='/web/product'/>">Thêm
															mới</a> 
														<a class="btn btn-default"
															href="<s:url action='list' namespace='/web/product/config'/>">Cấu
															hình tỷ lệ giảm phí</a>

													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="div1" class="x_content">
								<table id="product-table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th style="font-size:14px; text-align:center; width:30px;">STT</th>
											<th style="font-size:14px; text-align:center; width:150px;">Mã sản phẩm</th>
											<th style="font-size:14px; text-align:center; width:200px;">Tên sản phẩm</th>
											<th style="font-size:14px; text-align:center; width:150px;">Ngày triển khai</th>
											<th style="font-size:14px; text-align:center; width:200px;">Tình trạng hiệu lực</th>
											<th style="font-size:14px; text-align:center;width:100px;">Chức năng</th>
										</tr>
									</thead>
									<tbody>
										<s:iterator value="products" var="product" status="stt">
											<tr>
												<td class="product-no"><s:property
														value="%{#stt.index + 1}" /></td>
												<td class="product-code"><s:property value="code"></s:property></td>
												<td class="product-name"><s:property value="name"></s:property></td>
												<td class="product-deployment"><s:date
														name="deploymentDate" var="formattedVal"
														format="dd/MM/yyyy" /> <s:property
														value="%{#formattedVal}"></s:property></td>
												<td class="producty-status">
													<s:if test="status == 1">
														Đang hiệu lực
													</s:if>
													<s:if test="status == 2">
														Hết hiệu lực
													</s:if>
													<s:if test="status == 3">
														Dừng triển khai mới
													</s:if>
												</td>
												<td style="text-align: center;"><s:url var="show" action="show"
														namespace="/web/product">
														<s:param name="code">
															<s:property value="code"></s:property>
														</s:param>
													</s:url> <a href="${show}" class="btn btn-default btn-xs"> Xem
												</a> <s:url var="edit" action="edit" namespace="/web/product">
														<s:param name="editCode">
															<s:property value="code"></s:property>
														</s:param>
													</s:url> <a href="${edit}" class="btn btn-default btn-xs"> Sửa
												</a></td>
											<tr>
										</s:iterator>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->

			<!-- BEGIN FOOTER -->
			<%@include file="/view/layout/footer.jsp"%>
			<!-- END FOOTER -->
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/moment.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/locale/vi.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/app.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/datatable/datatables.min.js"></script>
	
	
	<script type="text/javascript">
		$(document).ready(function() {
			//window.history.pushState("","", location.href);
			$("tr").each(function() {
				if (this.innerHTML.trim() == "")
					this.remove();
			});
			$("#product-table").dataTable({
				"searching" : false
			});
			$("#errorLogin").fadeTo(2000, 500).slideUp(500, function() {
				$("#errorLogin").slideUp(500);
				$("#errorLogin").remove();
			});
			history.pushState(null, null, $("#a-product").attr("href"));
		});
	</script>
</body>
</html>