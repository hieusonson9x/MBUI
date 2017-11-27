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
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
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
<style>
.errorMsq {
	color: red;
}
.errorMessage {
color: red;
}
</style>
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
						<h3>Quản Lý Thông Tin Hợp Đồng Bảo Hiểm</h3>
					</div> -->

				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="container">
								<h2>Thêm Mới Thông Tin Hợp Đồng Bảo Hiểm</h2>
								<%-- <s:if test="hasActionMessages()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
										style="text-align: left;" id="errorLogin">
										<s:actionmessage />
									</div>
								</s:if> --%>
								<form id="fromAdd" style="margin-right: 145px;"
									action="<s:url action="i1add" namespace="/web/insurrance" />"
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
														<input class="form-control" type="text"
															readonly="readonly" placeholder="Số HĐBH" />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Loại Hình Thẩm Định<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="insurrance.evaluationType">
							 								<option value="1">Thẩm Định Tự Động</option>
															<option value="2">Thẩm Định Thông Thường</option>
														</select> --%>
														<s:select name="insurrance.evaluationType"
															id="evaluationType"
															class="form-control col-md-7 col-xs-12"
															list="#{'1':'Thẩm Định Tự Động', '2':'Thẩm Định Thông Thường'}">
														</s:select>
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Mã KH<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" placeholder="Mã KH"
															type="text" name="insurrance.customerCode" id="customerCode"/>
														<%-- <s:select class="form-control" name="insurrance.customer.id" 
															    list="customers" 
															    listValue="customerCode"
															    listKey="id" /> --%>
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">CMTND/HC<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" placeholder="CMTND/HC"
															type="text" name="insurrance.cardId"  />
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Nơi Cấp</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text"
															placeholder="Nơi Cấp" name="insurrance.issuedBy" />
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="sex">Giới Tính<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
													<%-- <s:textfield type="radio" value="1" name="insurrance.sex"  />
														nam
														<s:textfield type="radio" value="0" name="insurrance.sex"/>
														nữ --%>
													<s:radio list="#{'1':' Nam','0':' Nữ'}" name="insurrance.sex" id="insurrance.sex"></s:radio>
													</div>
												</div>
											</div>

											<div class="col-md-6">
											<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Sản Phẩm<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<!-- <input name="insurrance.product" type="text"> -->
														<s:select class="form-control" name="insurrance.product" id="product"
														  emptyOption="1"	list="products" listValue="name" listKey="code" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Nhóm KH giảm phí</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<!-- <input name="insurrance.product" type="text"> -->
														<s:select class="form-control"
															name="insurrance.groupCustomer" list="groups"
															emptyOption="1" listValue="customerGroup" listKey="id" />
													</div>
												</div>
												<%-- <div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Nhóm tiền giảm phí</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
													<!-- <input name="insurrance.product" type="text"> -->
													<s:select class="form-control" name="insurrance.groupMoney"
														    list="moneys" 
														    emptyOption="1"
														    listValue="minMoney"
														    listKey="id" />
													</div>
												</div> --%>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Họ và Tên KH<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text"
															placeholder="Họ và Tên KH" name="insurrance.customerName" />
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày Cấp</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text"
															placeholder="dd/mm/yyyy" name="insurrance.dateRange"
															id="dateRange" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày Sinh<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text"
															placeholder="mm/mm/yyyy" name="insurrance.birthday"
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
														<s:textfield class="form-control" placeholder="Mã RM"
															type="text" name="insurrance.rmCode" />
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Email RM</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" placeholder="Email RM"
															type="text" name="insurrance.rmEmail" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Số điện thoại</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" placeholder="SĐT RM"
															type="text" name="insurrance.rmPhone" />
													</div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Họ và Tên RM </label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text"
															placeholder="Họ và Tên RM" name="insurrance.rmName" />
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Mã Chi Nhánh <span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text" id="agency"
															placeholder="Mã Chi Nhánh" name="insurrance.agency" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Tên chi nhánh</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text"
															placeholder="Tên Chi Nhánh" name="insurrance.agencyName" />
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
														<s:textfield class="form-control number" id="insuranceMoney11"
															placeholder="Số Tiền Bảo Hiểm" type="text"
															name="insurrance.insuranceMoney"  />
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
															list="#{
															'3' : 'Đóng phí định kỳ theo kỳ thu lãi khoản vay',
															'2':'Đóng phí một lần gộp cùng khoản vay',
															'1':'Đóng phí một lần bằng tiền mặt'
															 }">
														</s:select>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Thời hạn bảo hiểm (tháng)<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control"
															placeholder="Thời hạn bảo hiểm" type="text"
															name="insurrance.durationOfInsurance" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Mã khoản vay</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control"
															placeholder="Mã khoản vay" type="text"
															name="insurrance.contractNumber" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Tỷ Lệ % Phí BH<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control"
															placeholder="Tỷ Lệ % Phí BH" type="text"
															name="insurrance.coverageRate" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Tỷ lệ tăng phí</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" id="rateIncrease11"
															placeholder="Tỷ Lệ tăng phí" type="text"
															name="insurrance.rateIncrease" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Số Tiền hoa hồng do MB tính</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control"
															placeholder="Số Tiền hoa hồng do MB tính" type="text"
															name="insurrance.amountOfCommissionToMB"
															 />
													</div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Thời hạn khoản vay(tháng) <span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text"
															placeholder="Thời hạn khoản vay"
															name="insurrance.loanTerm" />
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày hiệu lực BH <span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text"
															placeholder="dd/mm/yyyy" id="effectiveDate"
															name="insurrance.effectiveDate" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Trạng thái đóng phí</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="insurrance.statusFee">
															<option value="1">None</option>
															<option value="2">Đã đóng phí</option>
															<option value="3">Nợ phí</option>
															<option value="4">quá hạn phí</option>
															<option value="5">Hoàn thành</option>
														</select> --%>
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
														for="firstName">Ngày giải ngân</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text"
															placeholder="dd/mm/yyyy" id="disbursementDate"
															name="insurrance.disbursementDate" />
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Số tiền phí BH do MB tính </label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text"
															placeholder="Số tiền phí BH do MB tính"
															name="insurrance.insuranceAmountToMB"  />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Trạng thái hợp đồng</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="insurrance.statusContract">
															<option value="1">Đang hoạt động</option>
															<option value="2">Xử lý</option>
															<option value="3">Đang chờ xử lý</option>
															<option value="4">Từ chối</option>
															<option value="5">Hoãn lại</option>
															<option value="6">Chấm dứt</option>
														</select> --%>
														<s:select name="insurrance.statusContract"
															id="statusContract"
															disabled="true"
															class="form-control col-md-7 col-xs-12"
															list="#{'1':'Đang hiệu lực',
															 '2':'Xử lý',
															 '3' : 'Đang chờ xử lý',
															 '7':'Đợi duyệt'}">
														</s:select>
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
													<s:select name="insurrance.paymentFrequency"
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
													<s:textfield class="form-control" type="text" id="feePriodDate"
														placeholder="dd/mm/yyyy" name="insurrance.feePriodDate" />
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
													<s:textarea class="form-control" type="text"
														placeholder="Ghi chú" name="insurrance.note" ></s:textarea>
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
	<script src="<c:url value = "/resource/js/jquery.validate.min.js" />"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/moment.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/locale/vi.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/fastclick/lib/fastclick.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/iCheck/icheck.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/view/insurrance/add.js"></script>
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
			$('#feePriodDate').datetimepicker({
				format : 'DD/MM/YYYY',
				allowInputToggle : true,
				locale : 'vi'
			});
			if ($('input[name="insurrance.agency"]').val()) {
				$('input[name="insurrance.agency"]').click(function() {
					$('.errorMessage').css("display", "none");
				});
			}
			if ($('input[name="insurrance.birthday"]').val()) {
				$('input[name="insurrance.birthday"]').click(function() {
					$('.errorMessage').css("display", "none");
				});
			}
			if ($('input[name="insurrance.dateRange"]').val()) {
				$('input[name="insurrance.dateRange"]').click(function() {
					$('.errorMessage').css("display", "none");
				});
			}
			if ($('input[name="insurrance.insuranceMoney"]').val()) {
				$('input[name="insurrance.insuranceMoney"]').click(function() {
					$('.errorMessage').css("display", "none");
				});
			}
			if ($('input[name="insurrance.loanTerm"]').val()) {
				$('input[name="insurrance.loanTerm"]').click(function() {
					$('.errorMessage').css("display", "none");
				});
			}
			if ($('input[name="insurrance.cardId"]').val()) {
				$('input[name="insurrance.cardId"]').click(function() {
					$('.errorMessage').css("display", "none");
				});
			}
			//end 
			if ($('#evaluationType').val() == 2) {
				document.getElementById("statusContract").disabled = false;
			}
			var evaluationType = 0;
			$('#evaluationType').change(function() {
				evaluationType = $(this).val();
				console.log(evaluationType);
				if (evaluationType == 2) {
					$('#statusContract').val(7);
					document.getElementById("statusContract").disabled = false;
				}
				if (evaluationType == 1) {
					$('#statusContract').val(1);
					document.getElementById("statusContract").disabled = true;
				}
			});

			$.validator.addMethod("CODE", function(value, element) {
				return this.optional(element) || /^[a-z0-9]+$/i.test(value);
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
						maxlength : 200
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
						CODE : "required CODE",
						maxlength : 10
					},
					"insurrance.insuranceMoney" : {
						required : true,
						number : true,
						maxlength : 50
					},
					"insurrance.loanTerm" : {
						required : true,
						number : true,
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
						number : true,
						maxlength : 20
					},
					"insurrance.insuranceAmountToMB" : {
						number : true,
						maxlength : 50
					},
					"insurrance.amountOfCommissionToMB" : {
						number : true,
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
						required : "Trường này không được để trống",
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
						number : "Phải nhập số"
					},
					"insurrance.loanTerm" : {
						required : "Trường này không được để trống",
						number : "Phải nhập số",
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
						number : "Phải nhập số"
					},
					"insurrance.insuranceAmountToMB" : {
						maxlength : "Trường phải nhỏ hơn 50 kí tự",
						number : "Phải nhập số"
					},
					"insurrance.amountOfCommissionToMB" : {
						maxlength : "Trường phải nhỏ hơn 50 kí tự",
						number : "Phải nhập số"
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
	<script type="text/javascript">
		/* $(document).ready(function() {
			$("input[data-type='number']").keyup(function(event) {
				// skip for arrow keys
				if (event.which >= 37 && event.which <= 40) {
					event.preventDefault();
				}
				var $this = $(this);
				var num = $this.val().replace(/,/gi, "");
				var num2 = num.split(/(?=(?:\d{3})+$)/).join(",");
				console.log(num2);
				// the following line has been simplified. Revision history contains original.
				$this.val(num2);
			});
		}); */
		/* $('input.number').keyup(function(event) {

			  // skip for arrow keys
			  if(event.which >= 37 && event.which <= 40) return;
			  
			  // format number
			  $(this).val(function(index, value) {
			    return value
			    .replace(/\D/g, "")
			    .replace(/\B(?=(\d{3})+(?!\d))/g, ",")
			    ;
			  });
			}); */
	</script>
	
</body>
</html>