<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Quản lý cấu hình sản phẩn</title>

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />" />
    
    <!-- Font Awesome -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/font-awesome/css/font-awesome.min.css" />" />

    <!-- NProgress -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/nprogress/nprogress.css" />" />
    
    <!-- iCheck -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/iCheck/skins/flat/green.css" />" />

    <!-- bootstrap-progressbar -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" />" />

    <!-- Custom Theme Style -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/custom.min.css" />" />
    
    <%-- <script src="<c:url value="/js/view/user/add.js"/>"></script> --%>
    <script src="<c:url value = "/js/jquery.validate.min.js" />"></script>
    <%-- <script src="<c:url value = "/js/jquery.min.js" />"></script> --%>
    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
</head>
<body class="nav-md">
<c:set var = "sotienbaohiemtoithieu" value = "${ product.minInsuranceMoney}" />
<c:set var = "sotienbaohiemtoida" value = "${ product.maxInsuranceMoney}" />
	<div class="container body">
	    <div class="main_container">
	        <!-- BEGIN HEADER -->
	        <%@include file="/view/layout/header.jsp" %>
	        <!-- END HEADER -->
	
	        <!-- page content -->
	       <div class="right_col" role="main">
					<div class="page-title">
						<div class="title_left">
							<h3>Xem thông tin sản phẩm</h3>
						</div>

					</div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_content">
									<s:if test="hasActionMessages()">
										<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12" id="errorLogin">
											<s:actionmessage />
										</div>
									</s:if>
									<div class="form-horizontal form-label-left">
										<div class="row">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Mã sản phẩm</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" placeholder="Mã sản phẩm" type="text" disabled="disabled" 
														name="product.code" value="<s:property value="product.code"/>">
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Ngày triển khai</label>
													<div class="col-md-6 col-sm-6 col-xs-12" >
														<s:date name="product.deploymentDate" var="formattedVal" format="dd/MM/yyyy"/>
														<input class="form-control" placeholder="Ngày triển khai" type="text" disabled="disabled" 
														name="product.deploymentDate" id="deploymentDatePicker" value="<s:property value="%{#formattedVal}"/>">
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Độ tuổi tối thiểu</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" placeholder="Độ tuổi tối thiểu" type="text" disabled="disabled" 
														name="product.minAge" value="<s:property value="product.minAge"/>">
													</div>
												</div>
											</div>
											
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Tên sản phẩm</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text" placeholder="Tên sản phẩm" disabled="disabled" 
														name="product.name" value="<s:property value="product.name"/>">
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Tình trạng hiệu lực</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:if test="product.status==1">
															<input class="form-control" type="text" placeholder="Tình trạng hiệu lực" disabled="disabled" 
														name="product.status" value="Đang hiệu lực">
														</s:if>
														<s:if test="product.status==2">
															<input class="form-control" type="text" placeholder="Tình trạng hiệu lực" disabled="disabled" 
														name="product.status" value="Hết hiệu lực">
														</s:if>
														<s:if test="product.status==3">
															<input class="form-control" type="text" placeholder="Tình trạng hiệu lực" disabled="disabled" 
														name="product.status" value="Dừng triển khai mới">
														</s:if>
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Độ tuổi tối đa</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text" placeholder="Độ tuổi tối đa" disabled="disabled" 
														 name="product.maxAge" value="<s:property value="product.maxAge"/>">
													</div>
												</div>
												<div class="item form-group">
												<s:if test="product.endDateProduct==null">
												</s:if>
												<s:else>
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
													for="firstName">Ngày kết thúc</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input class="form-control" type="text"
														 readonly="readonly"
														name="product.endDateProduct"
														value="<s:property value="product.endDateProduct"/>">
												</div>
												</s:else>
												
											</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Tuổi được bảo hiểm tối đa</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" placeholder="Tuổi được bảo hiểm tối đa" type="text" disabled="disabled" 
														 name="product.maxInsuranceAge" id="money2" value="<s:property value="product.maxInsuranceAge"/>">
													</div>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Số tiền bảo hiểm tối thiểu</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" placeholder="Số tiền bảo hiểm tối thiểu" type="text" disabled="disabled" 
														name="product.minInsuranceMoney" id="money" value="<fmt:formatNumber type = "number" 
         															maxFractionDigits = "3" value = "${sotienbaohiemtoithieu}" />">
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Thời hạn vay tối thiểu</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" placeholder="Thời hạn vay tối thiểu" type="text" disabled="disabled" 
														 name="product.minDurationBorrow" value="<s:property value="product.minDurationBorrow"/>">
													</div>
												</div>
												
												<%-- <div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Phương thức đóng phí</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" placeholder="Phương thức đóng phí" type="text" disabled="disabled" 
														name="product.payMethod" value="<s:property value="product.payMethod.getValue()"/>">
													</div>
												</div> --%>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12">Tỉ lệ hoa hồng năm đầu</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" placeholder="Tỉ lệ hoa hồng năm đầu" type="text" disabled="disabled" 
														name="product.commissionRateFirstYear" value="<s:property value="product.commissionRateFirstYear"/>">
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12">Số ngày trong năm</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" placeholder="Số ngày trong năm" type="text" disabled="disabled" 
														name="product.dayOfYear" value="<s:property value="product.dayOfYear"/>">
													</div>
												</div>
											</div>
										
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Số tiền bảo hiểm tối đa</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text"  disabled="disabled" 
														name="product.maxInsuranceMoney" id="money" value="<fmt:formatNumber type = "number" 
         															maxFractionDigits = "3" value = "${sotienbaohiemtoida}" />">
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Thời hạn vay tối đa</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:if test="product.maxDurationBorrow == 0">
															<input class="form-control" type="text"  disabled="disabled" 
														name="product.maxDurationBorrow">
														</s:if>
														<s:else>
														<input class="form-control" type="text" placeholder="Thời hạn vay tối đa" disabled="disabled" 
														name="product.maxDurationBorrow" value="<s:property value="product.maxDurationBorrow"/>">
														</s:else>
														
													</div>
												</div>
	
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Tỉ lệ phí theo năm</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text" placeholder="Tỉ lệ phí theo phương thức" disabled="disabled" 
														name="product.feeRateByPayMethod" value="<s:property value="product.feeRateByPayMethod"/>">
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Tỉ lệ hoa hồng năm tiếp theo</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" type="text" placeholder="Tỉ lệ hoa hồng năm tiếp theo" disabled="disabled" 
														name="product.commissionRateNextYear" value="<s:property value="product.commissionRateNextYear"/>">
													</div>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-12" style="text-align: end;">
												<a class="btn btn-default" href="list.action" style="margin-right: 10px;">Đóng</a>
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
	        <%@include file="/view/layout/footer.jsp" %>
	        <!-- END FOOTER -->
	    </div>
	</div>
	<script type="text/javascript">
		/* var number = $('#money').val();
		console.log(number);
		var number2 = $('#money2').val();
		console.log(number); */
		
		$.fn.digits = function(){ 
		    return this.each(function(){ 
		        $(this).text( $(this).text().replace(/(\\d)(?=(\\d\\d\\d)+(?!\\d))/g, "$1,") ); 
		    })
		};
		$('.product.minInsuranceMoney').digits();
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/fastclick/lib/fastclick.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/nprogress/nprogress.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/gauge.js/dist/gauge.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/iCheck/icheck.min.js"></script>
	
	<script src="<c:url value = "/resource/js/jquery.validate.min.js" />"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
</body>
</html>