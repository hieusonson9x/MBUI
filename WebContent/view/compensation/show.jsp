<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Xem  Thông tin bồi thường</title>

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
<c:set var = "sotienboithuong" value = "${ compensation.compensationMoney}" />
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
							<div class="container">
								<h2>Xem thông tin bồi thường</h2>
								<s:if test="hasActionMessages()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
										style="text-align: center;" id="errorLogin">
										<s:actionmessage />
									</div>
								</s:if>
								<form id="fromAdd" style="margin-right: 145px;"
									action="<s:url action="add" namespace="/web/compensation" />"
									class="form-horizontal form-label-left" method="post">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<div class="x_content">
										<div class="row">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Mã KH<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control"
															value="<s:property value="compensation.customerCode"/>"
															readonly="readonly" type="text"
															name="compensation.customerCode" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày xảy ra sự kiên<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="date form-control" readonly="readonly"
															value="<s:property value="compensation.eventDate"/>" type="text"
															name="compensation.eventDate" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Loại sự kiện<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:if test="compensation.eventType==1">
															<input class="date form-control"
															 type="text" value="Tử vong" readonly="readonly"/>
														</s:if>
														<s:if test="compensation.eventType==2">
															<input class="date form-control"
															 type="text" value="Thương tật toàn bộ vĩnh viễn" readonly="readonly"/>
														</s:if>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Nguyên Nhân</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" readonly="readonly"
															type="text" name="compensation.reason" 
															value="<s:property value="compensation.reason"/>"/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày giải quyết</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:if test="compensation.resolveDate==null">
															<input class="date form-control"
															readonly="readonly" type="text"
															name="compensation.resolveDate" 
															value=""/>
														</s:if>
														<s:else>
														<input class="date form-control"
															readonly="readonly" type="text"
															name="compensation.resolveDate" 
															value="<s:property value="compensation.resolveDate"/>"/>
														</s:else>
														
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày duyệt bồi thường</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
													<s:if test="compensation.compensationDate==null">
													<input class="date form-control"
															readonly="readonly" type="text"
															name="compensation.compensationDate" 
															value=""/>
													</s:if>
													<s:else>
													<input class="date form-control"
															readonly="readonly" type="text"
															name="compensation.compensationDate" 
															value="<s:property value="compensation.compensationDate"/>"/>
													</s:else>
														
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày nhận bồi thường</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:if test="compensation.dateOfCompensation == null">
															<input class="date form-control"
															readonly="readonly" type="text"
															name="compensation.dateOfCompensation" >
														</s:if>
														<s:else>
															<input class="date form-control"
															readonly="readonly" type="text"
															name="compensation.dateOfCompensation" 
															value="<s:property value="compensation.dateOfCompensation"/>"/>
														</s:else>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Số HĐBH<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" readonly="readonly"
															type="text" name="compensation.insurranceId"
															value="<s:property value="compensation.insurranceId"/>" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày khai báo<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="date form-control"
															readonly="readonly" type="text"
															name="compensation.declareDate" 
															value="<s:property value="compensation.declareDate"/>"/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Loại lý do<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:if test="compensation.reasonType==1">
															<input type="text" readonly="readonly"
															value="Do Tai nạn" class="form-control">
														</s:if>
														<s:if test="compensation.reasonType==2">
															<input type="text" readonly="readonly"
															value="Không do tai nạn" class="form-control">
														</s:if>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Chấp nhận bồi thường</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:if test="compensation.acceptCompensation=='yes'">
															<input class="form-control"
															readonly="readonly" type="text"
															name="compensation.statusCompensation" 
															value="Đồng ý"/>
														</s:if>
														<s:if test="compensation.acceptCompensation=='no'">
															<input class="form-control"
															readonly="readonly" type="text"
															name="compensation.statusCompensation" 
															value="Không đồng ý"/>
														</s:if>
														<s:if test="compensation.acceptCompensation==null">
														<input class="form-control"
															readonly="readonly" type="text"
															name="compensation.statusCompensation" 
															value=""/>
														</s:if>
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="compensation.acceptCompensation">
															<option value="">---NO---</option>
															<option value="yes">Đồng ý</option>
															<option value="no">không đồng ý</option>
														</select> --%>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Lý do từ chối</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" readonly="readonly"
															type="text" name="compensation.reasonRefuse" 
															value="<s:property value="compensation.reasonRefuse"/>"/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Số tiền bồi thường<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control"
															readonly="readonly" type="text"
															name="compensation.compensationMoney" 
															value="<fmt:formatNumber type = "number" 
         															maxFractionDigits = "3" value = "${sotienboithuong}" />"/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Trạng thái bồi thường<span
														class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:if test="compensation.statusCompensation==1">
															<input class="form-control"
															readonly="readonly" type="text"
															name="compensation.statusCompensation" 
															value="Quá trình yêu cầu bồi thường"/>
														</s:if>
														<s:if test="compensation.statusCompensation==2">
															<input class="form-control"
															readonly="readonly" type="text"
															name="compensation.statusCompensation" 
															value="Chấp nhận Đơn"/>
														</s:if>
														<s:if test="compensation.statusCompensation==3">
															<input class="form-control"
															readonly="readonly" type="text"
															name="compensation.statusCompensation" 
															value="Từ chối bồi thường"/>
														</s:if>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group" style="margin-left: 346px;">
										<div class="row" style="text-align: right;">
											<a class="btn btn-default" style="margin-right: 25px;"
												href="<s:url action='list' namespace='/web/compensation'/>">
												 Đóng
											</a>
										</div>
									</div>
								</form>
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