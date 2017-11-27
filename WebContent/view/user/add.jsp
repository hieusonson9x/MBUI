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
								<h2>Thêm Mới Người Dùng</h2>
								<s:if test="hasActionMessages()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12" style="text-align: center;"
										id="errorLogin">
										<s:actionmessage />
									</div>
								</s:if>
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#home">Thông
											Tin NSD</a></li>
									<li><a data-toggle="tab" href="#menu3">Phân Quyền NSD</a></li>
								</ul>
								
									<div class="tab-content">
										<div id="home" class="tab-pane fade in active">
											<div class="x_content">
											<form id="fromAddEmp"
												action="<s:url action = "addEmp" namespace="/web/user"/>"
												class="form-horizontal form-label-left" method="post">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="username">Tên Đăng Nhập<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control col-md-7 col-xs-12"
															type="text" name="user.username" id="username" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="nameNSD">Tên NSD<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield type="text" name="user.fullname"
															class="form-control col-md-7 col-xs-12" id="fullname" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="email">Email <span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield type="text" name="user.email"
															class="form-control col-md-7 col-xs-12" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="title">Chức Danh </label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield type="text" name="user.title"
															class="form-control col-md-7 col-xs-12" id="title" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="phoneNumber">Số Điện Thoại </label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield type="text" name="user.phoneNumber"
															class="form-control col-md-7 col-xs-12" id="phonenumber" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">Trạng
														Thái <span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<select class="form-control col-md-7 col-xs-12"
															name="user.status" id="sta">
															<option value="0">Hoạt động</option>
															<option value="1">Vô hiệu</option>
														</select>

													</div>
												</div>
												<div class="form-group" style="text-align: right;">
													<div class="col-md-6 col-md-offset-3">
													<button id="btn-add-user" onclick="saveNewGroupRole()"
															class="btn btn-default">Lưu</button>
														<a class="btn btn-default" style="margin-right: 0px;"
															href="<s:url action='listEmp' namespace='/web/user'/>">
															 Đóng
														</a>
														
													</div>
												</div>
											</form>
											<div class="ln_solid"></div>
											</div>
										</div>
										<div id="menu3" class="tab-pane fade">
											<table id="datatable"
												class="table table-striped table-hover  no-footer"
												width="100%">
												<thead>
													<tr>
														<th>Chọn Quyền</th>
														<th>Mã</th>
														<th>Tên</th>
														<th>Nhóm quyền cha</th>
													</tr>
												</thead>
												<tbody>
													<s:iterator value="groupRoles" status="indexG">
														<tr>
															<td>
															<input type="hidden" id="groupRoleCodes11" value="<s:property value="groupRoleCodes"/>">
															<input type="checkbox" id="checkRole<s:property value="%{#indexG.index}"/>"
																value="<s:property value="groupRoleCode"/>" />
															</td>
															<td><s:property value="groupRoleCode"></s:property></td>
															<td><s:property value="groupRoleName"></s:property></td>
															<td><s:property value="parent.groupRoleName"></s:property></td>
														<tr>
													</s:iterator>
												</tbody>
											</table>
										</div>
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

	<script src="<c:url value = "/resource/js/jquery.min.js" />"></script>
	<script src="<c:url value = "/resource/js/jquery.validate.min.js" />"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/user/add.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/app.js"></script>
	<script type="text/javascript">
				$(document).ready(function() {
					var rr = $("#groupRoleCodes11").val();
					var res = rr.split(","); 
					var inputElements = $('input[type="checkbox"]');
					for(var i=0; inputElements[i]; ++i){
					    var chked = inputElements[i].value;	
					    for(var t=0; res[t]; ++t){
					    	if(res[t].trim() === chked.trim()){
								$("#checkRole"+i).attr('checked','checked')
							}
						}
					}
					
					$("#errorLogin").fadeTo(2000, 500).slideUp(500, function() {
						$("#errorLogin").slideUp(500);
					});
					$.validator.addMethod("CODE", function(value, element) {
		                return this.optional(element) || /^[a-z0-9\_\.\-]+$/i.test(value);
		            }, "Không được nhập các kí tự đặc biệt");
					 var validator = $("#fromAddEmp").validate({
						 rules : {
								"user.fullname" : {
									required : true,
									maxlength :200
								} ,
								"user.email" : {
									required : true,
									email : true,
									maxlength :100
								},
								"user.username" : {
									required : true,
									maxlength :50,
									CODE :"required CODE"
								},
								"user.phoneNumber": {
									number: true,
									maxlength :20
								},
								"user.title" :{
									maxlength :200
								}
							},
							messages : {
								"user.fullname" : {
									required : "Trường này không được để trống",
									maxlength : "Trường này tối đa 100 kí tự"
								} ,
								"user.email" : {
									required : "Trường này không được để trống",
									email : "Sai định dạng",
									maxlength : "Trường này tối đa 100 kí tự"
								},
								"user.username" : {
									required : "Trường này không được để trống",
									maxlength : "Trường này tối đa 50 kí tự"
								},
								"user.phoneNumber" :{
									number : "Chỉ được nhập số",
									maxlength : "Số phải nhỏ hơn 20 số"
								},
								"user.title" :{
									maxlength : "Trường này tối đa 200 kí tự"
								}
						 	}
					});
				});
			</script>
</body>
</html>