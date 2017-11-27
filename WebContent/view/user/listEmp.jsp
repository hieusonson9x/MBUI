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
<title>Quản lý người dùng</title>

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
<link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/dataTable.css" />" />

<style>
#us-alert span {
	color:white; !important
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
				
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>Danh Sách Người Dùng</h2>
								
								<div class="clearfix"></div>
							</div>

								<div class="x_title">
									<form method="post" id="frmSearch" action="search">
									 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										<div class="row">
											<div class="col-lg-6">
												<label class="col-sm-4 control-label"
													style="padding-top: 7px;">Tên người dùng:</label>
												<div class="col-sm-7">
													<s:textfield name="user.fullname"
														cssClass="form-control input-sm mb12"
														autofocus="autofocus"></s:textfield>
												</div>
											</div>
											<div class="col-lg-6">
												<label class="col-sm-4 control-label"
													style="padding-top: 7px;">Tên đăng nhập:</label>
												<div class="col-sm-7">
													<s:textfield name="user.username"
														cssClass="form-control input-sm mb12"
														autofocus="autofocus"></s:textfield>
												</div>
											</div>
											
										</div>
										<br>
									<div class="row">
										<div class="col-lg-6">
											<label style="padding-top: 7px;"
												class="col-sm-4 control-label">Trạng Thái </label>
											<div class="col-sm-7">
												<s:select name="user.status"
															class="form-control col-md-7 col-xs-12"
															list="#{'3':'----Tất cả---',
															 '0':'Hoạt động',
															 '1':'Vô hiệu'
															 }">
											</s:select>

											</div>
										</div>
										<div class="col-md-6" style="text-align: right;">
											<div class="col-md-8">
												<s:submit value="Tìm kiếm" 
													 cssClass="btn btn-default" />
											</div>
											<div class="col-md-3">
												<a class="btn btn-default"
													href="<s:url action='add' namespace='/web/user'/>">Thêm
													Mới</a>
											</div>
										</div>
									</div>

								</form>
									<s:if test="hasActionMessages()">
										<div class="alert alert-success col-xs-12 col-sm-12 col-md-12"
											id=us-alert>
											<s:actionmessage style="color:white;"/>
										</div>
									</s:if>
								<div class="clearfix"></div>
								</div>

								<div class="x_content">
									<table id="user-table" class="table table-striped table-bordered" id="user-table">
										<thead>
											<tr >
												<th>STT</th>
												<th>Tên Đăng Nhập</th>
												<th style="min-width: 150px;">Tên NSD</th>
												<th>Chức Danh</th>
												<th style="min-width: 150px;">Email</th>
												<th>Nhóm Quyền</th>
												<th>Trạng Thái</th>
												<th>Chức Năng</th>
												<th style="display:none"></th>
											</tr>
										</thead>
										<tbody>
											<s:iterator value="userDTO" var="user" status="stt">
												<tr>
													<td style="text-align: center;"><s:property value="%{#stt.index + 1}"/></td>
													<td><s:property value="username" /></td>
													<td><s:property value="fullname" /></td>
													<td><s:property value="title" /></td>
													<td><s:property value="email" /></td>
													<td>
														<s:property value="listGroupRoles"/>
													</td>
													<td style="min-width: 90px;"><s:if test="status == 0">
														Hoạt động
													</s:if> <s:if test="status == 1">
														Vô hiệu
													</s:if></td>
													<td style="text-align:center; min-width: 150px;">
													<s:url var="show" action="show" namespace="/web/user">
														<s:param name="userId">
															<s:property value="id"></s:property>
														</s:param>
													</s:url> <a href="${show}" class="btn btn-default btn-xs">
													Xem</a><%-- <a class="btn btn-default" data-toggle="modal" data-target="#myModal" username-detail=${username}
													  onclick="setSecssionObj('${fullname}','${title}','${email}','${status}','${username}','${phoneNumber}');">Xem </a> --%>
													<a class="btn btn-default btn-xs"
														href="link_update?id=<s:property value="id"/>">Sửa</a>
													<a class="btn btn-default btn-xs"
														onclick="return confirm('Bạn có chắc chắn muốn xóa người sử dụng này?')"
														href="delete?id=<s:property value="id"/>">Xóa</a></td>
														<td style="display: none;"><s:property value="phoneNumber"/></td>
												</tr>
											</s:iterator>
										</tbody>
									</table>
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
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Thông Tin Chi Tiết NSD</h4>
					</div>
					<div class="modal-body">
					<div class="row">
						<form style="margin-left: 70px;">
							<div class="col-sm-5">
								<label>Tên Đăng Nhập</label>
								<s:textfield id="username" name="user.username" readonly="true" 
									cssClass="form-control col-sm-4"  />
							</div>
							<div class="col-sm-5">
								<label>Email</label>
								<s:textfield id="email" name="user.email" readonly="true" 
									cssClass="form-control col-sm-4" />
							</div>
							<div class="col-sm-5">
								<label>Tên NSD</label>
								<s:textfield id="nameNSD" name="user.fullname"
									cssClass="form-control col-sm-4" readonly="true" />
							</div>
							<div class="col-sm-5">
								<label>Số Điện Thoại</label>
								<s:textfield id="SDT" name="user.phoneNumber"
									cssClass="form-control col-sm-4" readonly="true" />
							</div>
							<div class="col-sm-5">
								<label>Chức Danh</label>
								<s:textfield id="title" name="user.title"
									cssClass="form-control col-sm-4" readonly="true" />
							</div>
							<div class="col-sm-5">
								<label>Trạng Thái</label>
								<s:textfield id="status" name="user.status"
									cssClass="form-control col-sm-4" readonly="true" />
							</div>
						</form>
						
						<div class="modal-footer" style="text-align: center;">
						<%-- <s:url var="reset" action="reset" namespace="/web/user">
							<s:param name="username">
								<s:property id="userreset" value="username"></s:property>
								<input id="userreset">
							</s:param>
						</s:url> --%>
						<a class="btn btn-default" id=btn-reset>ResetPassWord</a>
						<a class="btn btn-default" id="btn-bolock">Block User</a>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> 
					</div>
					</div>
					
				</div>
					
				</div>
			</div>
		</div>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/user/userdel.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/app.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/datatable/datatables.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#us-alert").fadeTo(2000, 500).slideUp(500, function() {
					$("#us-alert").slideUp(500);
				});
				$("#user-table").dataTable({
					"searching": false
				});
				history.pushState(null, null, $("#a-emp").attr("href"));
			});
		</script>
		
</body>
</html>