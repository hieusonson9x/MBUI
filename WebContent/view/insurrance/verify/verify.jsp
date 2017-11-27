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
	<div class="container body">
		<div class="main_container">
			<!-- BEGIN HEADER -->
			<%@include file="/view/layout/header.jsp"%>
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
								<h2>Thẩm Định Thông Tin Hợp Đồng Bảo Hiểm</h2>
								<s:if test="hasActionMessages()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
										style="text-align: center;" id="errorLogin">
										<s:actionmessage />
									</div>
								</s:if>
								<form id="fromAdd" style="margin-right: 145px;"
									action="<s:url action="i3verifyContract" namespace="/web/insurrance" />"
									class="form-horizontal form-label-left" method="post">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
										
									<s:hidden name="insurrance.productId" id="productId"></s:hidden>
									<div class="x_content">
										<input type="hidden" name="insurrance.id"
											value="<s:property value="insurrance.id"/>"> 
										<div class="row">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Số HĐBH<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
													<s:if test="insurrance.numberInsurrance==0">
													<input class="form-control" type="text"
															readonly="readonly" />
													</s:if>
													<s:else>
													<input class="form-control" type="text"
														value="<s:property value="insurrance.numberInsurrance"/>"
															readonly="readonly" />
													</s:else>
														
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Loại Hình Thẩm Định<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:if test="insurrance.evaluationType == 1">
															<input class="form-control col-md-7 col-xs-12"
																readonly="readonly" value="Thẩm Định Tự Động" />
														</s:if>
														<s:if test="insurrance.evaluationType == 2">
															<input class="form-control col-md-7 col-xs-12"
																readonly="readonly" value="Thẩm Định Thông Thường" />
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
												 		<input type="hidden" id="rateProduct" value="<s:property value="insurrance.productRate"/>">
														<input class="form-control" type="text"
															value="<s:property value="insurrance.product"/>"
															readonly="readonly" name="insurrance.product" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Nhóm KH giảm phí</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="hidden" id="groupCustomer" value="<s:property value="insurrance.customeRate"/>">
														<s:select class="form-control"
															name="insurrance.groupCustomer" list="groups"
															emptyOption="1" listValue="customerGroup" listKey="id" />
													</div>
												</div>
												
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Họ và Tên KH<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"
															value="<s:property value="insurrance.customerName"/>"
															readonly="readonly" name="insurrance.customerName" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">CMTND/HC<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" readonly="readonly"
															type="text" 
															value="<s:property value="insurrance.cardId"/>"
															name="insurrance.cardId" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Mã KH<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" placeholder="Mã KH"
															type="text" name="insurrance.customerCode"
															value="<s:property value="insurrance.customerCode"/>"
															readonly="readonly" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày Cấp</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"
															value="<s:property value="insurrance.dateRange"/>"
															readonly="readonly" name="insurrance.dateRange"
															id="dateRange" />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày Sinh<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"
															value="<s:property value="insurrance.birthday"/>"
															readonly="readonly" name="insurrance.birthday"
															id="birthday" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="sex">Giới Tính<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:if test="insurrance.sex==1">
															<label class="radio-inline"> <input
																disabled="disabled" type="radio" checked="checked"
																value="1" name="insurrance.sex">nam
															</label>
															<label class="radio-inline"> <input
																disabled="disabled" type="radio" value="0"
																name="insurrance.sex">nữ
															</label>
														</s:if>
														<s:if test="insurrance.sex==0">
															<label class="radio-inline"> <input
																disabled="disabled" type="radio" value="1"
																name="insurrance.sex">nam
															</label>
															<label class="radio-inline"> <input
																disabled="disabled" type="radio" checked="checked"
																value="0" name="insurrance.sex">nữ
															</label>
														</s:if>
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
														for="firstName">Số Tiền Bảo Hiểm<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="hidden" id="money" value="<s:property value="insurrance.moneyRate"/>">
														<input 
															class="form-control"
															value="<s:property value="insurrance.insuranceMoney"/>"
															type="text" 
															name="insurrance.insuranceMoney" 
															data-type="number"
															id="insurranceMoney"
														/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Thời hạn bảo hiểm(tháng)<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control"
															value="<s:property value="insurrance.durationOfInsurance"/>"
															type="text" name="insurrance.durationOfInsurance" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Thời hạn khoản vay(tháng)<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control"
															value="<s:property value="insurrance.loanTerm"/>"
															type="text" name="insurrance.loanTerm" />
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Hình Thức Đóng phí<span
														class={required :true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="insurrance.FormOfPayment">
															<option value="1">Đóng phí một lần bằng tiền mặt</option>
															<option value="2">Đóng phí một lần gộp cùng
																khoản</option>
															<option value="3">Đóng phí định kỳ theo kỳ thu
																lãi</option>
														</select> --%>
														<s:select name="insurrance.FormOfPayment" class="form-control col-md-7 col-xs-12" 
															list="#{'1':'Đóng phí một lần bằng tiền mặt',
															 '2':'Đóng phí một lần gộp cùng khoản vay',
															 '3':'Đóng phí định kỳ theo kỳ thu lãi khoản vay'}">
														</s:select>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Tỷ Lệ % Phí BH<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control"
															value="<s:property value="insurrance.coverageRate"/>"
															type="text" name="insurrance.coverageRate" />
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Tỷ lệ tăng phí</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:if test="insurrance.rateIncrease==0">
															<s:textfield class="form-control" id="rateIncrease11"
																type="text" value=""
																name="insurrance.rateIncrease" />
														</s:if>
														<s:else>
															<s:textfield class="form-control" id="rateIncrease11"
															placeholder="Tỷ Lệ tăng phí" type="text"
															name="insurrance.rateIncrease" />
														</s:else>
														
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Nơi Cấp</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input 
															class="form-control" 
															type="text"
															value="<s:property value="insurrance.issuedBy"/>"
															readonly="readonly" 
															name="insurrance.issuedBy" 
														/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Mã RM</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" 
															readonly="readonly"
															value="<s:property value="insurrance.rmCode"/>"
															type="text" name="insurrance.rmCode" />
													</div>
												</div>
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
														for="firstName">Số điện thoại</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" readonly="readonly"
															value="<s:property value="insurrance.rmPhone"/>"
															type="text" name="insurrance.rmPhone" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Mã Chi Nhánh</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text" readonly="readonly"
															value="<s:property value="insurrance.agency"/>"
															name="insurrance.agency" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Tên Chi Nhánh</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"
															value="<s:property value="insurrance.agencyName"/>"
															readonly="readonly" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày hiệu lực BH<span
														class={required :true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text" name="insurrance.effectiveDate"
															value="<s:property value="insurrance.effectiveDate"/>"
															 id="effectiveDate"/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Trạng thái đóng phí</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:select name="insurrance.statusFee" disabled="true"
														class="form-control col-md-7 col-xs-12" 
															list="#{'1':'None',
															 '2':'Đã đóng phí',
															 '3' : 'Nợ phí',
															 '4' : 'Quá hạn phí',
															 '5' : 'Đến hạn nộp phí'}">
														</s:select>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Mã khoản vay</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control"
															value="<s:property value="insurrance.contractNumber"/>"
															type="text" name="insurrance.contractNumber" />
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày giải ngân</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"
															id="disbursementDate"
															value="<s:property value="insurrance.disbursementDate"/>"
															name="insurrance.disbursementDate" />
													</div>
												</div>

											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Số tiền phí BH do MB tính</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"
															value="<s:property value="insurrance.insuranceAmountToMB"/>"
															name="insurrance.insuranceAmountToMB" />
													</div>
												</div>
												

												
											</div>
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Số Tiền hoa hồng do MB tính</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control"
															value="<s:property value="insurrance.amountOfCommissionToMB"/>"
															type="text" name="insurrance.amountOfCommissionToMB" />
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
													<s:select name="insurrance.PaymentFrequency"
															class="form-control col-md-7 col-xs-12"
															list="#{'1':'Tháng',
															 '2':'Quý',
															 '3' : 'Nửa năm',
															 '4':'Năm'}">
														</s:select>
												</div>
											</div>
										</div>
										<div class="col-md-6">
										<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Ngày dự định thu phí đầu tiên</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input class="form-control" type="text" id="feePriodDate"
														value="<s:property value="insurrance.feePriodDate"/>" name="insurrance.feePriodDate" />
												</div>
											</div>
										</div>
									</div>
										<div class="row">
											<div class="item form-group" >
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="firstName">Trạng thái hợp đồng</label>
													<div class="col-md-6 col-sm-6 col-xs-12" style="min-width: 450px;">
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="insurrance.statusContract">
															<option value="">-----NO-----</option>
															<option value="1">Đang hoạt động</option>
															<option value="2">Xử lý</option>
															<option value="3">Đang chờ xử lý</option>
															<option value="4">Từ chối</option>
															<option value="5">hoãn lại</option>
														</select> --%>
														<s:if test="insurrance.statusContract==7 || insurrance.statusContract==2">
															<label class="radio-inline"> <input type="radio" checked="checked"
																value="2" name="insurrance.statusContract">Xử lý
															</label>
															<label class="radio-inline"> <input type="radio"
																value="1" name="insurrance.statusContract">Đang hiệu lực
															</label>
															<label class="radio-inline"> <input type="radio" id="pending"
																value="3" name="insurrance.statusContract"> Chờ xử lý
															</label>
															<label class="radio-inline"> <input type="radio"
																value="5" name="insurrance.statusContract">Tạm hoãn
															</label>
															<label class="radio-inline"> <input type="radio"
																value="4" name="insurrance.statusContract">Từ chối
															</label>
														</s:if>
														<s:if test="insurrance.statusContract==4">
														<label class="radio-inline"> <input type="radio" checked="checked"
																value="2" name="insurrance.statusContract">Xử lý
															</label>
															<label class="radio-inline"> <input type="radio"
																value="1" name="insurrance.statusContract">Đang hiệu lực
															</label>
															<label class="radio-inline"> <input type="radio" id="pending"
																value="3" name="insurrance.statusContract">Chờ xử lý
															</label>
															<label class="radio-inline"> <input type="radio"
																value="5" name="insurrance.statusContract">Tạm hoãn
															</label>
															<label class="radio-inline"> <input type="radio" checked="checked"
																value="4" name="insurrance.statusContract">Từ chối
															</label>
														</s:if>
														<s:if test="insurrance.statusContract==3">
														<label class="radio-inline"> <input type="radio" 
																value="2" name="insurrance.statusContract">Xử lý
															</label>
															<label class="radio-inline"> <input type="radio"
																value="1" name="insurrance.statusContract">Đang hiệu lực
															</label>
															<label class="radio-inline"> <input type="radio" id="pending"  checked="checked"
																value="3" name="insurrance.statusContract">Chờ xử lý
															</label>
															<label class="radio-inline"> <input type="radio"
																value="5" name="insurrance.statusContract">Tạm hoãn
															</label>
															<label class="radio-inline"> <input type="radio" 
																value="4" name="insurrance.statusContract">Từ chối
															</label>
														</s:if>
														<s:if test="insurrance.statusContract==5">
														<label class="radio-inline"> <input type="radio" 
																value="2" name="insurrance.statusContract">Xử lý
															</label>
															<label class="radio-inline"> <input type="radio"
																value="1" name="insurrance.statusContract">Đang hiệu lực
															</label>
															<label class="radio-inline"> <input type="radio" id="pending"
																value="3" name="insurrance.statusContract">Chờ xử lý
															</label>
															<label class="radio-inline"> <input type="radio" checked="checked"
																value="5" name="insurrance.statusContract">Tạm hoãn
															</label>
															<label class="radio-inline"> <input type="radio"
																value="4" name="insurrance.statusContract">Từ chối
															</label>
														</s:if>
													</div>
												</div>
										</div>
										<div class="row">
											<div class="item form-group">
												<label class="control-label col-md-3 col-sm-6 col-xs-12"
													for="firstName">Lý do(chờ ,từ chối và tạm hoãn)</label>
												<div class="col-md-9 col-sm-9 col-xs-12">
												<s:if test="insurrance.typeReason==1">
													<textarea class="form-control col-md-7 col-xs-12" rows="5" id="reason" name="insurrance.reason">Yêu cầu khám sức khỏe</textarea>
												</s:if>
												<s:if test="insurrance.typeReason==2">
													<textarea class="form-control col-md-7 col-xs-12" rows="5" id="reason" name="insurrance.reason">Yêu cầu bổ sung giấy tờ</textarea>
												</s:if>
												<s:if test="insurrance.typeReason==3">
													<textarea class="form-control col-md-7 col-xs-12" rows="5" id="reason" name="insurrance.reason">Khác</textarea>
												</s:if>
												<s:if test="insurrance.typeReason==0">
													<textarea class="form-control col-md-7 col-xs-12" rows="5" id="reason" name="insurrance.reason"></textarea>
												</s:if>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group" style="text-align: end;">
										<div>
											<input class="btn btn-default" type="button" id="btnSave" value="Lưu">
											<a class="btn btn-default"
												href="<s:url action='i3listVerify' namespace='/web/insurrance'/>">
												 Đóng
											</a>
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
			<%@include file="/view/layout/footer.jsp"%>
			<!-- END FOOTER -->
		</div>
	</div>
	<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Lý do chờ xử lý</h4>
					</div>
					<div class="modal-body">
					<div class="row">
						<form style="margin-left: 90px">
							<div class="radio">
								<label><input type="radio" value="1" name="optradio">Yêu cầu khám sức khỏe</label>
							</div>
							<div class="radio">
								<label><input type="radio" value="2" name="optradio">Yêu cầu bổ sung giấy tờ</label>
							</div>
							<div class="radio disabled">
								<label><input type="radio" value="3" name="optradio">Khác</label>
							</div>
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-6 col-xs-12"
								for="firstName">Ghi chú</label>
								<input type="text" id="note-pending" class="form-control"> 
							</div>
						</form>
						<div class="modal-footer" style="text-align: center;">
						<a class="btn btn-default" id="save-pending">Lưu</a>
						<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button> 
					</div>
					</div>
				</div>
					
				</div>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/view/insurrance/verify/verify.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/app.js"></script>
	<script type="text/javascript">
		$(document).keypress(function(e) {
		    if(e.which == 13) {
		    	return false;
		    }
		});
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
			$('#feePriodDate').datetimepicker({
				format : 'DD/MM/YYYY',
				allowInputToggle : true,
				locale : 'vi'
			});
			var validator = $("#fromAdd").validate({
				rules : {
					"insurrance.evaluationType" : {
						required : true
					},
					"insurrance.customerCode" : {
						maxlength : 20
					},
					"insurrance.product" : {
						required : true
					},
					"insurrance.customerName" : {
						maxlength : 20
					},
					"insurrance.cardId" : {
						maxlength : 50
					},
					"insurrance.issuedBy" : {
						maxlength : 50
					},
					"insurrance.sex" : {
						required : true
					},
					"insurrance.rmCode" : {
						maxlength : 20
					},
					"insurrance.rmName" : {
						maxlength : 200
					},
					"insurrance.rmEmail" : {
						email : true,
						maxlength : 100
					},
					"insurrance.branchCode" : {
						required : true,
						maxlength : 20
					},
					"insurrance.insuranceMoney" : {
						required : true,
						number : true,
						maxlength : 20
					},
					"insurrance.loanTerm" : {
						required : true
					},
					"insurrance.durationOfInsurance" : {
						required : true,
						number : true,
						maxlength : 20
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
						number : true,
						maxlength : 20
					},
					"insurrance.amountOfCommissionToMB" : {
						number : true,
						maxlength : 20
					},
					"insurrance.statusContract" : {
						required : true
					},
					"insurrance.loanTerm" : {
						required : true,
						number : true
					}
				},
				messages : {
					"insurrance.evaluationType" : {
						required : "Trường này không được để trống",
					},
					"insurrance.customerCode" : {
						maxlength : "Trường phải nhỏ hơn 20 kí tự"
					},
					"insurrance.product" : {
						required : "Trường này không được để trống",

					},
					"insurrance.customerName" : {
						maxlength : "Trường phải nhỏ hơn 20 kí tự"
					},
					"insurrance.cardId" : {
						maxlength : "Số phải nhỏ hơn 50 kí tự"
					},
					"insurrance.issuedBy" : {
						maxlength : "Số phải nhỏ hơn 50 kí tự"
					},
					"insurrance.sex" : {
						required : "Trường này không được để trống",
					},
					"insurrance.rmCode" : {
						maxlength : "Trường phải nhỏ hơn 20 kí tự"
					},
					"insurrance.rmName" : {
						maxlength : "Trường phải nhỏ hơn 200 kí tự",
					},
					"insurrance.rmEmail" : {
						maxlength : "Trường phải nhỏ hơn 100 kí tự",
						email : "Sai định dạng"
					},
					"insurrance.branchCode" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 20 kí tự",
					},
					"insurrance.insuranceMoney" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 20 kí tự",
						number : "Phải nhập số"
					},
					"insurrance.loanTerm" : {
						required : "Trường này không được để trống",
					},
					"insurrance.durationOfInsurance" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 20 kí tự",
						number : "Phải nhập số"
					},
					"insurrance.effectiveDate" : {
						required : "Trường này không được để trống"

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
						maxlength : "Trường phải nhỏ hơn 20 kí tự",
						number : "Phải nhập số"
					},
					"insurrance.amountOfCommissionToMB" : {
						maxlength : "Trường phải nhỏ hơn 20 kí tự",
						number : "Phải nhập số"
					},
					"insurrance.statusContract" : {
						required : "Trường này không được để trống",
					},
					"insurrance.loanTerm" : {
						required : "Trường này không được để trống",
						number : "Phải nhập số"
					}

				}
			});

		});
	</script>
	<script type="text/javascript">
	$('#insurranceMoney').change(function() {		
		var money = $('#insurranceMoney').val();
		var productCode = $('#productId').val();
		var new_rate_money = $('#feeRateByPayMethodHidden2').val()
		var rate_product = $('#rateProduct').val();
		var rate_customer = $('#groupCustomer').val();
		var rate_money = $('#money').val();
		var rate = 0;
		if (new_rate_money) {
			rate_customer = new_rate_money;
		}
		if ($('#feeRateByPayMethodHidden1').val()) {
			$('#feeRateByPayMethodHidden1').remove();
		}
		$.post(getContextPath() + "/web/verifymoneyjson/getDiscounts",{
			money : money,
			productCode:productCode
			} , function(data, status){
			if(status == "success"){
				var load = JSON.parse(data.data);
				console.log(load);
				if(data.message == "success"){
					var rate_current_money = load.rate;
					rate = rate_product - rate_product*rate_customer/100 - rate_product*rate_current_money/100;
					var html = "<input type='hidden' id='feeRateByPayMethodHidden1' value='"+load.rate+"'/>"
					$('#fromAdd').append(html);
				} else {
					rate = rate_product - rate_product*rate_customer/100;
				}
			}
			$('input[name="insurrance.coverageRate"]').val(rate);
		} );
		
	});
	$('select[name="insurrance.groupCustomer"]').change(function() {
		var customer_id = $('select[name="insurrance.groupCustomer"]').val();
		var new_rate_money = $('#feeRateByPayMethodHidden1').val();
		var rate_product = $('#rateProduct').val();
		var rate_customer = $('#groupCustomer').val();
		var rate_money = $('#money').val();
		var rate = 0;
		if (new_rate_money) {
			rate_money = new_rate_money;
		}
		if ($('#feeRateByPayMethodHidden2').val()) {
			$('#feeRateByPayMethodHidden2').remove();
		}
		$.post(getContextPath() + "/web/discountcustomerjson/getDiscountByCustomer",{customer_id : customer_id} , function(data, status){
			console.log(data);
			if(status == "success"){
				var load = JSON.parse(data.data);
				console.log(load);
				if(data.message == "success"){
					var rate_current_customer = load.rate;
					rate = rate_product - rate_product*rate_current_customer/100 - rate_product*rate_money/100;
					var html = "<input type='hidden' id='feeRateByPayMethodHidden2' value='"+load.rate+"'/>"
					$('#fromAdd').append(html);
				}
				else{
					rate = rate_product - rate_product*rate_money/100;
 				}
			}
			$('input[name="insurrance.coverageRate"]').val(rate);
		});
	});
	</script>

</body>
</html>