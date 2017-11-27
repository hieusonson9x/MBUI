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

    <title>Quản lý khách hàng</title>

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
								<h2>Xem thông tin khách hàng </h2>
								<s:if test="hasActionMessages()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
										style="text-align: center;" id="errorLogin">
										<s:actionmessage />
									</div>
								</s:if>
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
														<input class="form-control col-md-7 col-xs-12" value="<s:property value="customer.customerCode"/>" type="text" readonly="readonly"
															 name="customer.customerCode">
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="fullname">Tên Khách Hàng<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input readonly="readonly" type="text" name="customer.fullname" value="<s:property value="customer.fullname"/>"
															placeholder="tên khách hàng" class="form-control col-md-7 col-xs-12" id="fullname">
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="birthday">Ngày Sinh <span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:date name="customer.birthday" var="formattedVal" format="dd/MM/yyyy"/>
														<input readonly="readonly" type="text" name="customer.birthday" value="<s:property value="%{#formattedVal}"/>"
															placeholder="Ngày Sinh" class="form-control col-md-7 col-xs-12" id="birthday">
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="sex">Giới Tính<span class="required">*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12" readonly="readonly">
														<s:if test="customer.sex == 0">
															<label class="radio-inline"> <input type="radio"
																value="1" name="customer.sex" disabled>nam
															</label>
															<label class="radio-inline"> <input type="radio"
																value="0" name="customer.sex" checked="checked" disabled>nữ
															</label>
														</s:if>
														<s:if test="customer.sex == 1">
															<label class="radio-inline"> <input type="radio" disabled checked="checked"
																value="1" name="customer.sex">Nam
															</label>
															<label class="radio-inline"> <input disabled type="radio"
																value="0" name="customer.sex" >Nữ
															</label>
														</s:if>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="cmtnd">Số Giấy Tờ Tùy Thân <span class="required">*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input readonly="readonly" type="text" id="cmtnd" name="customer.cmtnd" value="<s:property value="customer.cmtnd"/>"
															placeholder="Số Giấy Tờ Tùy Thân" class="form-control col-md-7 col-xs-12">
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="cmtnd">Loại giấy tờ tùy thân</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:if test="customer.typeCard == 1">
															<input readonly="readonly" type="text" value="CMT"  class="form-control col-md-7 col-xs-12">
														</s:if>
														<s:if test="customer.typeCard == 2">
															<input readonly="readonly" type="text" value="Hộ chiếu"  class="form-control col-md-7 col-xs-12">
														</s:if>
														<s:if test="customer.typeCard == 3">
															<input readonly="readonly" type="text" value="Thẻ căn cước"  class="form-control col-md-7 col-xs-12">
														</s:if>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">Ngày Cấp
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
													<s:date name="customer.dateRange" var="formattedVal" format="dd/MM/yyyy"/>
													<input readonly="readonly" class="form-control" type="text" 
													value="<s:property value="customer.dateRange"/>" name="customer.dateRange" id="dateRange"/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="issuedBy">Nơi Cấp
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input readonly="readonly" type="text" name="customer.issuedBy" value="<s:property value="customer.issuedBy"/>"
															 class="form-control col-md-7 col-xs-12" id = "issuedBy">
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="address">Địa Chỉ
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input readonly="readonly" type="text" name="customer.address" value="<s:property value="customer.address"/>"
															 class="form-control col-md-7 col-xs-12" id = "address">
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="phoneNumber">Số Điện Thoại
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input  readonly="readonly" type="text" name="customer.phoneNumber" value="<s:property value="customer.phoneNumber"/>"
															 class="form-control col-md-7 col-xs-12" id = "phoneNumber">
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="phoneNumber">Trạng thái hôn nhân
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="customer.mergeStatus" value="<s:property value="customer.mergeStatus"/>"
														 class="form-control col-md-7 col-xs-12" readonly="readonly" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="phoneNumber">Nghề nghiệp
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="customer.job" value="<s:property value="customer.job"/>"
													readonly="readonly" class="form-control col-md-7 col-xs-12" id = "phoneNumber" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="phoneNumber">Nhóm nghề
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="customer.groupJob" value="<s:property value="customer.groupJob"/>"
														readonly="readonly" class="form-control col-md-7 col-xs-12" id = "phoneNumber" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="phoneNumber">Thu nhập bình quân
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="customer.averageIncome" value="<s:property value="customer.averageIncome"/>"
														readonly="readonly" class="form-control col-md-7 col-xs-12" id = "phoneNumber" />
													</div>
												</div>
												<div class="ln_solid"></div>
											</div>
										</div>
									</div>
									<div class="form-group" style="text-align: center;">
										<div class="col-md-6 col-md-offset-3">
											<a class="btn btn-default"
												href="<s:url action='list' namespace='/web/customer'/>"> <i
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
	<script type="text/javascript">
		$(document).ready(function() {
			$("#errorLogin").fadeTo(2000, 500).slideUp(5000, function() {
				$("#errorLogin").slideUp(500);
			});
		});
	</script>
</body>
</html>