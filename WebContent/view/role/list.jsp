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


<title>Quản lý  quyền</title>

<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/font-awesome/css/font-awesome.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/css/custom.min.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/css/view/product/product.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/vendor/datatable/datatables.min.css"/>" />
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- BEGIN HEADER -->
			<%@include file="/view/layout/header.jsp"%>
			<!-- END HEADER -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12" id="mainRateId">
						<div class="x_panel">
							<div class="x_title">
								<h2 class="col-md-7">Danh mục quyền</h2>
								<div class="clearfix"></div>
							</div>
							<s:if test="hasActionMessages()">
									<div class="alert alert-success col-xs-12 col-sm-12 col-md-12" style="text-align: center;"
										id="errorLogin">
										<s:actionmessage />
									</div>
								</s:if>
							<div id="div1" class="">
							<div>
								<div>
									<form method="post" id="frmSearch" action="<s:url action = "search" namespace="/web/role"/>">
									 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="row">
										<div class="col-lg-4">
											<label class="col-sm-4 control-label"
												style="padding-top: 7px;">Từ khóa:</label>
											<div class="col-sm-7">
												<s:textfield name="role.roleName"
													cssClass="form-control input-sm mb12" autofocus="autofocus"></s:textfield>
											</div>
										</div>
										<div class="col-lg-1">
											<s:submit value="Tìm kiếm" align="left"
												cssClass="btn btn-default" />
										</div>
									</div>
								</form>
								</div>
							</div>
								<table id="role-table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>STT</th>
											<th>Mã</th>
											<th>Tên</th>
											<th>Mô tả</th>
											<th>Trạng thái</th>
											<th>Chức năng</th>
										</tr>
									</thead>
									<tbody>
									    <c:set var="k" value="0"></c:set>
										<s:iterator value="roles">
											<tr>
												<td style="width:10px;">${k=k+1}</td>
												<td class="role-code" style="width: 100px;" 
												 ><s:property value="roleCode"></s:property></td>
												<td class="role-name"style="width: 150px;" ><s:property value="roleName"></s:property></td>
												<td class="role-action"><s:property value="action"></s:property></td>
												<td style="min-width: 90px;">
													<s:if test="status == 1">
														Hoạt động
													</s:if>
													<s:else>
														Vô hiệu
													</s:else>
												</td>
												<td style="text-align: center; min-width: 90px;" >
													<s:url var="edit" action="edit" namespace="/web/role">
														<s:param name="editCode">
															<s:property value="roleCode"></s:property>
														</s:param>
													</s:url> <a href="${edit}" class="btn btn-default btn-xs"> Sửa
												</a>
												<s:url var="show" action="show" namespace="/web/role">
														<s:param name="editCode">
															<s:property value="roleCode"></s:property>
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
						<h4 class="modal-title">Xóa Quyền</h4>
					</div>
					<div class="modal-body">
						<h4>Có chắc chắn muốn xóa quyền này không</h4>
						<div>
							<label>Mã quyền:</label> <span id="modal-role-code"></span>
						</div>
						<div>
							<label>Tên quyền: </label> <span id="modal-role-name"></span>
						</div>
						<div>
							<label>Hành động: </label> <span id="modal-role-action"></span>
						</div>
						<br />
						<p>* Lưu ý: Mọi quyền con sẽ bị xóa theo khi xóa quyền!</p>
					</div>
					<div class="modal-footer">
						<a id="delete-submit" class="btn btn-default">Xóa</a>
						<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/moment.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/locale/vi.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/app.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/datatable/datatables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/view/role/role.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#errorLogin").fadeTo(2000, 500).slideUp(500, function() {
				$("#errorLogin").slideUp(1000);
			});
			$("tr").each(function(){
				if(this.innerHTML.trim() == "") 
					this.remove();
			});
			$("#role-table").dataTable({
				"searching": false
			});
			history.pushState(null, null, $("#a-q").attr("href"));
		});
	</script>
</body>
</html>