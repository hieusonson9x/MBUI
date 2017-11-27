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

    <title>Quản lý vai trò </title>

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
	<link type="text/css" rel="stylesheet" 
	href="<c:url value="/resource/vendor/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" />" />

<!-- Custom Theme Style -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resource/css/custom.min.css" />" />
    
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
                                <h2 class="col-md-9">Trích xuất báo cáo</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="row">
                            	<form action="<s:url action = "exportReport" namespace="/web/file"/>" class="form-horizontal form-label-left" 
													method="post">
														<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            	<div class="col-md-12">
	                            	<label class="col-md-3 control-label" style="padding-top: 7px;" >Loại báo cáo</label>
	                            	<div class="col-md-3">	
	                            		<select class="form-control" id="sel1" name="typeReport">
									        <option value="1">Hợp đồng phát hành mới</option>
									        <option value="2">Hợp đồng chấm dứt trước thời hạn</option>
									        <option value="3">Hợp đồng đến hạn đóng phí</option>
									        <option value="4">Hợp đồng đóng phí định kỳ</option>
									        <option value="5">Hồ sơ YCGQQLBH</option>
									        <option value="6">Thay đổi thông tin hợp đồng</option>
									      </select>
	                           		</div>
	                           	</div>
	                           	<br></br>
	                           	<br>
                            	
                            	<div class="col-md-12">
	                            	<label class="col-md-3 control-label" style="padding-top: 7px;">Từ ngày:</label>
	                            	<div class="col-md-3">	
	                            		<input class="form-control col-md-1 deploymentDatePicker" placeholder="Ngày đầu" type="text" 
	                            		 name="startDate">
	                           		</div>
	                           	</div>
	                           	<br></br>
	                           	<br>
	                           	<div class="col-md-12">
	                            	<label class="col-md-3 control-label" style="padding-top: 7px;">Đến ngày:</label>
	                            	<div class="col-md-3">	
	                            		<input class="form-control col-md-1 deploymentDatePicker" placeholder="Ngày cuối" type="text"
										name="endDate" >
	                           		</div>
	                           	</div>
	                           <br></br>
	                           <br>
	                           	<div class="col-md-3">
	                            
	                           	</div>
	                           	
	                           	<div class="col-md-3" style="text-align: center">	
	                            		<button class="btn btn-primary" type="submit"><i class="fa fa-filter" aria-hidden="true"></i> Xuất báo cáo</button>
	                           		</div>
	                           	</form>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/fastclick/lib/fastclick.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/nprogress/nprogress.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/gauge.js/dist/gauge.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/iCheck/icheck.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/moment.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/moment/locale/vi.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/datatable/datatables.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$('.deploymentDatePicker').datetimepicker({
        format: 'DD/MM/YYYY',
        allowInputToggle: true,
        locale: 'vi'
    	});
	});
	
	</script>
</body>
</html>