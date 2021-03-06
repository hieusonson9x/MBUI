<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Quản lý hợp đồng</title>

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />" />

<!-- Font Awesome -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/font-awesome/css/font-awesome.min.css" />" />

<!-- NProgress -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/nprogress/nprogress.css" />" />

<!-- iCheck -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/iCheck/skins/flat/green.css" />" />

<!-- bootstrap-progressbar -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" />" />

<!-- Custom Theme Style -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/css/custom.min.css" />" />
<link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/dataTable.css" />" />
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
					<div class="title_left">
						<h3>Danh sách hợp đồng cần thẩm định </h3>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							
							<div class="x_title"></div>
							<div class="x_title">
								<form method="post" id="frmSearch" class="form-horizontal form-label-left" 
									action="<s:url action = "i3searchVerify" namespace="/web/insurrance" />" style="margin-right: 145px;">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<div class="row">
										<div class="col-md-6">
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Số HĐBH</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control" placeholder="Số HĐBH" type="text"
														name="insurrance.numberInsurrance" />
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Mã KH</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control" placeholder="Mã KH" type="text"
														name="insurrance.customerCode" />
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Sản phẩm</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control" placeholder="Sản phẩm" type="text"
														name="insurrance.product" />
												</div>
											</div>
											
										</div>
										<div class="col-md-6">
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Tên KH</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control" placeholder="Tên KH" type="text"
														name="insurrance.customerName" />
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Chi nhánh phát hành</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control" placeholder="Chi nhánh phát hành" type="text"
														name="insurrance.agencyName" />
												</div>
											</div>
										</div>
									</div>
									<div style="float: right;">
										<s:submit value="Tìm kiếm" align="left"
											style="margin-top: 4px;"
											cssClass="btn btn-default" />
									</div>
								</form>
								<div class="clearfix"></div>
								<s:if test="hasActionMessages()">
									<div class="alert alert-success fade in"
										style="text-align: center;">
										<a href="#" class="close" data-dismiss="alert"
											aria-label="close">&times;</a>
										<s:actionmessage />
									</div>
								</s:if>
								<s:if test="hasActionErrors()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
										id="errorLogin">
										<div>
											<s:actionerror />
										</div>
									</div>
								</s:if>
							</div>

							<div class="x_content">
								<table id="verify" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th style="text-align: center;">STT</th>
											<th>Số HĐBH</th>
											<th>Mã khách hàng</th>
											<th>Họ và tên</th>
											<th>Mã khoản vay</th>
											<th>Sản phẩm</th>
											<th>Trạng thái hợp đồng</th>
											<th>Chức năng</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="k" value="0"></c:set>
										<s:iterator value="insurrances">
											<tr>
												<td style="text-align: center;">${k=k+1}</td>
												<td>
												<s:if test="numberInsurrance==0">
												</s:if>
												<s:else>
													${numberInsurrance}
												</s:else>
												</td>
												<td><s:property value="customerCode" /></td>
												<td><s:property value="customerName" /></td>
												<td>
													<s:property value="contractNumber" />
												</td>
												<td><s:property value="product" /></td>
												<td><s:if test="statusContract==1">
														Đang hiệu lực
													</s:if> <s:if test="statusContract==2">
														Xử lý
													</s:if> <s:if test="statusContract==3">
														Đang chờ xử lý
													</s:if> <s:if test="statusContract==4">
														Từ chối
													</s:if> <s:if test="statusContract==5">
														Bị trì hoãn
													</s:if> 
													<s:if test="statusContract==6">
														Chấm dứt
													</s:if>
													<s:if test="statusContract==7">
														Đợi duyệt
													</s:if>
													<s:if test="statusContract==8">
														Chấm dứt
													</s:if>
													</td>
												<td style="text-align: center;"><s:url var="viryfy"
														action="i3getFromVerify" namespace="/web/insurrance">
														<s:param name="getId">
															<s:property value="id"></s:property>
														</s:param>
													</s:url> <a href="${viryfy}" class="btn btn-default btn-xs"></i>Xử lý
												</a></td>
											</tr>
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
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/user/userdel.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/app.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/datatable/datatables.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#verify").dataTable({
				"searching": false
			});
		});
	</script>
</body>
</html>