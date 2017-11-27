<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Sửa chi nhánh</title>

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />" />
    
    <!-- Font Awesome -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/font-awesome/css/font-awesome.min.css" />" />

    <!-- NProgress -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/nprogress/nprogress.css" />" />
    
    <!-- iCheck -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/iCheck/skins/flat/green.css" />" />

    <!-- bootstrap-progressbar -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" />" />

    <!-- Custom Theme Style -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/custom.min.css" />" />
    
    <%-- <script src="<c:url value="/js/view/user/add.js"/>"></script> --%>
    <script src="<c:url value = "/js/jquery.validate.min.js" />"></script>
    <%-- <script src="<c:url value = "/js/jquery.min.js" />"></script> --%>
    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/view/product/product.css" />" />
</head>
<body class="nav-md">
	<div class="container body">
	    <div class="main_container">
	        <!-- BEGIN HEADER -->
	        <%@include file="/view/layout/header.jsp" %>
	        <!-- END HEADER -->
	
	        <!-- page content -->
	       <div class="right_col" role="main">
					<div class="page-title">
						<div class="title_left">
							<h3>Thay đổi thông tin chi nhánh</h3>
						</div>

					</div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>Chi nhánh: <s:property value="agency.code"/></h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<s:if test="hasActionMessages()">
										<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12" id="errorLogin">
											<s:actionmessage />
										</div>
									</s:if>
									<form id="formUpdateAgency" action="<s:url action="update" namespace="/web/agency"/>" class="form-horizontal form-label-left" 
													method="post">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										<input type="hidden" name="agency.id" value="<s:property value="agency.id"/>">
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="firstName">Mã chi nhánh <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input class="form-control col-md-7 col-xs-12" readonly="readonly"
												type="text" name="agency.code" value="<s:property value="agency.code" />" />
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="firstName">Tên chi nhánh <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input class="form-control col-md-7 col-xs-12" type="text" 
													name="agency.name" value="<s:property value="agency.name"/>" />
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="lastName">Nhân viên tư vấn
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" class="form-control col-md-7 col-xs-12" 
													name="agency.consultantName" value="<s:property value="agency.consultantName"/>"/>
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="lastName">Địa chỉ<span
														class={required:true}>*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" class="form-control col-md-7 col-xs-12" 
													name="agency.address" value="<s:property value="agency.address"/>"/>
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="lastName">Số điện thoại
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" class="form-control col-md-7 col-xs-12" 
														name="agency.phoneNumber" value="<s:property value="agency.phoneNumber"/>"/>
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="lastName">Trạng thái chi nhánh <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select class="form-control" name="agency.actived">
														<option value="1" <s:if test="agency.actived == 1">selected="selected"</s:if>>Đang hoạt động</option>
														<option value="0" <s:if test="agency.actived == 0">selected="selected"</s:if>>Vô hiệu hóa</option>
												</select>
											</div>
										</div>
										<div class="ln_solid"></div>
										<div class="form-group" style="text-align: -webkit-right;">
											<div class="col-md-6 col-md-offset-3">
												<a class="btn btn-default" href="list.action">Đóng</a>
												<button id="send" type="submit" class="btn btn-default">Lưu</button>
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
	        <%@include file="/view/layout/footer.jsp" %>
	        <!-- END FOOTER -->
	    </div>
	</div>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/fastclick/lib/fastclick.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/nprogress/nprogress.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/gauge.js/dist/gauge.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/iCheck/icheck.min.js"></script>
	
	<script src="<c:url value = "/resource/js/jquery.validate.min.js" />"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#errorLogin").fadeTo(2000, 500).slideUp(5000, function() {
				$("#errorLogin").slideUp(500);
			});

			var validator = $("#formUpdateAgency").validate({
				rules : {
					"agency.code" : {
						required : true,
						maxlength : 20
					},
					"agency.name" : {
						required : true,
						maxlength : 100
					},
					"agency.consultantName" : {
						maxlength : 100
					},
					"agency.address" :{
						required : true,
						maxlength : 100
					},
					"agency.phoneNumber" :{
						number: true,
						maxlength : 20
					}
				},
				messages : {
					"agency.code" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 20 kí tự"
					},
					"agency.name" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 100 kí tự"
					},
					"agency.consultantName" : {
						maxlength : "Trường phải nhỏ hơn 100 kí tự"
					},
					"agency.address" :{
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 100 kí tự"
					},
					"agency.phoneNumber" :{
						number: "Phải nhập số",
						maxlength : "Trường phải nhỏ hơn 20 kí tự"
					}
				}
			});

		});
	</script>
</body>
</html>