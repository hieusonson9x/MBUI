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
						<h3>Quản Lý Thông Tin Góp Phí</h3>
					</div> -->
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="container">
								<h2>Sửa Mới Thông Tin Góp Phí</h2>
								<s:if test="hasActionMessages()">
									<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12" style="text-align: center;"
										id="errorLogin">
										<s:actionmessage />
									</div>
								</s:if>
								<form id="fromAdd"
									action="<s:url action="updatePayment" namespace="/web/payment"/>"
									class="form-horizontal form-label-left" method="post">
									 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="tab-content">
										<div id="home" class="tab-pane fade in active">
											<div class="x_content">
												<input type="hidden" name="payment.id" value="<s:property value="payment.id"/>" >
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="payment-code">Mã Khách Hàng<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input class="form-control col-md-7 col-xs-12" type="text" value="<s:property value="payment.customerCode"/>"
															placeholder="Mã Khách Hàng" name="payment.customerCode" id="payment-code">
															
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="fullname">Số hợp đồng bảo hiểm<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" 
															name="payment.numberInsurrance" 
															value="<s:property value="payment.numberInsurrance"/>"
															placeholder="Số hợp đồng bảo hiểm" 
															class="form-control col-md-7 col-xs-12" 
															id="numberInsurrance">
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="birthday">Ngày bắt đầu thu phí <span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:date name="payment.paymentStart" var="formattedVal" format="dd/MM/yyyy"/>
														<input type="text" 
															name="payment.paymentStart"  
															value="<s:property value="%{#formattedVal}"/>"
															placeholder="Ngày bắt đầu thu phí" 
															class="form-control col-md-7 col-xs-12" 
															readonly="true"
															id="birthday">
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">Ngày kết thúc thu phí<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
													<s:date name="payment.paymentEnd" var="formattedVal" format="dd/MM/yyyy"/>
													<input type="text" 
														class="form-control col-md-7 col-xs-12"
														value="<s:property value="%{#formattedVal}"/>" 
														name="payment.paymentEnd" 
														id="dateRange"/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="birthday">Ngày thu phí <span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:date name="payment.paymentDate" var="formattedVal" format="dd/MM/yyyy"/>
														<input type="text" 
															name="payment.paymentDate"  
															value="<s:property 
															value="%{#formattedVal}"/>"
															placeholder="Ngày bắt đầu thu phí" 
															class="form-control col-md-7 col-xs-12" 
															id="birthday1">
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="address">Dư nợ tính phí<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" 
															name="payment.outstandingBalance" 
															value="<s:property 
															value="payment.outstandingBalance"/>"
															placeholder="Dư nợ tính phí" 
															class="form-control col-md-7 col-xs-12" 
															id = "address">
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="issuedBy">Số tiền phí bảo hiểm<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" 
															name="payment.theAmountOfPremium" 
															data-type="number" 
															value="<s:property value="payment.theAmountOfPremium"/>"
															placeholder="Số tiền phí bảo hiểm" 
															class="form-control col-md-7 col-xs-12"
															id = "issuedBy"
															readonly="readonly">
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="phoneNumber">Số tiền hoa hồng
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" 
															name="payment.amountOfCommission" 
															value="<s:property value="payment.amountOfCommission"/>"
															placeholder="Số tiền hoa hồng" 
															class="form-control col-md-7 col-xs-12" 
															id = "phoneNumber" 
															data-type="number">
													</div>
												</div>
												<%-- <div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="emp">Mã nhân viên RM<span class="required">*</span>
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" name="payment.empCode" value="<s:property value="payment.empCode"/>"
															placeholder="Mã nhân viên" class="form-control col-md-7 col-xs-12" id = "emp">
													</div>
												</div> --%>
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
											<button id="btn-add-user" class="btn btn-default">Lưu</button>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/app.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#errorLogin").fadeTo(2000, 500).slideUp(5000, function() {
				$("#errorLogin").slideUp(500);
			});
			$('#dateRange').datetimepicker({
	        format: 'DD/MM/YYYY',
	        allowInputToggle: true,
	        locale: 'vi'
	  		});
			$('#birthday').datetimepicker({
		        format: 'DD/MM/YYYY',
		        allowInputToggle: true,
		        locale: 'vi'
		    });
			$('#birthday1').datetimepicker({
		        format: 'DD/MM/YYYY',
		        allowInputToggle: true,
		        locale: 'vi'
		    });
		
			$('#btn-add-user').click(function() {
				var html = "<input type='hidden' value='"+$('#issuedBy').val()+"' name='outstanding_balance1'>"
				$("#fromAdd").append(html);
				$("#fromAdd").submit();
			});
			
			var validator = $("#fromAdd").validate({
				 rules : {
						"payment.customerCode" : {required : true} ,
						"payment.numberInsurrance" : {required : true,maxlength :20},
						"payment.paymentStart" : {required : true},
						"payment.paymentEnd": {required : true},
						"payment.theAmountOfPremium": {required: true,number : true,maxlength :50},
						"payment.outstandingBalance": {required: true,number : true,maxlength :50},
						"payment.amountOfCommission": {number : true,maxlength :50},
						//"payment.empCode": {required: true,}
					},
					messages : {
						"payment.customerCode" : {
							required : "Trường này không được để trống",
							
						} ,
						"payment.numberInsurrance" : {
							required : "Trường này không được để trống",
							maxlength : "Trường phải nhỏ hơn 20 kí tự"
						},
						"payment.paymentStart" : {
							required : "Trường này không được để trống",
						},
						"payment.paymentEnd" :{
							required : "Trường này không được để trống",
						},
						"payment.theAmountOfPremium" :{
							required : "Trường này không được để trống",
							number : "Chỉ được nhập số",
							maxlength : "Số phải nhỏ hơn 50 kí tự"
						},
						"payment.outstandingBalance" :{
							required : "Trường này không được để trống",
							number : "Chỉ được nhập số",
							maxlength : "Số phải nhỏ hơn 50 kí tự"
						},
						"payment.amountOfCommission" :{
							number : "Chỉ được nhập số",
							maxlength : "Số phải nhỏ hơn 50 kí tự"
						},
						/* "payment.empCode" :{
							required : "Trường này không được để trống",
							
						} */
				 	}
			});
      
		});
	</script>
