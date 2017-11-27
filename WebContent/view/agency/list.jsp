<%@ page language="java" contentType="text/html; charset=UTF-8"
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

<title>Quản lý chi nhánh</title>

<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/font-awesome/css/font-awesome.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/nprogress/nprogress.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/iCheck/skins/flat/green.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" />" />

<!-- Datatables -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/datatable/datatables.min.css"/>" />

<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/css/custom.min.css" />" />
</head>
<body class="nav-md">
	<div class="container body">
	<input type="hidden" id="ip-message" value="<s:property value='message'></s:property>"/>
		<div class="main_container">
			<!-- BEGIN HEADER -->
			<%@include file="/view/layout/header.jsp"%>
			<!-- END HEADER -->

			<!-- page content -->
			<div class="right_col" role="main">
			<div class="page-title">
					<div class="col-lg-6">
									<h3>Quản lý thông tin chi nhánh</h2>
								</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12" id="mainRateId">
						<div class="x_panel">
							
							<div id="filter" class="x_content">
								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="x_panel">
											<div class="x_content">
												<form id="formAgency"
													action="<s:url action = "find" namespace="/web/agency"/>"
													class="form-horizontal form-label-left" method="post">
													<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" />
													<div class="col-md-6">
														<div class="item form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12"
																for="firstName">Mã chi nhánh </label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<s:textfield class="form-control col-md-7 col-xs-12"
																	type="text" name="agency.code" />
															</div>
														</div>
														<div class="item form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12"
																for="firstName">Tên chi nhánh </label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<s:textfield class="form-control col-md-7 col-xs-12"
																	type="text" name="agency.name" />
															</div>
														</div>
													</div>
													<div class="col-md-6">
														<div class="item form-group">
															<label class="control-label col-md-4 col-sm-3 col-xs-12"
																for="lastName">Trạng thái chi nhánh </label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<%-- <select class="form-control" name="agency.actived">
																	<option value="-1">Tất cả</option>
																	<option value="1">Đang hoạt động</option>
																	<option value="0">Vô hiệu hóa</option>
																</select> --%>
																<s:select name="agency.actived"
																	class="form-control col-md-7 col-xs-12"
																	list="#{'-1':'----Tất cả---',
																			 '0':'Vô hiệu hóa',
																			 '1':'Đang hoạt động'
																			 }">
																</s:select>
															</div>
														</div>
														<div class="item form-group">
															<label class="control-label col-md-4 col-sm-3 col-xs-12"
																for="email">Nhân viên tư vấn </label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<s:textfield class="form-control col-md-7 col-xs-12"
																	type="text" name="agency.consultantName" />
															</div>
														</div>
													</div>
													<div class="col-md-12" style="text-align: end;">
														<button id="find" type="submit" class="btn btn-default">Tìm
															kiếm</button>
														<a class="btn btn-default"
															href="<s:url action="new" namespace="/web/agency" />">Thêm
															Mới</a> <a  data-toggle="modal" data-target="#modal-agency-up" class="btn btn-default" style="margin-right: 104px;">Tải lên</a>
													</div>
													</form>
											</div>
										</div>
									</div>
								</div>
							</div>
							<s:if test="hasActionMessages()">
								<div class="alert alert-success col-xs-12 col-sm-12 col-md-12"
									id="errorLogin">
									<s:actionmessage />
								</div>
							</s:if>
							<s:if test="hasActionErrors()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
										style="text-align: left;" id="errorLogin">
										<s:actionerror />
									</div>
								</s:if>
							<div id="div1" class="x_content">
								<table id="agency-table"
									class="table table-striped table-bordered table-hover"
											style="table-layout: fixed; margin-left: 5px;"
											cellpadding="10">
									<thead>
										<tr>
											<th style="width: 30px;">STT</th>
											<th>Mã chi nhánh</th>
											<th>Tên chi nhánh</th>
											<th>Nhân viên tư vấn</th>
											<th>Trạng thái</th>
											<th>Chức năng</th>
										</tr>
									</thead>
									<tbody>
										<s:iterator value="agencies" var="agency" status="stt">
											<tr>
												<input class="agency-id" id="agency-id" type="hidden"
													value="<s:property value='id'/>" />
													
												<td style="text-align:center;" class="agency-no">
													<s:property value="%{#stt.index + 1}" />
												</td>
												
												<td  class="agency-code" >
													<span style="word-wrap:break-word;">
														<s:property value="code"></s:property>
													</span>
												</td>
												
												<td class="agency-name">
													<span style="word-wrap:break-word;">
														<s:property value="name"></s:property>
													</span>
												</td>
												
												<td class="agency-consultant">
													<span style="word-wrap:break-word;">
														<s:property value="consultantName"></s:property>
													</span>	
												</td>
												
												<td class="agency-active"><s:if test="%{actived}">
	                 						Đang hoạt động
                 						</s:if> <s:if test="%{!actived}">
	                 						Vô hiệu hóa
                 						</s:if></td>
												<td style="text-align: center;width:260px;">
													<!-- <button class="btn btn-default"
														data-toggle="modal" data-target="#deleteModal">Xóa</button> -->
													<s:url var="del" action="delete" namespace="/web/agency">
														<s:param name="id">
															<s:property value="id"></s:property>
														</s:param>
													</s:url> <a href="${del}" onclick="return confirm('Bạn có chắc chắn muốn xóa chi nhánh này?')"
													class="btn btn-default btn-xs">  Xóa
												</a>
													<s:url var="edit" action="edit" namespace="/web/agency">
														<s:param name="editCode">
															<s:property value="code"></s:property>
														</s:param>
													</s:url> <a href="${edit}" class="btn btn-default btn-xs"> Sửa
												</a>
												<s:url var="show" action="show" namespace="/web/agency">
														<s:param name="editCode">
															<s:property value="code"></s:property>
														</s:param>
													</s:url> <a href="${show}" class="btn btn-default btn-xs"> Xem
												</a>
												</td>
											<tr>
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
			<%@include file="/view/layout/footer.jsp"%>
			<!-- END FOOTER -->
		</div>

		<div id="deleteModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Xóa chi nhánh</h4>
					</div>
					<div class="modal-body">
						<h4>
							Có chắc chắn muốn xóa chi nhánh với mã: <span
								id="modal-agency-code"></span> ?
						</h4>
					</div>
					<div class="modal-footer">
						<a id="delete-submit" class="btn btn-danger">Xóa</a>
						<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- upload modal here  -->
	
	<div class="modal fade bs-example-modal-lg" id="modal-agency-up"
				tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-md">
					<div class="modal-content">

						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								Tải lên danh sách chi nhánh:
							</h4>
						</div>
						<div class="modal-body">
							<form id="form-upload-agency" action="<c:url value="/web/file/upload?${_csrf.parameterName}=${_csrf.token}"/>" method="post" enctype="multipart/form-data">
									 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							      <input type="file" name="myFile" id="fileagency" />
							   </form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">
								Thoát
							</button>
							<button type="button" id="btn-done-upload" class="btn btn-default">
								 Xong
							</button>
						</div>

					</div>
				</div>
			</div>


	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js" /></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/fastclick/lib/fastclick.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/nprogress/nprogress.js"></script>

	<!-- Datatables -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/datatable/datatables.min.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/iCheck/icheck.min.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/agency/list-agency.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#errorLogin").fadeTo(2000, 500).slideUp(5000, function() {
				$("#errorLogin").slideUp(500);
			});
			$("tr").each(function(){
				if(this.innerHTML.trim() == "") 
					this.remove();
			});
			$("#agency-table").dataTable({
				"searching": false
			});
			history.pushState(null, null, $("#a-ag").attr("href"));
		});
	</script>
</body>
</html>