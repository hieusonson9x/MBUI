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

<title>Quản lý bồi thường</title>

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
					<!-- <div class="title_left">
						<h3>Quản Lý Thông Tin Bồi Thường</h3>
					</div> -->
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div>
								<div class="col-lg-6">
									<h2>Danh sách thông tin bồi thường</h2>
								</div>
								<div style="text-align: end;">
									
								</div>
							</div>
							
							<s:if test="hasActionMessages()">
								<div class="alert alert-success col-xs-12 col-sm-12 col-md-12"
									id="errorLogin">
									<s:actionmessage />
								</div>
							</s:if>
							<div class="x_title">
								<form method="post" id="frmSearch" class="form-horizontal form-label-left"
									action="<s:url action = "search" namespace="/web/compensation"/>" style="margin-right: 145px;">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<div class="row">
										<div class="col-md-6">
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Số HĐBH</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control" placeholder="Số HĐBH" type="text"
														name="compensation.insurranceId" />
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Mã KH</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control" placeholder="Mã KH" type="text"
														name="compensation.customerCode" />
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Sản phẩm</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control" placeholder="Sản phẩm" type="text"
														name="compensation.product" />
												</div>
											</div>
											
										</div>
										<div class="col-md-6">
											<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Trạng thái bồi thường</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="compensation.statusCompensation">
															<option value="">----NO----</option>
															<option value="1">Quá trình yêu cầu bồi thường</option>
															<option value="2">Chấp nhận bồi thường</option>
															<option value="3">Từ chối bồi thường</option>
														</select> --%>
														<s:select name="compensation.statusCompensation"
															class="form-control col-md-7 col-xs-12"
															list="#{'':'Tất cả',
															 '1':'Quá trình yêu cầu bồi thường',
															 '2':'Chấp nhận bồi thường',
															 '3' : 'Từ chối bồi thường'}">
														</s:select>
													</div>
												</div>
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Tên KH</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control" placeholder="Tên KH" type="text"
														name="compensation.customerName" />
												</div>
											</div>
											
											<div class="item form-group">
												<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="argenName">Chi nhánh phát hành</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<s:textfield class="form-control" 
													placeholder="Chi nhánh phát hành" 
													type="text"
													name="compensation.argenName" />
												</div>
											</div>
										</div>
									</div>
									<table style="float: right;">
										<tr>
											<td>
											<input type="submit" value="Tìm kiếm"
												class="btn btn-default">
											<a class="btn btn-default" style="margin-right: 10px;"
										href="<s:url action="getFromAdd" namespace="/web/compensation" />">Khai báo</a>
											</td>
										</tr>
									</table>
								</form>
								<div class="clearfix"></div>
							</div>
							
							
							
							<div class="x_content">
								<table id="compensation-table" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th style="text-align: center;">STT</th>
											<th>Mã khách hàng</th>
											<th>Số HĐBH</th>
											<th>Ngày khai báo</th>
											<th>Loại sự kiện</th>
											<th>Loại lý do</th>
											<th>Trạng thái bồi thường</th>
											<th>Ngày giải quyết</th>
											<th>Số tiền bồi thường</th>
											<th>Chức năng</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="k" value="0"></c:set>
										<s:iterator value="compensations">
											<tr>
												<td style="text-align: center;">${k=k+1}</td>
												<td><s:property value="customerCode" /></td>
												<td><s:property value="insurranceId" /></td>
												<td><s:property value="declareDate" /></td>
												<td>
													<s:if test="eventType == 1">
														Tử vong
													</s:if>
													<s:if test="eventType == 2">
														Thương tật toàn bộ vĩnh viễn 
													</s:if>
												</td>
												<td>
													<s:if test="reasonType==1">
														Do Tai nạn
													</s:if>
													<s:if test="reasonType==2">
														Không do tai nạn
													</s:if>
												</td>
												<td>
													<s:if test="statusCompensation==1">
														Quá trình yêu cầu bồi thường
													</s:if>
													<s:if test="statusCompensation==2">
														Chấp nhận bồi thường
													</s:if>
													<s:if test="statusCompensation==3">
														Từ chối bồi thường
													</s:if>
												</td>
												<td><s:if test="resolveDate==null">
												</s:if>
												<s:else>
												<s:property value="resolveDate" />
												</s:else>
												</td>
												<td><s:property value="compensationMoney" /></td>
												<td style="text-align: center;width:10%;"><s:url var="show"
														action="show" namespace="/web/compensation">
														<s:param name="getId">
															<s:property value="id"></s:property>
														</s:param>
													</s:url> <a href="${show}" class="btn btn-default btn-xs"> Xem
												</a> <s:url var="edit" action="getFromUpdate"
														namespace="/web/compensation">
														<s:param name="editId">
															<s:property value="id"></s:property>
														</s:param>
													</s:url> <a href="${edit}" class="btn btn-default btn-xs"> Sửa
												</a></td>
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
			$("tr").each(function(){
				if(this.innerHTML.trim() == "") 
					this.remove();
			});
			$("#compensation-table").dataTable({
				"searching": false
			});
			$("#errorLogin").fadeTo(2000, 500).slideUp(5000, function() {
				$("#errorLogin").slideUp(500);
			});
			history.pushState(null, null, $("#a-compen").attr("href"));
		});
	</script>
</body>
</html>