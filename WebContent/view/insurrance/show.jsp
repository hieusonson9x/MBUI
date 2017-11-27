<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<link tfype="text/css" rel="stylesheet"
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

<link href="<c:url value="/css/view/login/login.css"/>" rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/css/select2.min.css" />" />
<script src="<c:url value = "/resource/js/jquery.min.js" />"></script>
<script src="<c:url value = "/resource/js/jquery.validate.min.js" />"></script>
<script src="<c:url value = "/resource/js/select2.full.min.js" />"></script>
</head>
<body class="nav-md">
<c:set var = "sotienbaohiem" value = "${ insurrance.insuranceMoney}" />
<c:set var = "sotienhoahongdoMB" value = "${ insurrance.amountOfCommissionToMB}" />
<c:set var = "sotienphiBHdoMB" value = "${ insurrance.insuranceAmountToMB}" />
	<div class="container body">
		<div class="main_container">
			<!-- BEGIN HEADER -->
			<%@include file="../layout/header.jsp"%>
			<!-- END HEADER -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="page-title">
					<!-- <div class="title_left">
						<h3>Quản Lý Thông Tin Bảo Hiểm</h3>
					</div> -->
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="container">
								<h2>Xem Thông Tin Bảo Hiểm</h2>

								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#home">Thông
											Tin</a></li>
									<li><a data-toggle="tab" href="#menu3">Góp phí</a></li>
									<li><a data-toggle="tab" href="#menu4">Bồi thường</a></li>
									<li><a data-toggle="tab" href="#history">Lịch sử thay
											đổi</a></li>
								</ul>
								<div class="tab-content">
									<div id="home" class="tab-pane fade in active">
										<form id="fromAdd" style="margin-right: 145px;"
											action="<s:url action="update" namespace="/web/insurrance" />"
											class="form-horizontal form-label-left" method="post">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
											<div class="x_content">
												<div class="row">
													<div class="col-md-6">
													<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Số HĐBH<span class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																	<s:if test="insurrance.numberInsurrance==0">
															<input class="form-control" type="text"
															readonly="readonly"
															value="">
														</s:if>
														<s:else>
														<input class="form-control" type="text"
															readonly="readonly"
															value="${insurrance.numberInsurrance}">
														</s:else>
															</div>
														</div>
													</div>
													
												</div>
												<div class="row">
													<div class="col-md-6">
														<input type="hidden" name="insurrance.id"
															value="<s:property value="insurrance.id"/>">
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Loại Hình Thẩm Định<span
																class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<s:if test="insurrance.evaluationType == 1">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="Thẩm Định Tự Động">
																</s:if>
																<s:if test="insurrance.evaluationType == 2">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="Thẩm Định Thông Thường">
																</s:if>
															</div>
														</div>

														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Mã KH<span class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" placeholder="Mã KH"
																	type="text" name="insurrance.customerCode"
																	value="<s:property value="insurrance.customer.customerCode"/>"
																	readonly="readonly" />
															</div>
														</div>

														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">CMTND/HC<span
																class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" readonly="readonly"
																	type="text"
																	value="<s:property value="insurrance.customer.cmtnd"/>"
																	name="insurrance.cardId" />
															</div>
														</div>

														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Nơi Cấp</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input 
																	class="form-control" 
																	type="text"
																	readonly="readonly"
																	value="<s:property value="insurrance.customer.issuedBy"/>"
																	placeholder="Nơi Cấp" 
																	name="insurrance.issuedBy" 
																/>
															</div>
														</div>

														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="sex">Giới Tính<span
																class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<s:if test="insurrance.customer.sex==1">
																	<label class="radio-inline"> <input
																		disabled="disabled" type="radio" checked="checked"
																		value="1" name="insurrance.customer.sex">nam
																	</label>
																	<label class="radio-inline"> <input
																		disabled="disabled" type="radio" value="0"
																		name="insurrance.customer.sex">nữ
																	</label>
																</s:if>
																<s:if test="insurrance.customer.sex==0">
																	<label class="radio-inline"> <input
																		disabled="disabled" type="radio" value="1"
																		name="insurrance.customer.sex">nam
																	</label>
																	<label class="radio-inline"> <input
																		disabled="disabled" type="radio" checked="checked"
																		value="0" name="insurrance.customer.sex">nữ
																	</label>
																</s:if>
															</div>
														</div>
													</div>

													<div class="col-md-6">
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Sản Phẩm<span
																class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" type="text"
																	value="<s:property value="insurrance.product.name"/>"
																	readonly="readonly" name="insurrance.product" />
															</div>
														</div>
														
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Nhóm KH giảm phí</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" type="text"
																	value="<s:property value="insurrance.rateConfigCustomer.customerGroup"/>"
																	readonly="readonly" />
															</div>
														</div>

														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Họ và Tên KH<span
																class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" type="text"
																	readonly="readonly"
																	value="<s:property value="insurrance.customer.fullname"/>"
																	placeholder="Họ và Tên KH"
																	name="insurrance.customerName" />
															</div>
														</div>

														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Ngày Cấp</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" type="text"
																	readonly="readonly"
																	value="<s:property value="insurrance.customer.dateRange"/>"
																	name="insurrance.dateRange"
																	id="dateRange" />
															</div>
														</div>
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Ngày Sinh<span
																class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" type="text"
																	readonly="readonly"
																	value="<s:property value="insurrance.customer.birthday"/>"
																	placeholder="dd/mm/yyyy" name="insurrance.birthday"
																	id="birthday" />
															</div>
														</div>
													</div>
												</div>

												<br>
												<div class="row">
													<div class="col-md-6">
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Mã RM</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" placeholder=""
																	readonly="readonly"
																	value="<s:property value="insurrance.rmCode"/>"
																	type="text" name="insurrance.rmCode" />
															</div>
														</div>

														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Email RM</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" readonly="readonly"
																	value="<s:property value="insurrance.rmEmail"/>"
																	type="text" name="insurrance.rmEmail" />
															</div>
														</div>
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Số điện thoại</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" readonly="readonly"
																	value="<s:property value="insurrance.rmPhone"/>"
																	type="text" name="insurrance.rmPhone" />
															</div>
														</div>
													</div>

													<div class="col-md-6">
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Họ và Tên RM</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" type="text"
																	value="<s:property value="insurrance.rmName"/>"
																	readonly="readonly" name="insurrance.rmName" />
															</div>
														</div>

														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Mã Chi Nhánh<span
																class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" type="text"
																	value="<s:property value="insurrance.agency.code"/>"
																	readonly="readonly" name="insurrance.branchCode" />
															</div>
														</div>
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Tên Chi Nhánh</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" type="text"
																	value="<s:property value="insurrance.agency.name"/>"
																	readonly="readonly"  />
															</div>
														</div>
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-6">
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Số Tiền Bảo Hiểm<span
																class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" readonly="readonly"
																	value="<fmt:formatNumber type = "number" 
         															maxFractionDigits = "3" value = "${sotienbaohiem}" />"
																	type="text" name="insurrance.insuranceMoney" id="insuranceMoney"  />
															</div>
															
														</div>

														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Hình Thức Đóng phí<span
																class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<s:if test="insurrance.FormOfPayment == 1">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly"
																		value="Đóng phí một lần bằng tiền mặt">
																</s:if>
																<s:if test="insurrance.FormOfPayment == 2">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly"
																		value="Đóng phí một lần gộp cùng khoản vay">
																</s:if>
																<s:if test="insurrance.FormOfPayment == 3">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly"
																		value="Đóng phí định kỳ theo kỳ thu lãi khoản vay">
																</s:if>
															</div>
														</div>
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Thời hạn bảo hiểm(tháng)<span
																class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control"
																	value="<s:property value="insurrance.durationOfInsurance"/>"
																	readonly="readonly" type="text"
																	name="insurrance.durationOfInsurance" />
															</div>
														</div>
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Mã khoản vay</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" readonly="readonly"
																	value="<s:property value="insurrance.contractNumber"/>"
																	type="text" name="insurrance.contractNumber" />
															</div>
														</div>
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Tỷ Lệ % Phí BH<span
																class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" readonly="readonly"
																	value="<s:property value="insurrance.coverageRate"/>"
																	type="text" name="insurrance.coverageRate" />
															</div>
														</div>
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Tỷ lệ tăng phí</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<s:if test="insurrance.rateIncrease==0">
																	<input class="form-control" readonly="readonly"
																	type="text" name="insurrance.rateIncrease" />
																</s:if>
																<s:else>
																<input class="form-control" readonly="readonly"
																	type="text" name="insurrance.rateIncrease" 
																	value="<s:property value="insurrance.rateIncrease"/>"/>
																</s:else>
																
															</div>
														</div>
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Số Tiền hoa hồng do MB tính</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<s:if test="insurrance.amountOfCommissionToMB==0">
																	<input class="form-control" type="text" readonly="readonly" >
																</s:if>
																<s:else>
																	<input class="form-control"
																	value="<fmt:formatNumber type = "number" 
         															maxFractionDigits = "3" value = "${sotienhoahongdoMB}" />"
																	readonly="readonly" type="text"
																	name="insurrance.amountOfCommissionToMB"  />
																</s:else>
																
															</div>
														</div>
													</div>

													<div class="col-md-6">
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Thời hạn khoản vay(tháng)<span
																class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" type="text"
																	readonly="readonly"
																	value="<s:property value="insurrance.loanTerm"/>"
																	name="insurrance.loanTerm" />
															</div>
														</div>

														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Ngày hiệu lực BH<span
																class={required:true}>*</span></label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<s:if test="insurrance.effectiveDate==null">
																	<input class="form-control" type="text"
																		readonly="readonly" id="effectiveDate"
																		name="insurrance.effectiveDate" />
																</s:if>
																<s:else>
																	<input class="form-control" type="text"
																		readonly="readonly" id="effectiveDate"
																		value="<s:property value="insurrance.effectiveDate"/>"
																		name="insurrance.effectiveDate" />
																</s:else>

															</div>
														</div>
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Trạng thái đóng phí</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<s:if test="insurrance.statusFee == 1">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="None">
																</s:if>
																<s:if test="insurrance.statusFee == 5">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="Đến hạn nộp phí">
																</s:if>
																<s:if test="insurrance.statusFee == 2">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="Đã đóng phí">
																</s:if>
																<s:if test="insurrance.statusFee == 3">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="Nợ phí">
																</s:if>
																<s:if test="insurrance.statusFee == 4">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="Quá hạn phí">
																</s:if>

															</div>
														</div>
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Ngày giải ngân</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<s:if test="insurrance.disbursementDate==null">
																	<input class="form-control" type="text"
																		readonly="readonly" id="disbursementDate"
																		name="insurrance.disbursementDate" />
																</s:if>
																<s:else>
																	<input class="form-control" type="text"
																		readonly="readonly" id="disbursementDate"
																		value="<s:property value="insurrance.disbursementDate"/>"
																		name="insurrance.disbursementDate" />
																</s:else>

															</div>
														</div>

														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Số tiền phí BH do MB tính</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<s:if test="insurrance.insuranceAmountToMB==0">
																	<input class="form-control" type="text" readonly="readonly" >
																</s:if>
																<s:else>
																	<input class="form-control" type="text"
																		readonly="readonly"
																		value="<fmt:formatNumber type = "number" 
	         															maxFractionDigits = "3" value = "${sotienphiBHdoMB}" />"
																		name="insurrance.insuranceAmountToMB"  />
																</s:else>
																
															</div>
														</div>
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Trạng thái hợp đồng</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<s:if test="insurrance.statusContract==1">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="Đang hiệu lực">
																</s:if>
																<s:if test="insurrance.statusContract==2">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="Xử lý">
																</s:if>
																<s:if test="insurrance.statusContract==3">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="Đang chờ xử lý">
																</s:if>
																<s:if test="insurrance.statusContract==4">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="Từ chối">
																</s:if>
																<s:if test="insurrance.statusContract==5">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="Tạm hoãn">
																</s:if>
																<s:if test="insurrance.statusContract==6">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="Chấm dứt">
																</s:if>
																<s:if test="insurrance.statusContract==7">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="Đợi duyệt">
																</s:if>
																<s:if test="insurrance.statusContract==8">
																	<input class="form-control col-md-7 col-xs-12"
																		readonly="readonly" value="Chấm dứt">
																</s:if>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
										<div class="col-md-6">
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Định kì đóng phí</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:if test="insurrance.paymentFrequency==1">
														<input class="form-control col-md-7 col-xs-12"
																readonly="readonly" value="Tháng">
													</s:if>
													<s:if test="insurrance.paymentFrequency==2">
														<input class="form-control col-md-7 col-xs-12"
																readonly="readonly" value="Quý">
													</s:if>
													<s:if test="insurrance.paymentFrequency==3">
														<input class="form-control col-md-7 col-xs-12"
																readonly="readonly" value="Nửa năm">
													</s:if>
													<s:if test="insurrance.paymentFrequency==4">
														<input class="form-control col-md-7 col-xs-12"
																readonly="readonly" value="Năm">
													</s:if>
												</div>
											</div>
										</div>
										<div class="col-md-6">
										<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Ngày dự định thu phí đầu tiên</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input class="form-control" readonly="readonly"
													value="<s:property value="insurrance.feePriodDate" />">
												</div>
											</div>
										</div>
									</div>
												<div class="row">
													<div class="col-md-6">
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Ghi chú</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" type="text"
																	readonly="readonly"
																	value="<s:property value="insurrance.note" />"
																	name="insurrance.note" />
															</div>
														</div>
													</div>
													<div class="col-md-6">
														<div class="item form-group">
															<label class="control-label col-md-6 col-sm-6 col-xs-12"
																for="firstName">Số dư nợ hiện tại</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input class="form-control" type="text"
																	readonly="readonly"
																	
																	value="<fmt:formatNumber type = "number" 
         															maxFractionDigits = "3" value = "${insurrance.amountPaid}" />"
																	 />
															</div>
														</div>
													</div>
												</div>
											</div>
										</form>
									</div>
									<div id="menu3" class="tab-pane fade">
										<table class="table table-striped table-bordered">
											<thead>
												<tr>
													<th style="text-align: center;">STT</th>
													<th>Ngày Bắt Đầu Thu Phí</th>
													<th>Thời gian thu phí từ ngày</th>
													<th>Ngày Kết Thúc Thu Phí</th>
													<th>Số tiền phí đã nộp</th>
													<!-- <th>Thời gian nợ phí từ ngày</th>
													<th>Thời gian nợ phí đến ngày</th> -->
													<th>Dư nợ hiện tại</th>
													<!-- <th>Trạng Thái Nộp Phí</th> -->
												</tr>
											</thead>
											<tbody>
												<c:set var="k" value="0"></c:set>
												<s:iterator value="payments">
													<tr>
														<td style="text-align: center;">${k=k+1}</td>
														<td><s:property value="paymentStart" /></td>
														<td><s:property value="paymentStart" /></td>
														<td><s:property value="paymentEnd" /></td>
														<td><s:property value="theAmountOfPremium" /></td>
														<%-- <td><s:property value="" /></td>
														<td><s:property value="" /></td> --%>
														<td><s:property value="outstandingBalance" /></td>
														<%-- <td><s:property value="" /></td> --%>
													</tr>
												</s:iterator>
											</tbody>
										</table>
									</div>
									<div id="menu4" class="tab-pane fade">
										<table class="table table-striped table-bordered">
											<thead>
												<tr>
													<th style="text-align: center;">STT</th>
													<th>Ngày xảy ra sự kiện</th>
													<th>loại sự kiện</th>
													<th>Trạng Thái bồi thường</th>
												</tr>
											</thead>
											<tbody>
												<c:set var="k" value="0"></c:set>
												<s:iterator value="compensations">
													<tr>
														<td style="text-align: center;">${k=k+1}</td>
														<td><s:property value="eventDate" /></td>
														<td><s:if test="eventType==1">
																Tử vong
															</s:if> <s:if test="eventType==2">
																Thương tật toàn bộ vĩnh viễn 
															</s:if>
														<td><s:if test="statusCompensation==1">
																Quá trình yêu cầu bồi thường
															</s:if> <s:if test="statusCompensation==2">
																Chấp nhận Đơn
															</s:if> <s:if test="statusCompensation==3">
																Từ chối bồi thường
															</s:if></td>
													</tr>
												</s:iterator>
											</tbody>
										</table>
									</div>
									<div id="history" class="tab-pane fade">
										<table class="table table-striped table-bordered">
											<thead>
												<tr>
													<th style="text-align: center;">STT</th>
													<th>Người thay đổi</th>
													<th>Ngày thay đổi</th>
													<th>Trước thay đổi</th>
													<th>Sau Thay đổi</th>
												</tr>
											</thead>
											<tbody>
												<c:set var="k" value="0"></c:set>
												<s:iterator value="insurranceLogs">
													<tr>
														<td style="text-align: center;">${k=k+1}</td>
														<td><s:property value="createdBy" /></td>
														<td><s:property value="createdAt" /></td>
														<td>
															Số CMT :<s:property value="oldCard" /><br>
															Tên KH :<s:property value="oldName" /><br>
															giới tính :
															<s:if test="oldSex==1">
																Nam <br>
															</s:if>
															<s:else>
																Nữ <br>
															</s:else>
															Ngày cấp :<s:property value="oldDateRange" /><br>
															Ngày sinh :<s:date name="oldBirthday" format="dd/MM/yyyy"/><br>
															Nơi cấp :<s:property value="oldIssuedBy" /><br>
															Hình thức đóng phí :
															<s:if test="oldFormOfPayment==1">
																Đóng phí một lần bằng tiền mặt<br>
															</s:if>
															<s:if test="oldFormOfPayment==2">
																Đóng phí một lần gộp cùng khoản vay<br>
															</s:if>
															<s:if test="oldFormOfPayment==3">
																Đóng phí định kỳ theo kỳ thu lãi khoản vay<br>
															</s:if>
															người thụ hưởng :<s:property value="oldBeneficiaries" /><br>
															Ghi chú :<s:property value="oldNote" /><br>
														</td>
														<td>
															Số CMT :<s:property value="newCard" /><br>
															Tên KH :<s:property value="newName" /><br>
															giới tính :
															<s:if test="newSex==1">
																Nam <br>
															</s:if>
															<s:else>
																Nữ <br>
															</s:else>
															Ngày cấp :<s:property value="newDateRange" /><br>
															Ngày sinh :<s:date name="newBirthday" format="dd/MM/yyyy"/><br>
															Nơi cấp :<s:property value="newIssuedBy" /><br>
															Hình thức đóng phí :
															<s:if test="newFormOfPayment==1">
																Đóng phí một lần bằng tiền mặt<br>
															</s:if>
															<s:if test="newFormOfPayment==2">
																Đóng phí một lần gộp cùng khoản vay<br>
															</s:if>
															<s:if test="newFormOfPayment==3">
																Đóng phí định kỳ theo kỳ thu lãi khoản vay<br>
															</s:if>
															người thụ hưởng :<s:property value="newBeneficiaries" /><br>
															Ghi chú :<s:property value="newNote" /><br>
														</td>
													</tr>
												</s:iterator>
											</tbody>
										</table>
									</div>
								</div>
								<div style="text-align: center;">
									<a class="btn btn-default"
										href="<s:url action='i1list' namespace='/web/insurrance'/>">
										<i class="fa fa-times" aria-hidden="true"></i> Đóng
									</a>
								</div>
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
		src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/user/add.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/app.js"></script>
	<%-- 	<script type="text/javascript">
	$(document).ready(function(){
	    $("input[data-type='number']").keyup(function(event){
	      // skip for arrow keys
	      if(event.which >= 37 && event.which <= 40){
	          event.preventDefault();
	      }
	      var $this = $(this);
	      var num = $this.val().replace(/,/gi, "");
	      var num2 = num.split(/(?=(?:\d{3})+$)/).join(",");
	      console.log(num2);
	      // the following line has been simplified. Revision history contains original.
	      $this.val(num2);
	  });
	});
	</script>
</body> --%>

</html>