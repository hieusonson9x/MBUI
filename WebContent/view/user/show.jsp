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

<title>Quản lý NSD</title>

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
			<%@include file="../layout/header.jsp"%>
			<!-- END HEADER -->

			<!-- page content -->
			<div class="right_col" role="main">

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="container">
								<h2>Xem Thông Tin NSD</h2>
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#home">Thông
											Tin NSD</a></li>
									<li><a data-toggle="tab" href="#menu3">Phân Quyền NSD</a></li>
								</ul>
								<div class="tab-content">
									<div id="home" class="tab-pane fade in active">
										<div class="x_content">
											<form id="fromAdd"
												action="<s:url action = "updateCustomer" namespace="/customer"/>"
												class="form-horizontal form-label-left" method="post">
												<div class="tab-content">
													<div id="home" class="tab-pane fade in active">
														<div class="x_content">
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="customer-code">Tên đăng nhập<span
																	class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input class="form-control col-md-7 col-xs-12"
																		value="<s:property value="user.username"/>"
																		type="text" readonly="readonly" name="user.username">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="fullname">Email<span class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input type="text" name="customer.fullname"
																		value="<s:property value="user.email"/>"
																		readonly="readonly"
																		class="form-control col-md-7 col-xs-12" id="fullname">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="birthday">Tên NSD<span class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input type="text" name="customer.fullname"
																		value="<s:property value="user.fullname"/>"
																		readonly="readonly"
																		class="form-control col-md-7 col-xs-12" id="fullname">
																</div>
															</div>

															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12">Số
																	điện thoại<span class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input type="text" name="customer.fullname"
																		value="<s:property value="user.phoneNumber"/>"
																		readonly="readonly"
																		class="form-control col-md-7 col-xs-12" id="fullname">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="issuedBy">Chức Danh </label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input type="text" name="customer.fullname"
																		value="<s:property value="user.title"/>"
																		readonly="readonly"
																		class="form-control col-md-7 col-xs-12" id="fullname">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="address">Trạng Thái<span class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<s:if test="user.status == 0">
																		<input type="text" value="Hoạt động" readonly="readonly"
																			class="form-control col-md-7 col-xs-12" id="address">
																	</s:if>
																	<s:if test="user.status == 1">
																		<input type="text" value="Vô hiệu"
																			readonly="readonly"
																			class="form-control col-md-7 col-xs-12" id="address">
																	</s:if>
																</div>
															</div>
															<div class="ln_solid"></div>
														</div>
													</div>
												</div>
												<div class="form-group" style="text-align: right;">
													<div class="col-md-6 col-md-offset-3">
														<a class="btn btn-default"
															onclick="return confirm('Bạn có chắc chắn muốn thay đổi mật khẩu người sử dụng này?')"
															href="resetPassword?id=<s:property value="user.id"/>">Khôi
															phục mật khẩu</a> <a class="btn btn-default"
															onclick="return confirm('Bạn có chắc chắn muốn khóa người sử dụng này?')"
															href="block?id=<s:property value="user.id"/>">Khóa</a> <a
															class="btn btn-default"
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
													<s:iterator value="groupRolesUser">
														<tr>
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
			</div>
			<!-- /page content -->

			<!-- BEGIN FOOTER -->
			<%@include file="../layout/footer.jsp"%>
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

</body>
</html>