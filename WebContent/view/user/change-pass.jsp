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
<title>Quản lý NSD</title>

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
			<%@include file="../layout/header.jsp"%>
			<!-- END HEADER -->

			<!-- page content -->
			<div class="right_col" role="main">
				
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="container">
								<h2>Thay đổi mật khẩu</h2>
								<s:if test="hasActionMessages()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12" style="text-align: center;"
										id="errorLogin">
										<s:actionmessage />
									</div>
								</s:if>
								<form id="fromAddEmp"
									action="<s:url action = "changePassWord" namespace="/web/userchange"/>"
									class="form-horizontal form-label-left" method="post">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="tab-content">
										<div id="home" class="tab-pane fade in active">
											<div class="x_content">
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="username">Mật khẩu cũ<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control col-md-7 col-xs-12" type="password"
															name="oldPass" id="username" value="${oldPass}"/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="nameNSD">Mật khẩu mới<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="password" name="newPass" value="${newPass}"
															class="form-control col-md-7 col-xs-12" id="fullname" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="email">Xác nhận mật khẩu mới <span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="password"  name="confirmNewPass" value="${confirmNewPass}"
															class="form-control col-md-7 col-xs-12" />
													</div>
												</div>
												<div class="ln_solid"></div>
											</div>
										</div>
									</div>
									<div class="form-group" style="text-align: center;">
										<div class="col-md-6 col-md-offset-3">
											<button id="btn-add-user"  type="submit"
												class="btn btn-default">Thay đổi</button>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/user/add.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/app.js"></script>
	<script type="text/javascript">
				$(document).ready(function() {					
					$("#username").val('');					
					$("#errorLogin").fadeTo(2000, 500).slideUp(500, function() {
						$("#errorLogin").slideUp(500);
					});

					 var validator = $("#fromAddEmp").validate({
						 rules : {
								"oldPass" : {
									required : true,
									maxlength : 32
								} ,
								"newPass" : {
									required : true,
									minlength : 6,
									maxlength : 32
								},
								"confirmNewPass" : {
									required : true,
									minlength : 6,
									maxlength : 32
								}
							},
							messages : {
								"oldPass" : {
									required : "Trường này không được để trống",
									maxlength : "Trường tối đa 32 kí tự"
								} ,
								"newPass" : {
									required : "Trường này không được để trống",
									minlength : "Trường tối thiểu 6 kí tự",
									maxlength : "Trường tối đa 32 kí tự"
								},
								"confirmNewPass" : {
									required : "Trường này không được để trống",
									minlength : "Trường tối thiểu 6 kí tự",
									maxlength : "Trường tối đa 32 kí tự"
								}
						 	}
					});
				});
			</script>
</body>
</html>