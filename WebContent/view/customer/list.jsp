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

<title>Quản lý Khách hàng</title>

<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/font-awesome/css/font-awesome.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/nprogress/nprogress.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/iCheck/skins/flat/green.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/css/custom.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/css/dataTable.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" />" />
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- BEGIN HEADER -->
			<%@include file="../layout/header.jsp"%>
			<!-- END HEADER -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="page-title">
					<div class="col-lg-6">
									<h3>Danh Sách Thông Tin Khách Hàng</h2>
								</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div>
								
								<div style="text-align: end;">
									
								</div>
							</div>
							<div class="x_title"></div>
							<s:if test="hasActionMessages()">
								<div class="alert alert-success col-xs-12 col-sm-12 col-md-12"
									id="errorLogin">
									<s:actionmessage />
								</div>
							</s:if>
							<div class="x_title">
								<form method="post" id="frmSearch"
									action="<s:url action = "search" namespace="/web/customer"/>">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									 <div class="row">
										<div class="col-lg-6"  >
											<label class="col-sm-4 control-label"
												style="padding-top: 7px;">Mã Khách Hàng:</label>
											<div class="col-sm-7">
												<s:textfield name="customer.customerCode"
													cssClass="form-control input-sm mb12" autofocus="autofocus"></s:textfield>
											</div>
										</div>
										<div class="col-sm-6">
											<label class="col-sm-4 control-label"
												style="padding-top: 7px;">Tên Khách Hàng:</label>
											<div class="col-sm-7">
												<s:textfield name="customer.fullname"
													cssClass="form-control input-sm mb12" autofocus="autofocus"></s:textfield>
											</div>
										</div>
									</div>
									<br>
									<div class="row" >
											<div class="col-lg-6" >
											<label class="col-sm-4 control-label"
												style="padding-top: 7px;">Số giấy tờ tùy thân:</label>
											<div class="col-sm-7">
												<s:textfield name="customer.cmtnd"
													cssClass="form-control input-sm mb12" autofocus="autofocus"></s:textfield>
											</div>
										</div>
										<div class="col-lg-6">
											<label class="col-sm-4 control-label"
												style="padding-top: 7px;">Ngày tháng năm sinh:</label>
											<div class="col-sm-7">
												<s:textfield name="customer.birthday"  id="dateRange"
													cssClass="form-control input-sm mb12" autofocus="autofocus"></s:textfield>
											</div>
										</div>
									</div> 
									 <br>
									 <div class="row">
									 	<table style="float: right;">
									 		<tr>
									 			<td>
									 				<input type="submit" value="Tìm kiếm" Class="btn btn-default">
									 				<a class="btn btn-default" style="margin-right: 70px;"
												href="<s:url action="getFromAdd" namespace="/web/customer" />">Thêm
												Mới</a>
									 			</td>
									 		</tr>
									 	</table>
									</div>
									
								</form>

								<div class="clearfix"></div>
							</div>

							<div class="x_content">
								<table id="customer-table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th style="text-align: center;">STT</th>
											<th>Mã KH</th>
											<th>Tên KH</th>
											<th>Ngày Sinh</th>
											<th>Giới Tính</th>
											<th>Chức Năng</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="k" value="0"></c:set>
										<s:iterator value="customers">
											<tr>
												<td style="text-align: center;">${k=k+1}</td>
												<td><s:property value="customerCode" /></td>
												<td><s:property value="fullname" /></td>
												<td>
													<s:if test="birthday==null">
													</s:if>
													<s:else>
													<s:property value="birthday" />
													</s:else>
												</td>
												<td><s:if test="sex == 1">
														Nam
													</s:if> <s:if test="sex == 0">
														Nữ
													</s:if></td>
												<td style="text-align: center;width:260px;"><s:url
														var="show" action="show" namespace="/web/customer">
														<s:param name="code">
															<s:property value="customerCode"></s:property>
														</s:param>
													</s:url> <a href="${show}" class="btn btn-default btn-xs"> Xem
												</a> <s:url var="edit" action="getFromUpdate"
														namespace="/web/customer">
														<s:param name="editCode">
															<s:property value="customerCode"></s:property>
														</s:param>
													</s:url> <a href="${edit}" class="btn btn-default btn-xs"> Sửa
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
			<%@include file="../layout/footer.jsp"%>
			<!-- END FOOTER -->
		</div>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/moment/moment.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/moment/locale/vi.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/user/userdel.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/app.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/datatable/datatables.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#errorLogin").fadeTo(2000, 500).slideUp(5000, function() {
				$("#errorLogin").slideUp(500);
			});
			$('#dateRange').datetimepicker({
				format : 'DD/MM/YYYY',
				allowInputToggle : true,
				locale : 'vi'
			});
			$("#customer-table").dataTable({
				"searching" : false,
				"columnDefs": [ {
					"targets": [ 3 ],
					"orderable": false
				} ]
			});
			history.pushState(null, null, $("#a-kh").attr("href"));
		});
	</script>
</body>
</html>