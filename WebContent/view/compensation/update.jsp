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

<title>Sửa thông tin bồi thường</title>

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
								<h2>Sửa thông tin bồi thường</h2>
								<s:if test="hasActionMessages()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
										style="text-align: center;" id="errorLogin">
										<s:actionmessage />
									</div>
								</s:if>
								<form id="fromAdd" style="margin-right: 145px;"
									action="<s:url action="update" namespace="/web/compensation" />"
									class="form-horizontal form-label-left" method="post">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<div class="x_content">
										<div class="row">
											<input type="hidden" name="compensation.id" 
											value="<s:property value="compensation.id"/>">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Mã KH<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="hidden" name="compensation.customerCodeOld" 
														value="<s:property value="compensation.customerCode"/>">
														<input class="form-control" 
															placeholder="Mã KH"
															type="text" 
															name="compensation.customerCode"
															readonly="true"
															id="customerCode"
															value="<s:property value="compensation.customerCode"/>"/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày xảy ra sự kiên<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="date-dd form-control" 
															placeholder="Ngày xảy ra sự kiên"
															type="text" 
															name="compensation.eventDate"
															id="eventDate"
															value="<s:property value="compensation.eventDate"/>" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Loại sự kiện<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="compensation.eventType">
															<option value="1">Tử vong</option>
															<option value="2">Thương tật toàn bộ vĩnh viễn </option>
														</select> --%>
														<s:select name="compensation.eventType" class="form-control col-md-7 col-xs-12" 
															list="#{'1':'Tử Vong', '2':'Thương tật toàn bộ vĩnh viễn'}">
														</s:select>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Nguyên Nhân</label>
													<div class="col-md-6 col-sm-6 col-xs-12f">
														<input class="form-control" 
															placeholder="Nguyên Nhân"
															type="text" 
															name="compensation.reason"
															id="reason"
															value="<s:property value="compensation.reason"/>" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày giải quyết</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="date-dd form-control" 
															placeholder="Ngày giải quyết"
															type="text" 
															name="compensation.resolveDate"
															id="resolveDate"
															value="<s:property value="compensation.resolveDate"/> "/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày duyệt bồi thường</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="date-dd form-control" 
															placeholder="Ngày bồi thường"
															type="text" 
															name="compensation.compensationDate" 
															id="compensationDate"
															value="<s:property value="compensation.compensationDate"/>" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày nhận bồi thường</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="date-dd form-control" 
															placeholder="Ngày nhận bồi thường"
															type="text" 
															name="compensation.dateOfCompensation" 
															id="dateOfCompensation"
															value="<s:property value="compensation.dateOfCompensation"/>" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Số HDBH<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="hidden" 
															name="compensation.insurranceOld" 
															value="<s:property value="compensation.insurranceId"/>"> 
														<input class="form-control"  readonly="readonly"
															placeholder="Số HĐBH"
															type="text" 
															name="compensation.insurranceId"
															id="numberInsurrance"
															value="<s:property value="compensation.insurranceId"/>"/>																			
													</div>
													
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Ngày khai báo<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="date-dd form-control" 
															placeholder="Ngày khai báo"
															type="text" 
															name="compensation.declareDate" 
															id="declareDate"
															value="<s:property value="compensation.declareDate"/>" />
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Loại lý do<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="compensation.reasonType">
															<option value="1">Do Tai nạn</option>
															<option value="2">Không do tai nạn</option>
														</select> --%>
														<s:select name="compensation.reasonType" class="form-control col-md-7 col-xs-12" 
															list="#{'1':'Do Tai nạn', '2':'Không do tai nạn'}">
														</s:select>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Chấp nhận bồi thường</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="compensation.acceptCompensation">
															<option value="">---NO---</option>
															<option value="yes">Đồng ý</option>
															<option value="no">không đồng ý</option>
														</select> --%>
														<s:select name="compensation.acceptCompensation" class="form-control col-md-7 col-xs-12" 
															list="#{'':'---NO---', 'yes':'Đồng ý', 'no':'không đồng ý'}">
														</s:select>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Lý do từ chối</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control" 
															placeholder="Lý do từ chối"
															type="text" 
															name="compensation.reasonRefuse" 
															id="reasonRefuse"
															value="<s:property value="compensation.reasonRefuse"/>"/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Số tiền bồi thường<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control number"
															placeholder="Số tiền bồi thường"
															type="text" 
															name="compensation.compensationMoney" 
															data-type="number"
															id="compensationMoney"
															value="<s:property value="compensation.compensationMoney"/>"/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12"
														for="firstName">Trạng thái bồi thường<span class={required:true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="compensation.statusCompensation">
															<option value="1">Quá trình yêu cầu bồi thường</option>
															<option value="2">Chấp nhận bồi thường</option>
															<option value="3">Từ chối bồi thường</option>
														</select> --%>
														<s:select name="compensation.statusCompensation" class="form-control col-md-7 col-xs-12" 
															list="#{'1':'Quá trình yêu cầu bồi thường', '2':'Chấp nhận bồi thường', '3':'Từ chối bồi thường'}">
														</s:select>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group" style="margin-left: 346px;">
										<div class="row" style="text-align: right;">
											<a class="btn btn-default"
												href="<s:url action='list' namespace='/web/compensation'/>">
												<i class="fa fa-times" aria-hidden="true"></i> Đóng
											</a>
											<button id="btn-add-user" type="submit" style="margin-right: 25px;"
												class="btn btn-default">Lưu</button>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/fastclick/lib/fastclick.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/iCheck/icheck.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/app.js"></script>
			
	<script type="text/javascript">
		$(document).ready(function() {
			$("#errorLogin").fadeTo(2000, 500).slideUp(500, function() {
				$("#errorLogin").slideUp(500);
			});
			$('.date-dd').datetimepicker({
				format : 'DD/MM/YYYY',
				allowInputToggle : true,
				locale : 'vi'
			});
			$.validator.addMethod("CODE", function(value, element) {
                return this.optional(element) || /^[a-z0-9\_]+$/i.test(value);
            }, "Không được nhập các kí tự đặc biệt");
			var validator = $("#fromAdd").validate({
				rules : {
					"compensation.customerCode" : {
						required : true,
						maxlength : 20,
						CODE : "required CODE"
					},
					"compensation.insurranceId" : {
						required : true,
						number: true,
						maxlength : 20
					},
					"compensation.eventDate" : {
						required : true,
					},
					"compensation.declareDate" : {
						required : true,
					},
					"compensation.eventType" : {
						required : true,
					},
					"compensation.reasonType" : {
						required : true
					},
					"compensation.compensationMoney" : {
						required : true,
						number : true,
						maxlength : 50
					},
					"compensation.statusCompensation" : {
						required : true
					}
				},
				messages : {
					"compensation.customerCode" : {
						required : "trường này không được để trống",
						minlength : "trường phải có ít nhất 6 kí tự",
						maxlength : "trường phải nhỏ hơn 20 kí tự"
					},
					"compensation.insurranceId" : {
						required : "trường này không được để trống",
						number : "Phải nhập số",
						maxlength : "trường phải nhỏ hơn 20 kí tự"

					},
					"compensation.eventDate" : {
						required : "trường này không được để trống",
					},
					"compensation.declareDate" : {
						required : "trường này không được để trống",
					},
					"compensation.eventType" : {
						required : "trường này không được để trống",
					},
					"compensation.compensationMoney" : {
						required : "trường này không được để trống",
						maxlength : "trường phải nhỏ hơn 50 kí tự",
						number : "phải nhập số"
					},
					"compensation.durationOfInsurance" : {
						required : "trường này không được để trống",
					},
					"compensation.statusCompensation" : {
						required : "trường này không được để trống",
					}
				}
			});
		});
	</script>
	<script type="text/javascript">
/* 	$(document).ready(function(){
	    $("input[data-type='number']").keyup(function(event){
	      // skip for arrow keys
	      if(event.which >= 37 && event.which <= 40){
	          event.preventDefault();
	      }
	      var $this = $(this);
	      var num = $this.val().replace(/,/gi, "");
	      var num2 = num.split(/(?=(?:\d{3})+$)/).join(",");
	      console.log(num2);
	      // the following line has been simplified. Revision history contains original.
	      $this.val(num2);
	  });
	}); */
	</script>
	
	<script type="text/javascript">
		/*NHVIET add start 2017-10-19 */
		$('input.number').keyup(function(event) {
			  // skip for arrow keys
			  if(event.which >= 37 && event.which <= 40) return;
			  
			  // format number
			  $(this).val(function(index, value) {
			    return value
			    .replace(/\D/g, "")
			    .replace(/\B(?=(\d{3})+(?!\d))/g, ",")
			    ;
			  });
			});
		/*NHVIET add end 2017-10-19 */
	</script>
</body>
</html>