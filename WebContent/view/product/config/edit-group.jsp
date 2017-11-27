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

    <title>Quản lý cấu hình sản phẩn</title>

    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />" />
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/font-awesome/css/font-awesome.min.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" />" />
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/custom.min.css" />" />
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
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>Sửa tỷ lệ giảm phí theo nhóm khách hàng</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<s:if test="hasActionMessages()">
										<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12" id="errorLogin">
											<s:actionmessage />
										</div>
									</s:if>
									<form id="discountForm" action="<s:url action = "updateGroup" namespace="/web/product/config"/>" class="form-horizontal form-label-left" 
													method="post">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										<input type="hidden" name="discount.id" value="<s:property value="discount.id"/>">
										
										<div class="row">
											<div class="col-md-12">
												<div class="item form-group">
													<label class="control-label col-md-4 col-sm-4 col-xs-12" for="firstName">Tên sản phẩm<span class={required : true}>*</span></label>
													<div class="col-md-4 col-sm-4 col-xs-12">
														<s:select class="form-control" name="discount.product.id" 
															    list="products" 
															    listValue="name"
															    value='discount.product.id'
															    listKey="id" />
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-4 col-sm-4 col-xs-12">Nhóm khách hàng<span class={required : true}>*</span></label>
													<div class="col-md-4 col-sm-4 col-xs-12">
														<input class="form-control" placeholder="Nhóm khách hàng" type="text" 
														name="discount.customerGroup" value="<s:property value="discount.customerGroup"/>"/>
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-4 col-sm-4 col-xs-12">Tỉ lệ giảm phí (%)<span class={required : true}>*</span></label>
													<div class="col-md-4 col-sm-4 col-xs-12">
														<input class="form-control" placeholder="Tỉ lệ giảm phí" type="text" 
														name="discount.rate" value="<s:property value="discount.rate"/>"/>
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-4 col-sm-4 col-xs-12">Ngày bắt đầu<span class={required : true}>*</span></label>
													<div class="col-md-4 col-sm-4 col-xs-12">
														<input class="form-control" placeholder="Ngày bắt đầu" type="text" 
														name="discount.beginDate" value="<s:property value="discount.beginDate"/>" id="beginDate"/>
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-4 col-sm-4 col-xs-12">Ngày kết thúc</label>
													<div class="col-md-4 col-sm-4 col-xs-12">
														<input class="form-control" placeholder="Ngày kết thúc" type="text" name="discount.endDate"
														id="endDate" value="<s:property value="discount.endDate"/>"/>
													</div>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-12" style="text-align: center;">
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
	
	<script src="<c:url value = "/resource/js/jquery.min.js" />"></script>
	<script src="<c:url value = "/resource/js/jquery.validate.min.js" />"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/moment.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/locale/vi.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#endDate').datetimepicker({
	        format: 'DD/MM/YYYY',
	        allowInputToggle: true,
	        locale: 'vi'
	    });
			
			$('#beginDate').datetimepicker({
	        format: 'DD/MM/YYYY',
	        allowInputToggle: true,
	        locale: 'vi'
	    });
			$("#errorLogin").fadeTo(2000, 500).slideUp(500, function() {
				$("#errorLogin").slideUp(500);
			});
			var validator = $("#discountForm").validate({
		        rules: {
		           "discount.product.name": {required: true},
		           "discount.customerGroup": {required: true, maxlength: 200},
		           "discount.rate": {required : true,number:true, maxlength: 20},
		           "discount.beginDate": {required : true, maxlength: 20},
		           "discount.endDate": {maxlength: 20},
		        },
		        messages: {
		        	"discount.product.name": {
								required : "Trường này không được để trống",
							} ,
		           "discount.customerGroup": {
								required : "Trường này không được để trống",
								maxlength : "Tối đa 200 kí tự"
							} ,
		           "discount.rate": {
								required : "Trường này không được để trống",
								number : "Phải nhập số"
							} ,
		           "discount.beginDate": {
								required : "Trường này không được để trống",
								maxlength : "Tối đa 20 kí tự"
							} ,
		           "discount.endDate": {
								maxlength : "Tối đa 20 kí tự"
							}
		        }
			    });
		});
	</script>
</body>
</html>