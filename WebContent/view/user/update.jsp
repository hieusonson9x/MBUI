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
	href="<c:url value="/resource/css/select2.min.css" />" />
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
								<h2>Chỉnh sửa thông tin người sử dụng</h2>
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
											<form id="fromUpdateEmp"
												action="<s:url action = "updateEmp" namespace='/web/user'/>"
												class="form-horizontal form-label-left" method="post">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
												<s:hidden name="user.id" />
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="username">Tên Đăng Nhập<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control col-md-7 col-xs-12"
															name="user.username" id="username" readonly="true" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="nameNSD">Tên NSD<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield name="user.fullname"
															class="form-control col-md-7 col-xs-12" readonly="false" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="email">Email <span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield type="text" id="email" name="user.email"
															class="form-control col-md-7 col-xs-12" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="title">Chức Danh </label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield type="text" id="title" name="user.title"
															class="form-control col-md-7 col-xs-12" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="phoneNumber">Số Điện Thoại </label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield type="text" id="phone"
															name="user.phoneNumber"
															class="form-control col-md-7 col-xs-12" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">Trạng
														Thái <span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="user.status">
															<option value="0">ACTIVE</option>
															<option value="1">DEACTIVE</option>
														</select> --%>
														<s:select name="user.status" 
														class="form-control col-md-7 col-xs-12"
														list="#{'0':'Hoạt động','1':'Vô hiệu'}"/>

													</div>
												</div>
												<div class="ln_solid"></div>
												<div class="form-group" style="text-align: -webkit-right;">
													<div class="col-md-6 col-md-offset-3">
													<button id="send" onclick="saveNewGroupRole()"
														class="btn btn-default">Lưu</button>
														<a class="btn btn-default"
															href="<s:url action='listEmp' namespace='/web/user'/>">
															Đóng
														</a>
														
													</div>
												</div>
											</form>
										</div>
									</div>
									<div id="menu3" class="tab-pane fade">
										<div id="div1" class="x_content table-responsive">
											<table id="datatable"
												class="table table-striped table-bordered">
												<thead>
													<tr>
														<th>Mã</th>
														<th>Tên</th>
														<th>Nhóm quyền cha</th>
													</tr>
												</thead>
												<tbody id="tbl-tbody-group">
													<s:iterator value="groupRoles">
														<tr>
															<td><s:property value="groupRoleCode"></s:property></td>
															<td><s:property value="groupRoleName"></s:property></td>
															<td> <s:if test="parent==null">
															</s:if>
															<s:else>
															<s:property value="parentGroupRole"></s:property>
															</s:else>
															</td>
														<tr>
													</s:iterator>
												</tbody>
											</table>
											<div style="text-align: center;">
												<button type="button" class="btn btn-default"
													data-toggle="modal" data-target="#modal-grouprole"
													style="text-align: center">Thay đổi</button>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- All modal box here -->
			<div class="modal fade bs-example-modal-lg" id="modal-grouprole"
				tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-md">
					<div class="modal-content">

						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								Danh sách nhóm quyền:
								<s:property value="groupRole.groupRoleName"></s:property>
							</h4>
						</div>
						<div class="modal-body">
							<input type="text" class="form-control" id="ip-search"
								onchange="onChangeCheckbox(this)"
								onkeyup="searchEngine('ip-search', 'ul-role')"
								placeholder="Nhập vào mã hoặc tên quyền"> <br>
							<div class=""
								style="overflow-y: auto; position: relative; max-height: 200px;">
								<ul class="to_do" id="ul-role">
									<s:iterator value="allGroupRoles">
										<li>
											<p>
												<s:if test="%{checkInList(groupRoles)}">
													<input type="checkbox" class="roled flat"
														grouprolecode="<s:property value='groupRoleCode'/>"
														grouprolename="<s:property value='groupRoleName'/>"
														parent="<s:property value='parent.groupRoleName' />"
														checked>
												</s:if>
												<s:else>
													<input type="checkbox" class="roled flat"
														grouprolecode="<s:property value='groupRoleCode'/>"
														grouprolename="<s:property value='groupRoleName'/>" 
														parent="<s:property value='parent.groupRoleName'/>">
												</s:else>
												<strong> <s:property value='groupRoleCode' /> :
												</strong>
												<s:property value='groupRoleName' />
												<input type="hidden" id="parent-groupRoleName" value="<s:property value='parent.groupRoleName' />">
												
											</p>
										</li>
									</s:iterator>
								</ul>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">
								<i class="fa fa-times" aria-hidden="true"></i> Hủy
							</button>
							<button type="button" id="btn-updateRole" class="btn btn-default">
								<i class="fa fa-floppy-o" aria-hidden="true"></i> Cập nhật
							</button>
						</div>

					</div>
				</div>
			</div>
			<script type="text/javascript"
			src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
			<script src="<c:url value = "/resource/js/jquery.validate.min.js" />"></script>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/resource/js/user/update.js"></script>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/resource/js/app.js"></script>
			<script type="text/javascript">
				$(document).ready(function() {
					$("#errorLogin").fadeTo(2000, 500).slideUp(500, function() {
						$("#errorLogin").slideUp(500);
					});

					var validator = $("#fromUpdateEmp").validate({
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
										maxlength :50
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

			<!-- /page content -->

			<!-- BEGIN FOOTER -->
			<%@include file="../layout/footer.jsp"%>
			<!-- END FOOTER -->
		</div>
	</div>


</body>
</html>