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

    <title>Quản lý khách hàng</title>

    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />" />
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/font-awesome/css/font-awesome.min.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" />" />
    <!-- Custom Theme Style -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/custom.min.css" />" />
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/view/product/product.css" />" />
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
						<h3>Quản Lý Thông Tin Khách Hàng</h3>
					</div> -->
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="container">
								<h2>Sửa Thông Tin Khách Hàng</h2>
								<s:if test="hasActionMessages()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
										style="text-align: center;" id="errorLogin">
										<s:actionmessage />
									</div>
								</s:if>
								<form id="fromAdd"
									action="<s:url action = "updateCustomer" namespace="/web/customer"/>"
									class="form-horizontal form-label-left" method="post">
									 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="tab-content">
										<div id="home" class="tab-pane fade in active">
											<div class="x_content">
											<input type="hidden" name="customer.customerId" value="<s:property value="customer.customerId"/>">
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="customer-code">Mã Khách Hàng<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control col-md-7 col-xs-12" value="<s:property value="customer.customerCode"/>" type="text" readonly="readonly"
															placeholder="Mã Khách Hàng" name="customer.customerCode" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="fullname">Tên Khách Hàng<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="customer.fullname" value="<s:property value="customer.fullname"/>"
															placeholder="tên khách hàng" class="form-control col-md-7 col-xs-12" id="fullname" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="birthday">Ngày Sinh <span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:date name="customer.birthday" var="formattedVal" format="dd/MM/yyyy"/>
														<input type="text" name="customer.birthday" value="<s:property value="%{#formattedVal}"/>"
															placeholder="Ngày Sinh" class="form-control col-md-7 col-xs-12" id="birthday">
															
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="sex">Giới Tính<span class="required">*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:if test="customer.sex == 0">
															<s:radio list="#{'1':'Nam','0':'Nữ'}" name="customer.sex" value="0"></s:radio>
														</s:if>
														<s:if test="customer.sex == 1">
															<s:radio list="#{'1':'Nam','0':'Nữ'}" name="customer.sex" value="1"></s:radio>
														</s:if>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="cmtnd">Số Giấy Tờ Tùy Thân <span class="required">*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" id="cmtnd" name="customer.cmtnd" value="<s:property value="customer.cmtnd"/>"
															placeholder="Số Giấy Tờ Tùy Thân" class="form-control col-md-7 col-xs-12" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="cmtnd">Loại giấy tờ tùy thân<span class="required">*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="customer.typeCard">
															<option value="1">CMT</option>
															<option value="2">Hộ chiếu</option>
															<option value="3">Thẻ căn cước</option>
														</select> --%>
														<s:select name="customer.typeCard" class="form-control col-md-7 col-xs-12" 
															list="#{'1':'CMT', '2':'Hộ chiếu', '3':'Thẻ căn cước'}">
														</s:select>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">Ngày Cấp
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
													<s:date name="customer.dateRange" var="formattedVal" format="dd/MM/yyyy"/>
													<input class="form-control" placeholder="Ngày cấp" type="text" 
													value="<s:property value="customer.dateRange"/>" name="customer.dateRange" id="dateRange"/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="issuedBy">Nơi Cấp
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="customer.issuedBy" value="<s:property value="customer.issuedBy"/>"
															placeholder="nơi cấp" class="form-control col-md-7 col-xs-12" id = "issuedBy" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="address">Địa Chỉ
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="customer.address" value="<s:property value="customer.address"/>"
															placeholder="Địa chỉ" class="form-control col-md-7 col-xs-12" id = "address" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="phoneNumber">Số Điện Thoại
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="customer.phoneNumber" value="<s:property value="customer.phoneNumber"/>"
															placeholder="Số Điện thoại" class="form-control col-md-7 col-xs-12" id = "phoneNumber" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="phoneNumber">Trạng thái hôn nhân
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="customer.mergeStatus" value="<s:property value="customer.mergeStatus"/>"
															placeholder="Trạng thái hôn nhân" class="form-control col-md-7 col-xs-12" id = "" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="phoneNumber">Nghề nghiệp
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="customer.job" value="<s:property value="customer.job"/>"
															placeholder="Nghề nghiệp" class="form-control col-md-7 col-xs-12" id = "" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="phoneNumber">Nhóm nghề
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="customer.groupJob" value="<s:property value="customer.groupJob"/>"
															placeholder="Nhóm nghề" class="form-control col-md-7 col-xs-12" id = "" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="phoneNumber">Thu nhập bình quân
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="customer.averageIncome" value="<s:property value="customer.averageIncome"/>"
															placeholder="Nhóm nghề" class="form-control col-md-7 col-xs-12" id = "" />
													</div>
												</div>
												<div class="ln_solid"></div>
											</div>
										</div>
									</div>
									<div class="form-group" style="text-align: center;">
										<div class="col-md-6 col-md-offset-3">
											<a class="btn btn-default"
												href="<s:url action='list' namespace='/web/customer'/>"> <i
												class="fa fa-times" aria-hidden="true"></i> Đóng
											</a>
											<button id="btn-add-user" type="submit" class="btn btn-default">Lưu</button>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/moment.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/locale/vi.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#errorLogin").fadeTo(2000, 500).slideUp(5000, function() {
				$("#errorLogin").slideUp(500);
			});
			$('#dateRange').datetimepicker({
	        format: 'DD/MM/YYYY',
	        allowInputToggle: true,
	        locale: 'vi'
	  		});
			$('#birthday').datetimepicker({
		        format: 'DD/MM/YYYY',
		        allowInputToggle: true,
		        locale: 'vi'
		    });
		
			var validator = $("#fromAdd").validate({
				 rules : {
						"customer.customerCode" : {required : true,maxlength :20} ,
						"customer.fullname" : {required : true,maxlength :200},
						"customer.birthday" : {required : true,maxlength :20
						},
						"customer.sex": {required : true,},
						"customer.cmtnd": {required: true,maxlength :20
						},
						"customer.dateRange": {maxlength :20
						},
						"customer.issuedBy": {
							maxlength :200
						},
						"customer.address": {
							maxlength :200
						},
						"customer.phoneNumber": {
							number: true,
							maxlength :20
						},
						"customer.mergeStatus" : {maxlength :50},
						"customer.job" : {maxlength :100},
						"customer.groupJob" : {maxlength :100},
						"customer.averageIncome" : {number: true,minlength :2,maxlength :15}
					},
					errorPlacement: function(label, element) {
		                label.addClass('errorMsq');
		                element.parent().append(label);
		            },
					messages : {
						"customer.customerCode" : {
							required : "Trường này không được để trống",
							maxlength : "Trường phải nhỏ hơn 20 kí tự"
						} ,
						"customer.fullname" : {
							required : "Trường này không được để trống",
							maxlength : "Trường phải nhỏ hơn 200 kí tự"
						},
						"customer.birthday" : {
							required : "Trường này không được để trống",
						},
						"customer.sex" :{
							required : "Trường này không được để trống",
						},
						"customer.cmtnd" :{
							required : "Trường này không được để trống",
							maxlength : "Số phải nhỏ hơn 20 kí tự"
						},
						"customer.dateRange" :{
							maxlength : "Số phải nhỏ hơn 20 kí tự"
						},
						"customer.issuedBy" :{
							maxlength : "Số phải nhỏ hơn 200 kí tự"
						},
						"customer.address" :{
							maxlength : "Trường phải nhỏ hơn 200 kí tự"
						},
						"customer.phoneNumber" :{
							number : "Chỉ được nhập số",
							maxlength : "Số phải nhỏ hơn 20 kí tự"
						},
						"customer.mergeStatus" :{
							maxlength : "Trường phải nhỏ hơn 50 kí tự"
						},
						"customer.job" :{
							maxlength : "Trường phải nhỏ hơn 100 kí tự"
						},
						"customer.groupJob" :{
							maxlength : "Trường phải nhỏ hơn 100 kí tự"
						},
						"customer.averageIncome" :{
							number : "Chỉ được nhập số",
							minlength :"Trường phải lớn hơn 2 kí tự",
							maxlength : "Trường phải nhỏ hơn 15 kí tự"
						},
				 	}
			});
      
		});
	</script>
</body>
</html>