<%-- 	<script type="text/javascript">
	$(document).ready(function(){
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
	});
	</script> --%>
	
	<script type="text/javascript">
		$('#dateRange').on("dp.change", function (e) {
			var outstanding_balance = $('#address').val();
			var num_insurrance = $('#numberInsurrance').val();
			var pay_end = $('#dateRange').val();
			var amountOfCommission = $('#phoneNumber').val();

			$.post(getContextPath() +"/web/paymentjson/getPaymentStart",
					{outstanding_balance : outstanding_balance,
					 num_insurrance : num_insurrance,
					 pay_end : pay_end,
					 amountOfCommission : amountOfCommission
					 } 
			, function(data, status){
				if(status == "success"){
					var load = JSON.parse(data.data);
					if(data.message == "success"){
						if(load.paymentStart != null){
							var date = new Date(new Number(load.paymentStart));
						}
						$('#issuedBy').val(load.theAmountOfPremium);
						$('#phoneNumber').val(load.amountOfCommission);
					}
				}
			} );
		});
	</script>
	
	<script>
	/*NHVIET add start 2017-10-19 */

		/* var token = $('meta[name=_csrf]').attr('content');
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			    xhr.setRequestHeader(header, token);
		}); */
		//$("#CourseSelect").change(loadTeachers).change();
		$('#numberInsurrance').change(function() {
			var num_insurrance = $('#numberInsurrance').val();
			$.post(getContextPath() +"/web/paymentjson/getPaymentStart",{num_insurrance : num_insurrance} , function(data, status){
				if(status == "success"){
					var load = JSON.parse(data.data);
					if(data.message == "success"){
						if(load.paymentStart != null){
							var date = new Date(new Number(load.paymentStart));
						}
						$('#birthday').val(date.getDate()+'/'+(date.getMonth()+1)+'/'+date.getFullYear());
					}else{
						$("div#addModal").modal('show');
		    			document.getElementById("statusAmountOfCommission").innerHTML =
		    				'Hợp đồng không có ngày giải ngân hoặc không trong trạng thái hoạt động không được phép góp phí';
		    			$('#birthday').val('');
					}
				}
			} );
		});


		$('#address').change(function() {
			var outstanding_balance = $('#address').val();
			var num_insurrance = $('#numberInsurrance').val();
			var pay_end = $('#dateRange').val();
			$.post(getContextPath() +"/web/paymentjson/getPaymentStart",
					{outstanding_balance : outstanding_balance,
					 num_insurrance : num_insurrance,
					 pay_end : pay_end
					 } 
			, function(data, status){
				if(status == "success"){
					var load = JSON.parse(data.data);
					if(data.message == "success"){
						if(load.paymentStart != null){
							var date = new Date(new Number(load.paymentStart));
						}

						$('#issuedBy').val(load.theAmountOfPremium);
						$('#phoneNumber').val(load.amountOfCommission);
					}
				}
			} );
		});

	
		//add xu ly so tien hoa hong khi khong map voi cong thuc auto thi vang thong bao
		$('#phoneNumber').change(function() {
			var outstanding_balance = $('#address').val();
			var num_insurrance = $('#numberInsurrance').val();
			var pay_end = $('#dateRange').val();
			var amountOfCommission = $('#phoneNumber').val();
			$.post(getContextPath() +"/web/paymentjson/getPaymentStart",
					{outstanding_balance : outstanding_balance,
					 num_insurrance : num_insurrance,
					 pay_end : pay_end,
					 amountOfCommission : amountOfCommission
					 } 
			, function(data, status){
				if(status == "success"){
					var load = JSON.parse(data.data);
					if(data.message == "success"){
						if(load.paymentStart != null){
							var date = new Date(new Number(load.paymentStart));
						}

						$('#issuedBy').val(load.theAmountOfPremium);
						$('#phoneNumber').val(load.amountOfCommission);
					}
					
					if(data.message == "fail"){
						$("div#addModalAmount").modal('show');
			    		document.getElementById("statusAmount").innerHTML =
			    			'Số tiền hoa hồng nhập vào không đúng với tỷ lệ hoa hồng của sản phẩm';
			    		//set giá trị của số tiền hoa hồng về  rỗng là ko cho insert dc
			    		//$('#phoneNumber').val('');	
					}
					
					if(amountOfCommission != load.amountOfCommission){
						$("div#addModalAmount").modal('show');
			    		document.getElementById("statusAmount").innerHTML =
			    			'Số tiền hoa hồng nhập vào không đúng với tỷ lệ hoa hồng của sản phẩm';
			    		$('#phoneNumber').val(amountOfCommission);
					}
				}
			} );
		});

	/*NHVIET add end 2017-10-19 */
	</script>
	
	 <!--nhviet add start : 20171021  -->
	<div id="addModalAmount" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<p>
						NOTICE:
					</p>
					<label for="statusAmount" style="color: black" id="statusAmount"></label>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-sm"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="addModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<p>
						NOTICE:
					</p>
					<label for="statusAmountOfCommission" style="color: black" id="statusAmountOfCommission"></label>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-sm"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<!--nhviet add end : 20171021  -->
</body>
</html>