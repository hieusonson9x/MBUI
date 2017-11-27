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

    <title>Quản lý góp phí</title>

    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />" />
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/font-awesome/css/font-awesome.min.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" />" />
    <!-- Custom Theme Style -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/custom.min.css" />" />
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/view/product/product.css" />" />
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
						<h3>Quản Lý Thông Tin Khách Hàng</h3>
					</div> -->
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="container">
								<h2>Xem Thông Tin Góp Phí</h2>
								<form id="fromAdd"
									action="<s:url action = "updateCustomer" namespace="/customer"/>"
									class="form-horizontal form-label-left" method="post">
									<div class="tab-content">
										<div id="home" class="tab-pane fade in active">
											<div class="x_content">
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="customer-code">Mã Khách Hàng<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control col-md-7 col-xs-12" value="<s:property value="payment.customerCode"/>" type="text" 
															readonly="readonly" name="payment.customerCode">
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="fullname">Số Hợp Đồng Bảo Hiểm<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="" value="<s:property value="payment.numberInsurrance"/>"
															readonly="readonly" class="form-control col-md-7 col-xs-12" id="fullname">
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="birthday">Ngày bắt đầu thu phí<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:date name="payment.paymentStart" var="formattedVal" format="dd/MM/yyyy"/>
														<input type="text" name="payment.paymentStart" value="<s:property value="%{#formattedVal}"/>"
															readonly="readonly" class="form-control col-md-7 col-xs-12" id="birthday">
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="birthday">Ngày Thu Phí <span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:date name="payment.paymentDate" var="formattedVal" format="dd/MM/yyyy"/>
														<input type="text" name="payment.paymentDate" value="<s:property value="%{#formattedVal}"/>"
															readonly="readonly" class="form-control col-md-7 col-xs-12" id="birthday">
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">Ngày Kết Thúc Thu Phí<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
													<s:date name="payment.paymentEnd" var="formattedVal" format="dd/MM/yyyy"/>
													<input class="form-control" readonly="readonly" type="text" 
													value="<s:property value="%{#formattedVal}"/>" name="payment.paymentEnd" id="dateRange"/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="issuedBy">Dư nợ hiện tại<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														
														<s:hidden value="payment.outstandingBalance"/>
														
														<s:set var="outstandingBalance"><s:property value="payment.outstandingBalance"/></s:set>
														<input readonly="readonly" value="${outstandingBalance}" class="form-control col-md-7 col-xs-12">
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="address">Số tiền phí bảo hiểm<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="payment.theAmountOfPremium" value="<s:property value="payment.theAmountOfPremium"/>"
															readonly="readonly" class="form-control col-md-7 col-xs-12" id = "address">
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="phoneNumber">Số tiền hoa hồng<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="payment.amountOfCommission" value="<s:property value="payment.amountOfCommission"/>"
															readonly="readonly" class="form-control col-md-7 col-xs-12" id = "phoneNumber">
													</div>
												</div>
												<div class="ln_solid"></div>
											</div>
										</div>
									</div>
									<div class="form-group" style="text-align: center;">
										<div class="col-md-6 col-md-offset-3">
											<a class="btn btn-default"
												href="<s:url action='list' namespace='/web/payment'/>"> <i
												class="fa fa-times" aria-hidden="true"></i> Đóng
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/moment.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/locale/vi.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	
</body>
</html>