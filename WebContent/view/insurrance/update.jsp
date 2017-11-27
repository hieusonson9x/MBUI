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

<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/font-awesome/css/font-awesome.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" />" />
<!-- Custom Theme Style -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/css/custom.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/css/view/product/product.css" />" />
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
						<h3>Quản Lý Thông Tin Hợp Đồng Bảo Hiểm</h3>
					</div> -->

				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="container">
								<h2>Sửa Thông Tin Hợp Đồng Bảo Hiểm</h2>
								<s:if test="hasActionMessages()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
										style="text-align: center;" id="errorLogin">
										<s:actionmessage />
									</div>
								</s:if>
								<form id="fromAdd" style="margin-right: 145px;"
									action="<s:url action="i1update" namespace="/web/insurrance" />"
									class="form-horizontal form-label-left" method="post">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<div class="x_content">
										<div class="row">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Số HĐBH<span class={required :true}>*</span></label>
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
														for="firstName">CMTND/HC<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" placeholder="CMTND/HC"
															type="text"
															value="<s:property value="insurrance.customer.cmtnd"/>"
															name="insurrance.cardId" />
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Nơi Cấp</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"
															value="<s:property value="insurrance.customer.issuedBy"/>"
															placeholder="Nơi Cấp" name="insurrance.issuedBy" />
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="sex">Giới Tính<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:if test="insurrance.customer.sex==1">
															<label class="radio-inline"> <input type="radio"
																checked="checked" value="1" name="insurrance.sex">nam
															</label>
															<label class="radio-inline"> <input type="radio"
																value="0" name="insurrance.sex">nữ
															</label>
														</s:if>
														<s:if test="insurrance.customer.sex==0">
															<label class="radio-inline"> <input type="radio"
																value="1" name="insurrance.sex">nam
															</label>
															<label class="radio-inline"> <input type="radio"
																checked="checked" value="0" name="insurrance.sex">nữ
															</label>
														</s:if>
													</div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Sản Phẩm<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"
															value="<s:property value="insurrance.product.name"/>"
															readonly="readonly"  />
														<input type="hidden" name="insurrance.product" value="<s:property value="insurrance.product.code"/>">
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
												<%-- <div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Nhóm tiền giảm phí</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
													<input class="form-control" type="text"
														value="<s:property value="insurrance.rateConfigMoney.minMoney"/>"
															readonly="readonly" name="insurrance.product" />
													</div>
												</div> --%>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Họ và Tên KH<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"
															value="<s:property value="insurrance.customer.fullname"/>"
															placeholder="Họ và Tên KH" name="insurrance.customerName" id="customerName" />
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày Cấp</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"
															value="<s:property value="insurrance.customer.dateRange"/>"
															placeholder="dd/mm/yyyy" name="insurrance.dateRange"
															id="dateRange" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày Sinh<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"
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
														<input class="form-control" placeholder="Mã RM"
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
															readonly="readonly" name="insurrance.agency" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Tên Chi Nhánh</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"
															value="<s:property value="insurrance.agency.name"/>"
															readonly="readonly" name="insurrance.agencyName" />
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
															type="text" name="insurrance.insuranceMoney" />
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Hình Thức Đóng phí<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<%-- <select class="form-control col-md-7 col-xs-12" 
															name="insurrance.FormOfPayment">
															<option value="1">Đóng phí một lần bằng tiền mặt</option>
															<option value="2">Đóng phí một lần gộp cùng khoản vay</option>
															<option value="3">Đóng phí định kỳ theo kỳ thu lãi khoản vay</option>
														</select> --%>
														<s:select name="insurrance.FormOfPayment"
															class="form-control col-md-7 col-xs-12"
															list="#{'1':'Đóng phí một lần bằng tiền mặt',
															 '2':'Đóng phí một lần gộp cùng khoản vay',
															 '3':'Đóng phí định kỳ theo kỳ thu lãi khoản vay'}">
														</s:select>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Thời hạn bảo hiểm (tháng)<span
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
															value="<s:property value="insurrance.rateIncrease"/>"
															type="text" name="insurrance.rateIncrease" />
														</s:else>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Số Tiền hoa hồng do MB tính</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control"
															value="<fmt:formatNumber type = "number" 
         															maxFractionDigits = "3" value = "${sotienhoahongdoMB}" />"
															readonly="readonly" type="text"
															name="insurrance.amountOfCommissionToMB" />
													</div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Thời hạn khoản vay (tháng)<span
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
														<input class="form-control" type="text"
															readonly="readonly" id="effectiveDate"
															value="<s:property value="insurrance.effectiveDate"/>"
															name="insurrance.effectiveDate" />
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
														<s:if test="insurrance.statusFee == 5">
															<input class="form-control col-md-7 col-xs-12"
																readonly="readonly" value="Đến hạn nộp phí">
														</s:if>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày giải ngân</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"
															readonly="readonly" id="disbursementDate"
															placeholder="dd/mm/yyyy"
															value="<s:property value="insurrance.disbursementDate"/>"
															name="insurrance.disbursementDate" />
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Số tiền phí BH do MB tính</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"
															readonly="readonly"
															value="<fmt:formatNumber type = "number" 
         															maxFractionDigits = "3" value = "${sotienphiBHdoMB}" />"
															name="insurrance.insuranceAmountToMB" />
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
													</div>
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
													for="firstName">Số dư nợ hiện tại</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input class="form-control" type="text" readonly="readonly"
														value="<s:property value="insurrance.amountPaid" />" />
												</div>
											</div>
											
											<div class="item form-group">
											<label class="control-label col-md-6 col-sm-6 col-xs-12"
												for="firstName">Người hưởng thụ</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input class="form-control" type="text"
													placeholder="Người hưởng thụ"
													value="<s:property value="insurrance.beneficiaries" />"
													name="insurrance.beneficiaries" />
											</div>
										</div>
										</div>
										
										<div class="col-md-6">
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Ghi chú</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input class="form-control" type="text"
														placeholder="Ghi chú"
														value="<s:property value="insurrance.note" />"
														name="insurrance.note" />
												</div>
											</div>
										</div>
									</div>
									<div class="form-group" style="margin-left: 346px;">
										<div class="col-md-6 col-md-offset-3">
											<a class="btn btn-default"
												href="<s:url action='i1list' namespace='/web/insurrance'/>">
												<i class="fa fa-times" aria-hidden="true"></i> Đóng
											</a>
											<button id="btn-add-user" type="submit"
												class="btn btn-default">Lưu</button>
										</div>
									</div>
								</form>
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

	<script src="<c:url value = "/resource/js/jquery.min.js" />"></script>
	<script src="<c:url value = "/resource/js/jquery.validate.min.js" />"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/moment/moment.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/moment/locale/vi.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#errorLogin").fadeTo(2000, 500).slideUp(500, function() {
				$("#errorLogin").slideUp(500);
			});
			$('#dateRange').datetimepicker({
				format : 'DD/MM/YYYY',
				allowInputToggle : true,
				locale : 'vi'
			});
			$('#birthday').datetimepicker({
				format : 'DD/MM/YYYY',
				allowInputToggle : true,
				locale : 'vi'
			});
			$('#effectiveDate').datetimepicker({
				format : 'DD/MM/YYYY',
				allowInputToggle : true,
				locale : 'vi'
			});
			$('#disbursementDate').datetimepicker({
				format : 'DD/MM/YYYY',
				allowInputToggle : true,
				locale : 'vi'
			});
			
			/*  var e = $('#evaluationType');
			$('#evaluationType').click(function() {
				var strUser = e.options[e.selectedIndex].value;
				console.log(strUser);
			}); */
			var evaluationType = 0;
			$('#evaluationType').change(function() {
				evaluationType = $(this).val();
				console.log(evaluationType);
				if (evaluationType == 2) {
					$('#statusContract').val(7);
				}
			});

			$.validator.addMethod("CODE", function(value, element) {
				return this.optional(element) || /^[a-z0-9\_]+$/i.test(value);
			}, "Không được nhập các kí tự đặc biệt");
			var validator = $("#fromAdd").validate({
				rules : {
					"insurrance.evaluationType" : {
						required : true
					},
					"insurrance.note" : {
						maxlength : 500
					},
					"insurrance.customerCode" : {
						required : true,
						CODE : "required CODE",
						maxlength : 20
					},
					"insurrance.product" : {
						required : true
					},
					"insurrance.customerName" : {
						required : true,
						maxlength : 200,
						
					},
					"insurrance.cardId" : {
						required : true,
						maxlength : 20
					},
					"insurrance.issuedBy" : {
						maxlength : 200
					},
					"insurrance.birthday" : {
						required : true
					},
					"insurrance.sex" : {
						required : true
					},
					"insurrance.rmCode" : {
						CODE : "required CODE",
						maxlength : 20
					},
					"insurrance.rmName" : {
						maxlength : 200
					},
					"insurrance.rmEmail" : {
						email : true,
						maxlength : 100
					},
					"insurrance.agency" : {
						required : true,
						maxlength : 10
					},
					"insurrance.insuranceMoney" : {
						required : true,
						maxlength : 50
					},
					"insurrance.loanTerm" : {
						required : true,
						maxlength : 10
					},
					"insurrance.durationOfInsurance" : {
						required : true,
						number : true,
						maxlength : 10
					},
					"insurrance.effectiveDate" : {
						required : true
					},
					"insurrance.FormOfPayment" : {
						required : true,
						number : true
					},
					"insurrance.statusFee" : {
						required : true
					},
					"insurrance.contractNumber" : {
						maxlength : 20
					},
					"insurrance.coverageRate" : {
						required : true,
						maxlength : 20
					},
					"insurrance.insuranceAmountToMB" : {
						maxlength : 50
					},
					"insurrance.amountOfCommissionToMB" : {
						maxlength : 50
					},
					"insurrance.statusContract" : {
						required : true
					},
					"insurrance.rmPhone" : {
						number : true
					},
					"insurrance.rateIncrease": {
						number : true
					}
				},
				errorPlacement : function(label, element) {
					label.addClass('errorMsq');
					element.parent().append(label);
				},
				messages : {
					"insurrance.note" : {
						maxlength : "Trường phải nhỏ hơn 500 kí tự"
					},

					"insurrance.evaluationType" : {
						required : "Trường này không được để trống",
					},
					"insurrance.customerCode" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 20 kí tự"
					},
					"insurrance.product" : {
						required : "Trường này không được để trống",

					},
					"insurrance.customerName" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 200 kí tự"
							
					},
					"insurrance.cardId" : {
						required : "Trường này không được để trống",
						maxlength : "Số phải nhỏ hơn 20 kí tự"
					},
					"insurrance.issuedBy" : {
						maxlength : "Số phải nhỏ hơn 200 kí tự"
					},
					"insurrance.birthday" : {
						required : "Trường này không được để trống"
					},
					"insurrance.sex" : {
						required : "Trường này không được để trống",
					},
					"insurrance.rmCode" : {
						maxlength : "Trường phải nhỏ hơn 20 kí tự"
					},
					"insurrance.rmName" : {
						maxlength : "Trường phải nhỏ hơn 200 kí tự"
					},
					"insurrance.rmEmail" : {
						maxlength : "Trường phải nhỏ hơn 100 kí tự",
						email : "Sai định dạng"
					},
					"insurrance.agency" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 10 kí tự",
					},
					"insurrance.insuranceMoney" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 50 kí tự",
						
					},
					"insurrance.loanTerm" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 10 kí tự"
					},
					"insurrance.durationOfInsurance" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 10 kí tự",
						number : "Phải nhập số"
					},
					"insurrance.effectiveDate" : {
						required : "Trường này không được để trống",

					},
					"insurrance.FormOfPayment" : {
						required : "Trường này không được để trống",
						number : "Phải nhập số"
					},
					"insurrance.statusFee" : {
						required : "Trường này không được để trống",
					},
					"insurrance.contractNumber" : {
						maxlength : "Trường phải nhỏ hơn 20 kí tự",
					},
					"insurrance.coverageRate" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 20 kí tự",
					},
					"insurrance.insuranceAmountToMB" : {
						maxlength : "Trường phải nhỏ hơn 50 kí tự",
						
					},
					"insurrance.amountOfCommissionToMB" : {
						maxlength : "Trường phải nhỏ hơn 50 kí tự",
						
					},
					"insurrance.statusContract" : {
						required : "Trường này không được để trống",
					},
					"insurrance.rmPhone" : {
						number : "Phải nhập số"
					},
					"insurrance.rateIncrease": {
						number : "Phải nhập số"
					}

				}
			});

		});
		
	</script>
</body>
</html>