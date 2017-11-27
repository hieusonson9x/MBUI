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
<style type="text/css">
.x_title span {
	color: white;
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
				<div class="page-title">
					<div class="col-lg-6">
									<h3>Danh Sách Hợp Đồng Bảo hiểm</h2>
								</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							
							<div class="x_title"></div>
							<div class="x_title">
								<form method="post" id="frmSearch" class="form-horizontal form-label-left"
									action="<s:url action = "i1search" namespace="/web/insurrance"/>" style="margin-right: 145px;">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<div class="row">
										<div class="col-md-6">
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Số HĐBH</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control" type="text"
														name="insurrance.numberInsurrance" />
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Mã KH</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control"  type="text"
														name="insurrance.customerCode" />
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Sản phẩm</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control" type="text"
														name="insurrance.product" />
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Mã chi nhánh phát hành</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control"  type="text"
														name="insurrance.agency" />
												</div>
											</div>
											
										</div>
										<div class="col-md-6">
											<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Trạng thái hợp đồng</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="insurrance.statusContract">
															<option value="0">----NO----</option>
															<option value="1">Hoạt động</option>
															<option value="2">Xử lý</option>
															<option value="3">Đang chờ xử lý</option>
															<option value="4">Từ chối</option>
															<option value="5">Hoãn lại</option>
															<option value="5">Chấm dứt</option>
														</select> --%>
														<s:select name="insurrance.statusContract"
															class="form-control col-md-7 col-xs-12"
															list="#{'0':'----Tất cả---',
															 '1':'Đang hiệu lực',
															 '2':'Xử lý',
															 '3' : 'Đang chờ xử lý',
															 '4' : 'Từ chối',
															 '5' : 'Tạm hoãn',
															 '6' : 'Chấm dứt',
															 '7' : 'Đợi duyệt'}">
														</s:select>
													</div>
												</div>
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Tên KH</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control" type="text"
														name="insurrance.customerName" />
												</div>
											</div>
										</div>
									</div>
									<table style="width: 100%;">
											<tr>
												<td style="float: right;">
													<input type="submit" value="Tìm kiếm" class="btn btn-default">
													<%-- <s:submit value="Tìm kiếm" cssClass="btn btn-default" /> --%>
												
													<a class="btn btn-default"
														href="<s:url action="i1getFromAdd" namespace="/web/insurrance" />">Thêm
															Mới</a>
													<a
														href="<s:url action="i2listRestore" namespace="/web/insurrance" />"
														class="btn btn-default"> </i>Khôi phục
													</a><a
														href="<s:url action="i3listVerify" namespace="/web/insurrance" />"
														class="btn btn-default ">Thẩm Định Thông Thường </a>
												</td>
											</tr>
										</table>
								</form>
								<div class="clearfix"></div>
								<s:if test="hasActionMessages()">
									<div class="alert alert-success col-xs-12 col-sm-12 col-md-12"
										style="text-align: left;" id="errorLogin">
										<s:actionmessage />
									</div>
								</s:if>
								<s:if test="hasActionErrors()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
										style="text-align: left;" id="errorLogin">
										<div>
											<s:actionerror />
										</div>
									</div>
								</s:if>
							</div>

							<div class="x_content">
								<table id="insurrance-table" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th style="text-align: center; font-size:14px;">STT</th>
											<th style="text-align: center; font-size:14px;">Số HĐBH</th>
											<th style="text-align: center; font-size:14px;">Mã khách hàng</th>
											<th style="text-align: center; font-size:14px;">Họ và tên</th>
											<th style="text-align: center; font-size:14px;">Mã khoản vay</th>
											<th style="text-align: center; font-size:14px;">Sản phẩm</th>
											<th style="text-align: center; font-size:14px;">Trạng thái hợp đồng</th>
											<th style="text-align: center; font-size:14px;width:200px">Chức năng</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="k" value="0"></c:set>
										<s:iterator value="insurrances">
											<tr>
												<td style="text-align: center;">${k=k+1}</td>
												<td>
												<s:if test="numberInsurrance==0">
												</s:if>
												<s:else>
													${numberInsurrance}
												</s:else>
												</td>
												<td><s:property value="customerCode" /></td>
												<td><s:property value="customerName" /></td>
												<td>
													<s:property value="contractNumber" />
												</td>
												<td><s:property value="product" /></td>
												<td style="width: 100px;"><s:if test="statusContract==1">
														Đang hiệu lực
													</s:if> <s:if test="statusContract==2">
														Xử lý
													</s:if> <s:if test="statusContract==3">
														Đang chờ xử lý
													</s:if> <s:if test="statusContract==4">
														Từ chối
													</s:if> <s:if test="statusContract==5">
														Tạm hoãn
													</s:if> <s:if test="statusContract==6">
														Chấm dứt
													</s:if>
													<s:if test="statusContract==7">
														Đợi duyệt
													</s:if>
													<s:if test="statusContract==8">
														Chấm dứt
													</s:if>
													</td>
												<td style="text-align: center;min-width: 230px;"><s:url var="show"
														action="i1show" namespace="/web/insurrance">
														<s:param name="getId">
															<s:property value="id"></s:property>
														</s:param>
													</s:url> <a href="${show}" class="btn btn-default btn-xs"> Xem
												</a> <s:url var="edit" action="i1getFromUpdate"
														namespace="/web/insurrance">
														<s:param name="editId">
															<s:property value="id"></s:property>
														</s:param>
													</s:url> <a href="${edit}" class="btn btn-default btn-xs"> Sửa
												</a>
												<s:url var="payment" action="getFromAddToInsurrance"
														namespace="/web/payment">
														<s:param name="editId">
															<s:property value="id"></s:property>
														</s:param>
													</s:url> <a href="${payment}" class="btn btn-default btn-xs"> Góp phí
												</a>
												</td>
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
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/user/userdel.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/app.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/datatable/datatables.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#insurrance-table").dataTable({
				"searching": false
			});
			$("#errorLogin").fadeTo(2000, 500).slideUp(500, function() {
				$("#errorLogin").slideUp(1000);
			});
			history.pushState(null, null, $("#a-ins").attr("href"));
		});
	</script>
</body>
</html>