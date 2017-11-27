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
					</div>
 -->
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="container">
								<h2>Khôi phục Thông Tin Hợp Đồng Bảo Hiểm</h2>
								<s:if test="hasActionMessages()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
										style="text-align: center;" id="errorLogin">
										<s:actionmessage />
									</div>
								</s:if>
								<form id="fromAdd" style="margin-right: 145px;"
									action="<s:url action="i2restorePayment" namespace="/web/insurrance" />"
									class="form-horizontal form-label-left" method="post">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<div class="x_content">
										<input type="hidden" name="insurrance.id" value="<s:property value="insurrance.id"/>">
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="nameNSD">Số tiền góp phí<span class="required">*</span>
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<s:textfield type="text" name="insurrance.amountPaid" 
													class="form-control number col-md-9 col-xs-12" value="" />
											</div>
										</div>
									</div>
									<div class="form-group" style="margin-left: 346px;">
										<div class="col-md-6 col-md-offset-3">
											<a class="btn btn-default"
												href="<s:url action='i2listRestore' namespace='/web/insurrance'/>">
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
			<%@include file="/view/layout/footer.jsp"%>
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
	
		var validator = $("#fromAdd").validate({
			 rules : {
					"insurrance.amountPaid" : {required : true,number :true} ,
				},
				messages : {
					"insurrance.amountPaid" : {
						required : "Trường này không được để trống",
						number : "Chỉ được nhập số"
					} 
			 	}
		});
  
	});
	</script>
	<script type="text/javascript">
		/*NHVIET add start 2017-10-19 */
		$('input.number').keyup(function(event) {

			  // skip for arrow keys
			  if(event.which >= 37 && event.which <= 40) return;
			  
			  // format number
			  $(this).val(function(index, value) {
			    return value
			    .replace(/\D/g, "")
			    .replace(/\B(?=(\d{3})+(?!\d))/g, ",")
			    ;
			  });
			});
		/*NHVIET add end 2017-10-19 */
	</script>
</body>
</html>