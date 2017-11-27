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

<title>Quản lý góp phí</title>

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
<link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" />" />
<!-- Custom Theme Style -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/css/custom.min.css" />" />
<link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/dataTable.css" />" />
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
					<!-- <div class="title_left">
						<h3>Quản Lý Thông Tin Góp Phí</h3>
					</div> -->
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div>
								<div class="col-lg-6">
									<h2>Quản Lý Thông Tin Góp Phí</h2>
								</div>
								
								
							</div>
							<s:if test="hasActionMessages()">
								<div class="alert alert-success col-xs-12 col-sm-12 col-md-12"
									style="text-align: left;" id="errorLogin">
									<s:actionmessage />
								</div>
							</s:if>
							
							<%-- <div class="x_title">
								<form method="post" id="frmSearch" action="<s:url action = "search" namespace="/web/payment"/>">
									 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="row" >
										<div class="col-lg-6">
											<label class="col-sm-4 control-label"
												style="padding-top: 7px;">Mã Khách Hàng:</label>
											<div class="col-sm-7">
												<s:textfield name="payment.customerCode"
													cssClass="form-control input-sm mb12" autofocus="autofocus"></s:textfield>
											</div>
										</div>
										<div class="col-lg-6" >
											<label class="col-sm-4 control-label"
												style="padding-top: 7px;">Số HĐBH:</label>
											<div class="col-sm-7">
												<s:textfield name="payment.numberInsurrance"
													cssClass="form-control input-sm mb12" autofocus="autofocus"></s:textfield>
											</div>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-lg-6">
											<label class="col-sm-4 control-label"
												style="padding-top: 7px;">Nộp phí từ ngày:</label>
											<div class="col-sm-7">
												<s:textfield 
													name="payment.paymentStart" 
													id="start"
													class="date-search form-control input-sm mb12"
													autofocus="autofocus">
												</s:textfield>
											</div>
										</div>
										<div class="col-lg-6" >
											<label class="col-sm-4 control-label"
												style="padding-top: 7px;">Nộp phí đến ngày:</label>
											<div class="col-sm-7">
												<s:textfield 
													name="payment.paymentEnd" 
													id="end"
													class="date-search form-control input-sm mb12" 
													autofocus="autofocus">
												</s:textfield>
											</div>
										</div>
									</div>
									<br>
									<div class="row">
										<div style="float: right;">
											<s:submit value="Tìm kiếm" 
												cssClass="btn btn-default" />
										</div>
										<a class="btn btn-default">a</a>
									</div>
								</form>
								<div class="clearfix">
								<form method="post" id="frmSearch" action="<s:url action = "search" namespace="/web/payment"/>">
							</div> --%>
								<div class="x_title">
								<form method="post" id="frmSearch" class="form-horizontal form-label-left"
									action="<s:url action = "search" namespace="/web/payment"/>" style="margin-right: 145px;">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<div class="row">
										<div class="col-md-6">
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Số HĐBH</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield name="payment.numberInsurrance"
													cssClass="form-control input-sm mb12" autofocus="autofocus"></s:textfield>
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Mã KH</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield name="payment.customerCode"
													cssClass="form-control input-sm mb12" autofocus="autofocus"></s:textfield>
												</div>
											</div>
											
										</div>
										<div class="col-md-6">
											<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Nộp phí từ ngày:</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield 
													name="payment.paymentStart" 
													id="start"
													class="date-search form-control input-sm mb12"
													autofocus="autofocus">
												</s:textfield>
													</div>
												</div>
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Nộp phí đến ngày:</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield 
													name="payment.paymentEnd" 
													id="end"
													class="date-search form-control input-sm mb12" 
													autofocus="autofocus">
												</s:textfield>
												</div>
											</div>
										</div>
									</div>
									
									<table style="float: right;"> 
										<tr>
											<td>
											<input type="submit" class="btn btn-default" value="Tìm kiếm">
											<a class="btn btn-default" style="margin-right: 8px;"
												href="<s:url action="getFromAdd" namespace="/web/payment" />">Thêm
												Mới</a>
											</td>
										</tr>
									</table>
								</form>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<table id="payment-table" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th style="text-align: center;">STT</th>
											<th>Mã KH</th>
											<th>Số HĐBH</th>
											<th>Ngày Bắt Đầu Thu Phí</th>
											<th>Ngày Kết Thúc Thu Phí</th>
											<th>Số Tiền Phí Bảo Hiểm</th>
											<th>Số Tiền Hoa Hồng</th>
											<th>Ngày thu phí</th>
											<th>Chức Năng</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="k" value="0"></c:set>
										<s:iterator value="payments">
											<tr>
												<td style="text-align: center;">${k=k+1}</td>
												<td><s:property value="customerCode" /></td>
												<td><s:property value="numberInsurrance" /></td>
												<td><s:property value="paymentStart" /></td>
												<td><s:property value="paymentEnd" /></td>
												<td><s:property value="theAmountOfPremium" /></td>
												<td><s:property value="amountOfCommission" /></td>
												<td><s:if test="paymentDate==null">
													</s:if> <s:else>
														<s:property value="paymentDate"></s:property></td>
												</s:else>
												<td style="text-align: center;width:260px;"><s:url var="show"
														action="show" namespace="/web/payment">
														<s:param name="paymentId">
															<s:property value="id"></s:property>
														</s:param>
													</s:url> <a href="${show}" class="btn btn-default btn-xs"> Xem
												</a> <s:url var="edit" action="getFromUpdate"
														namespace="/web/payment">
														<s:param name="paymentId">
															<s:property value="id"></s:property>
														</s:param>
													</s:url> <a href="${edit}" class="btn btn-default btn-xs"> Sửa</a>
												</td>
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
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/moment.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/locale/vi.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/user/userdel.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/app.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/datatable/datatables.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#payment-table").dataTable({
				"searching": false
			});
			$('.date-search').datetimepicker({
		        format: 'DD/MM/YYYY',
		        allowInputToggle: true,
		        locale: 'vi'
		  		});
			$("#errorLogin").fadeTo(2000, 500).slideUp(500, function() {
				$("#errorLogin").slideUp(500);
			});
			history.pushState(null, null, $("#a-pay").attr("href"));
		});
	</script>
</body>
</html>