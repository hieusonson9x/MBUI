2<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Thêm mới vai trò</title>

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
	href="<c:url value="/resource/css/grouprole/edit.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/css/view/product/product.css" />" />
</head>
<body class="nav-md">
	<s:token />
	<div class="container body">
		<div class="main_container">
			<!-- BEGIN HEADER -->
			<%@include file="/view/layout/header.jsp"%>
			<!-- END HEADER -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>Thêm mới nhóm quyền</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<div class="" role="tabpanel" data-example-id="togglable-tabs">
									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab"
											href="#tab_content1">Thông tin chung</a></li>
										<li><a data-toggle="tab" href="#tab_content2">Danh
												sách quyền</a></li>
									</ul>
									<div id="myTabContent" class="tab-content">
										<div role="tabpanel" class="tab-pane fade active in"
											id="tab_content1" aria-labelledby="home-tab">
											<s:if test="hasActionMessages()">
												<div
													class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
													style="text-align: center;" id="errorLogin">
													<s:actionmessage />
												</div>
											</s:if>

											<s:if test="hasActionErrors()">
												<div
													class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
													style="text-align: left;" id="errorLogin">
													<s:actionerror />
												</div>
											</s:if>
											<form id="form-role"
												action="<s:url action = "add" namespace='/web/grouprole'/>"
												data-parsley-validate
												class="form-horizontal form-label-left" method="post">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">Mã
														nhóm quyền<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control col-md-7 col-xs-12"
															type="text" name="groupRole.groupRoleCode"
															value="%{groupRole.groupRoleCode}"
															id="id-group-role-code" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">Tên nhóm quyền<span
														class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield type="text" name="groupRole.groupRoleName"
															value="%{groupRole.groupRoleName}"
															class="form-control col-md-7 col-xs-12"
															required="required" id="id-name-group" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">Nhóm
														quyền cha </span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="hidden" id="parentGroupRole11" value="<s:property value="parentGroupRole"/>">
														<input id="parentCode"
															value="<s:property value='groupRole.parent.groupRoleCode'/>"
															autocomplete="off" list="parentCodes" name="parentCode"
															class="form-control col-md-7 col-xs-12">
														<datalist id="parentCodes">
															<s:iterator value="groupRoles">
																<option  value="<s:property value='groupRoleCode'/>">
																	<s:property value='groupRoleName' />
																</option>
															</s:iterator>
														</datalist>
														<!-- <input type="hidden" name="parentCode" id="parentCode-hidden"> -->
													</div>
												</div>
												
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">Mô tả</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<textarea class="form-control col-md-7 col-xs-12" 
															rows="5" 
															id="reason" 
															name="groupRole.description"
															>
														</textarea>
													</div>
												</div>
												
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">Trạng
														thái</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12"
														style="margin-top: 7px;">
														<p>
															<s:if test="%{groupRole.active}">
																<input type="radio" class="flat" name="groupRole.active"
																	value="1" checked /> Hoạt động
						                        <input type="radio" class="flat"
																	name="groupRole.active" value="0" />
						                        Vô hiệu
						                        </s:if>
															<s:else>
																<input type="radio" class="flat" name="groupRole.active"
																	value="1" checked /> Hoạt động
						                        	<input type="radio" class="flat"
																	name="groupRole.active" value="0" /> Vô hiệu
						                        </s:else>
														</p>
													</div>
												</div>

												<div class="ln_solid"></div>
												<div class="form-group" style="text-align: right;">
													<div class="col-md-6 col-md-offset-3">
														<button id="send" class="btn btn-default"
															onclick="saveNewGroupRole()" type="button">
															 Lưu
														</button>
														<a class="btn btn-default"
															href="<s:url action='getall' namespace='/web/grouprole'/>">
															 Đóng
														</a>
													</div>

												</div>
											</form>
										</div>
										<div role="tabpanel" class="tab-pane fade" id="tab_content2"
											aria-labelledby="profile-tab">
											<div id="div1" class="x_content table-responsive">
												<table id="datatable"
													class="table table-striped table-hover table-bordered">
													<col width="300">
													<thead>
														<tr>
															<th bgcolor="#E1F5FE">Mã</th>
															<th bgcolor="#E1F5FE" colspan="2">Tên</th>

														</tr>
													</thead>
													<tbody id="tbl-tbody-role">
														<s:iterator value="roles">
															<tr>
																<td><s:property value="roleCode"></s:property></td>
																<td colspan="2"><s:property value="roleName"></s:property></td>
															<tr>
														</s:iterator>
													</tbody>
												</table>
												<div style="text-align: center;">
													<button type="button" class="btn btn-default"
														data-toggle="modal" data-target="#modal-role"
														style="text-align: center">Thay đổi</button>
												</div>

											</div>

										</div>
									</div>
								</div>

								<div></div>


							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->



			<!-- All modal box here -->
			<div class="modal fade bs-example-modal-lg" id="modal-role"
				tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-md">
					<div class="modal-content">

						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								Danh sách quyền của vai trò:
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
									<s:iterator value="allRoles">
										<li>
											<p>
												<s:if test="%{checkInList(roles)}">
													<input type="checkbox" class="roled flat"
														rolecode="<s:property value='roleCode'/>"
														rolename="<s:property value='roleName'/>" checked>
												</s:if>
												<s:else>
													<input type="checkbox" class="roled flat"
														rolecode="<s:property value='roleCode'/>"
														rolename="<s:property value='roleName'/>">
												</s:else>
												<strong> <s:property value='roleCode' /> :
												</strong>
												<s:property value='roleName' />
											</p>
										</li>
									</s:iterator>
								</ul>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">
								 Thoát
							</button>
							<button type="button" id="btn-done"  class="btn btn-default">
						 Xong
							</button>
						</div>

					</div>
				</div>
			</div>

			<!-- Modal user here -->


			<!-- BEGIN FOOTER -->
			<%@include file="/view/layout/footer.jsp"%>
			<!-- END FOOTER -->
		</div>
	</div>

	<script src="<c:url value = "/resource/js/jquery.min.js" />"></script>
	<script src="<c:url value = "/resource/js/jquery.validate.min.js" />"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/fastclick/lib/fastclick.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/nprogress/nprogress.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/gauge.js/dist/gauge.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/iCheck/icheck.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/vendor/jquery.tagsinput/src/jquery.tagsinput.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/grouprole/addgr.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/app.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			var code = $('#parentGroupRole11').val();
			$('#parentCode').val(code);
			
			$.validator.addMethod("CODE", function(value, element) {
				return this.optional(element) || /^[a-z0-9]+$/i.test(value);
			}, "Không được nhập các kí tự đặc biệt");
			var validator = $("#form-role").validate({
				rules : {
					"groupRole.groupRoleCode" : {
						required : true,
						maxlength : 20,
						CODE : "required CODE"
					},
					"groupRole.groupRoleName" : {
						required : true,
						maxlength : 200
					},
					"groupRole.active" : {
						required : true,
						maxlength : 50
					},
					"groupRole.description" :{
						maxlength : 500
					}
				},
				messages : {
					"groupRole.groupRoleCode" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 20 kí tự"
					},
					"groupRole.groupRoleName" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 200 kí tự"
					},
					"groupRole.active" : {
						required : "Trường này không được để trống",
						maxlength : "Trường phải nhỏ hơn 50 kí tự"
					},
					"groupRole.description" :{
						maxlength : "Trường phải nhỏ hơn 500 kí tự"
					}
				}
			});
		});
	</script>
<script type="text/javascript">
		/*NHVIET add start 2017-10-23 */
 		window.onload = xulyTextArea;
 		
 		function xulyTextArea(){
 			var textArea = $('#reason').val();
 			var result = textArea.trim(" ","");
 			$('#reason').val(result);
 		}
 		/*NHVIET add End 2017-10-23 */
 	</script>
</body>
</html>