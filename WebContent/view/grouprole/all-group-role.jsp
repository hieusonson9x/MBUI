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

<title>Quản lý nhóm quyền</title>

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
	href="<c:url value="/resource/css/dataTable.css" />" />

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
								<h2 >Quản lý nhóm quyền </h2>

								<div class="clearfix"></div>
							</div>
							<div>
								<form method="post" id="frmSearch" action="<s:url action='search' namespace='/web/grouprole'/>">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="row">
									<div class="col-lg-6">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											style="padding-top: 7px;width: 140px">Mã nhóm quyền:</label>
										<div class="col-sm-6">
											<s:textfield name="groupRole.groupRoleCode"
												cssClass="form-control input-sm mb12" autofocus="autofocus"></s:textfield>
										</div>
									</div>
									<div class="col-lg-6">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											style="padding-top: 7px;width:148px">Tên Nhóm quyền:</label>
										<div class="col-sm-6">
											<s:textfield name="groupRole.groupRoleName"
												cssClass="form-control input-sm mb12" autofocus="autofocus"></s:textfield>
										</div>
									</div>
									
								</div>
								<br>
								<div class="row">
									<div class="col-lg-6">
										<label style="padding-top: 7px;width: 140px"
											class="control-label col-md-3 col-sm-3 col-xs-12">Trạng
											Thái </label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<s:select name="statusCheckBox"
															class="form-control col-md-7 col-xs-12"
															list="#{'-1':'----Tất cả---',
															 '0':'Hoạt động',
															 '1':'Vô hiệu'
															 }">
											</s:select>
										</div>
									</div>
										<div class="col-lg-6">
										
										<div class="col-lg-6">
										
												<div class="col-sm-4">
													<s:submit 
														value="Tìm kiếm" 
														align="left"
														style="margin-top: 4px;margin-left:138px;"
														cssClass="btn btn-default" 
													/>
												</div>
												
												<div class="col-sm-4">
													<a style="margin-top: 4px;margin-left:232px;" 
														class="btn btn-default "
														href="<s:url action='formadd' namespace='/web/grouprole'/>">
														Thêm mới 
													</a>
												</div>
										</div>
									</div>
								</div>
									
								</form>
						<div class="clearfix"></div>
							</div>

							<div id="div1" class="">
								<s:if test="hasActionMessages()">
									<div class="alert alert-success col-xs-12 col-sm-12 col-md-12"
										style="text-align: left;" id="errorLogin">
										<s:actionmessage />
									</div>
								</s:if>
								<s:if test="hasActionErrors()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
										style="text-align: left;" id="errorLogin">
										<s:actionerror />
									</div>
								</s:if>

								<table id="table-group"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th style="text-align: center; font-size:14px;width:30px;">STT</th>
											<th style="text-align: center; font-size:14px;width:100px;">Mã</th>
											<th  style="text-align: center; font-size:14px;width:200px;">Tên</th>
											<th  style="text-align: center; font-size:14px;width:150px;">Nhóm quyền cha</th>
											<th  style="text-align: center; font-size:14px;width:200px;">Mô tả</th>
											<th  style="text-align: center; font-size:14px;width:150px;">Trạng thái</th>
											<th  style="text-align: center; font-size:14px;width:150px;">Chức năng</th>
										</tr>
									</thead>
									<tbody id="body-group">
										<c:set var="k" value="0"></c:set>
										<s:iterator value="groupRoles">
											<tr class="row-role">
												<td style="text-align: center;">${k=k+1}</td>
												<td><s:property value="groupRoleCode"></s:property></td>
												<td><s:property value="groupRoleName"></s:property></td>
												<td><s:property value="parent.groupRoleName"></s:property></td>
												<td><s:property value="description" /></td>
												<td><s:if test="%{active}">
                                   						Hoạt động
                                   					</s:if> <s:else>
                                   						Vô hiệu
                                   					</s:else></td>
												<td style="text-align: center;min-width: 150px"><s:url var="view" action="view"
														namespace="/web/grouprole">
														<s:param name="groupRoleCode">
															<s:property value="groupRoleCode"></s:property>
														</s:param>
													</s:url> <a href="${view }" class="btn btn-default btn-xs">  Xem
												</a> <s:url var="edit" action="edit" namespace="/web/grouprole">
														<s:param name="groupRoleCode">
															<s:property value="groupRoleCode"></s:property>
														</s:param>
													</s:url> <a href="${edit}" class="btn btn-default btn-xs">  Sửa
												</a> <s:url var="del" action="del" namespace="/web/grouprole">
														<s:param name="groupRoleCode">
															<s:property value="groupRoleCode"></s:property>
														</s:param>
													</s:url> <a href="${del}" onclick="return confirm('Bạn có chắc chắn muốn xóa nhóm quyền này?')" class="btn btn-xs btn-default"
													code="<s:property value="groupRoleCode"/>">  Xóa
												</a></td>
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
		<!-- /page content -->

		<!-- BEGIN FOOTER -->
		<%@include file="/view/layout/footer.jsp"%>
		<!-- END FOOTER -->

	</div>

    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/fastclick/lib/fastclick.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/nprogress/nprogress.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/gauge.js/dist/gauge.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/iCheck/icheck.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/datatable/datatables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/grouprole/viewall.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>