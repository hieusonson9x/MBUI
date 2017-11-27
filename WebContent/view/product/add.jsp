<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Quản lý cấu hình sản phẩn</title>

    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />" />
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/font-awesome/css/font-awesome.min.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" />" />
    <!-- Custom Theme Style -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/custom.min.css" />" />
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/view/product/product.css" />" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    
</head>
<body class="nav-md">
	<div class="container body">
	    <div class="main_container">
	        <!-- BEGIN HEADER -->
	        <%@include file="/view/layout/header.jsp" %>
	        <!-- END HEADER -->
	
	        <!-- page content -->
	       <div class="right_col" role="main">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>Tạo mới sản phẩm</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<s:if test="hasActionMessages()">
										<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12" id="errorLogin">
											<s:actionmessage />
										</div>
									</s:if>
									<form id="productForm" action="<s:url action = "add" namespace="/web/product"/>" class="form-horizontal form-label-left" 
													method="post">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										<div class="row">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Mã sản phẩm<span class={required : true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" placeholder="Mã sản phẩm" type="text" name="product.code"/>
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Ngày triển khai<span class={required : true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12" >
														<s:textfield class="form-control" placeholder="Ngày triển khai" type="text" name="product.deploymentDate" id="deploymentDatePicker"/>
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Độ tuổi tối thiểu<span class={required : true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" placeholder="Độ tuổi tối thiểu" type="text" name="product.minAge"/>
													</div>
												</div>
											</div>
											
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Tên sản phẩm<span class={required : true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text" placeholder="Tên sản phẩm" name="product.name"/>
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Tình trạng hiệu lực<span class={required : true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<%-- <select class="form-control col-md-7 col-xs-12"
															name="product.status" id="sta">
															<option value="1">Đang hiệu lực</option>
															<option value="2">Hết hiệu lực</option>
															<option value="3">Dừng triển khai mới</option>
														</select> --%>
														<s:select name="product.status" class="form-control col-md-7 col-xs-12" 
															list="#{'1':'Đang hiệu lực', '2':'Hết hiệu lực', '3':'Dừng triển khai mới'}">
														</s:select>
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Độ tuổi tối đa<span class={required : true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text" placeholder="Độ tuổi tối đa" name="product.maxAge"/>
													</div>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Tuổi được bảo hiểm tối đa<span class={required : true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" placeholder="Tuổi được bảo hiểm tối đa" type="text" name="product.maxInsuranceAge"/>
													</div>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Số tiền bảo hiểm tối thiểu<span class={required : true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">

														<s:textfield class="form-control" placeholder="Số tiền bảo hiểm tối thiểu" type="text" name="product.minInsuranceMoney" />

													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Thời hạn vay tối thiểu<span class={required : true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control " placeholder="Thời hạn vay tối thiểu" type="text" name="product.minDurationBorrow"/>
													</div>
												</div>
												
												<%-- <div class="item form-groupy>
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Phương thức đóng phí<span class={required : true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:select class="form-control" name="product.payMethod" 
															    list="@cmc.mbal.constant.ProductPayMethodEnum@values()" 
															    listValue="%{getText(getValue())}"
															    headerKey="" />
													</div>
												</div> --%>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12">Tỉ lệ hoa hồng năm đầu<span class={required : true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" placeholder="Tỉ lệ hoa hồng năm đầu" type="text" name="product.commissionRateFirstYear"/>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12">Số ngày trong năm<span class={required : true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" placeholder="Số ngày trong năm" type="text" name="product.dayOfYear"/>
													</div>
												</div>
											</div>
										
											<div class="col-md-6">
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Số tiền bảo hiểm tối đa</label>
													<div class="col-md-6 col-sm-6 col-xs-12">

														<s:textfield class="form-control" type="text" placeholder="Số tiền bảo hiểm tối đa" name="product.maxInsuranceMoney" />

													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Thời hạn vay tối đa</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text" placeholder="Thời hạn vay tối đa" name="product.maxDurationBorrow"/>
													</div>
												</div>
	
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Tỉ lệ phí theo năm<span class={required : true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text" placeholder="Tỉ lệ phí theo phương thức" name="product.feeRateByPayMethod"/>
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label col-md-6 col-sm-6 col-xs-12" for="firstName">Tỉ lệ hoa hồng năm tiếp theo<span class={required : true}>*</span></label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<s:textfield class="form-control" type="text" placeholder="Tỉ lệ hoa hồng năm tiếp theo" name="product.commissionRateNextYear"/>
													</div>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-12" style="text-align:end;">
													<button id="send" type="submit" class="btn btn-default">Lưu</button>
													<a class="btn btn-default" style="margin-right: 10px;" href="list.action">Đóng</a>
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
	        <%@include file="/view/layout/footer.jsp" %>
	        <!-- END FOOTER -->
	    </div>
	</div>
	
	<script src="<c:url value = "/resource/js/jquery.min.js" />"></script>
	<script src="<c:url value = "/resource/js/jquery.validate.min.js" />"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/moment.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/locale/vi.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('#deploymentDatePicker').datetimepicker({
	        format: 'DD/MM/YYYY',
	        allowInputToggle: true,
	        locale: 'vi'
	    });
			$("#errorLogin").fadeTo(2000, 500).slideUp(500, function() {
				$("#errorLogin").slideUp(500);
			});
			$.validator.addMethod("CODE", function(value, element) {
                return this.optional(element) || /^[a-z0-9]+$/i.test(value);
            }, "Không được nhập các kí tự đặc biệt");
		var validator = $("#productForm").validate({
        rules: {
           "product.code": {required: true, maxlength: 20,CODE :"required CODE"},
           "product.name": {required: true, maxlength: 200},
           "product.status": {required : true},
           "product.deploymentDate": {required : true, maxlength: 20},
           "product.minAge": {required: true,number:true, maxlength: 10},
           "product.maxAge": {required: true,number:true, maxlength: 10},
           "product.maxInsuranceAge": {required: true,number:true, maxlength: 10},
           "product.minInsuranceMoney": {required : true,number:true, maxlength: 50},
           "product.minDurationBorrow": {required : true,number:true, maxlength: 10},
           "product.feeRateByPayMethod": {required : true,number:true, maxlength: 20},
           "product.commissionRateFirstYear": {required : true,number:true, maxlength: 20},
           "product.commissionRateNextYear": {required : true,number:true, maxlength: 20},
           "product.maxInsuranceMoney" :{number :true, maxlength: 50},
           "product.maxDurationBorrow" : {number : true, maxlength: 10},
           "product.dayOfYear" :{required : true,number:true, maxlength: 10}
        },
        messages: {
        	"product.code": {
						required : "Trường này không được để trống",
						maxlength : "Tối đa 20 kí tự"
					} ,
           "product.name": {
						required : "Trường này không được để trống",
						maxlength : "Tối đa 200 kí tự"
					} ,
           "product.status": {
						required : "Trường này không được để trống"
					} ,
           "product.deploymentDate": {
						required : "Trường này không được để trống",
						maxlength : "Tối đa 20 kí tự"
					} ,
           "product.minAge": {
						required : "Trường này không được để trống",
						maxlength : "Tối đa 10 kí tự",
						number :"phải nhập số"
					} ,
           "product.maxAge": {
						required : "Trường này không được để trống",
						maxlength : "Tối đa 10 kí tự",
						number :"phải nhập số"
					} ,
			"product.maxInsuranceAge": {
						required : "Trường này không được để trống",
						maxlength : "Tối đa 10 kí tự",
						number :"Phải nhập số"
					},
           "product.minInsuranceMoney": {
						required : "Trường này không được để trống",
						maxlength : "Tối đa 50 kí tự",
						number :"Phải nhập số"
					} ,
           "product.minDurationBorrow": {
						required : "Trường này không được để trống",
						maxlength : "Tối đa 10 kí tự",
						number :"Phải nhập số"
					} ,
           "product.feeRateByPayMethod": {
						required : "Trường này không được để trống",
						maxlength : "Tối đa 20 kí tự",
						number :"Phải nhập số"
					} ,
           "product.commissionRateFirstYear": {
						required : "Trường này không được để trống",
						maxlength : "Tối đa 20 kí tự",
						number :"Phải nhập số"
					} ,
           "product.commissionRateNextYear": {
						required : "Trường này không được để trống",
						maxlength : "Tối đa 20 kí tự",
						number :"Phải nhập số"
			} ,
		   "product.maxInsuranceMoney" :{
			   number :"Phải nhập số",
			   maxlength : "Tối đa 50 kí tự"
		   	} ,
		   "product.maxDurationBorrow" :{
			   number :"Phải nhập số",
			   maxlength : "Tối đa 10 kí tự"
		   },
		   "product.dayOfYear" : {
			    required : "Trường này không được để trống",
				number :"Phải nhập số",
				maxlength : "Tối đa 10 kí tự"
		   }
        }
	    });
			
		});
	</script>
	<script type="text/javascript">
	/* $(document).ready(function(){
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
	$('input.number').keyup(function(event) {

		  // skip for arrow keys
		  if(event.which >= 37 && event.which <= 40){
		   event.preventDefault();
		  }

		  $(this).val(function(index, value) {
		      value = value.replace(/,/g,'');
		      return numberWithCommas(value);
		  });
		});

		function numberWithCommas(x) {
		    var parts = x.toString().split(".");
		    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		    return parts.join(".");
		    $(function(){
		        $("#textField").on('keyup', function(){
		            if(!isNaN(this.value.replace(/,/g, "")))
		                 this.value=this.value.replace(/,/g, "");
		        });
		    });

		}
	</script>
</body>
</html>