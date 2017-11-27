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

    <title>Lịch sử hệ thống </title>

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
                                <h2 class="col-md-9">Lịch sử hoạt động hệ thống</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="row">
                            	<form action="<s:url action = "filter" namespace="/web/log"/>" class="form-horizontal form-label-left" 
													method="post">
														<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            	<div class="col-md-3">
	                            	<label class="col-md-4 control-label" style="padding-top: 7px;">Từ ngày:</label>
	                            	<div class="col-md-7">	
	                            		<input class="form-control col-md-1 deploymentDatePicker" id="start" placeholder="Ngày đầu" type="text" 
	                            		value="<s:property value="startDate"/>" name="startDate">
	                           		</div>
	                           	</div>
	                           	<div class="col-md-3">
	                            	<label class="col-md-5 control-label" style="padding-top: 7px;">Đến ngày:</label>
	                            	<div class="col-md-7">	
	                            		<input class="form-control col-md-1 deploymentDatePicker" id="end" placeholder="Ngày cuối" type="text"
										name="endDate" value="<s:property value="endDate"/>" >
	                           		</div>
	                           	</div>
	                           	<div class="col-md-3">
	                            	<label class="col-md-5 control-label" style="padding-top: 7px;">Tài khoản:</label>
	                            	<div class="col-md-7">	
	                            		<input autocomplete="off" value="<s:property value='currentUsername'/>" list="bro" name="username" class="form-control col-md-7 col-xs-12">
										<datalist id="bro">
											<option value="All">Tất cả</option>
											<s:iterator value="users">
													<option value="<s:property value='username'/>" selected>
														<s:property value='fullname'/>
													</option>
											</s:iterator>
										</datalist>
	                           		</div>
	                           	</div>
	                           	<div class="col-md-3">
	                            	
	                            	<div class="col-md-7">	
	                            		<button id="search" class="btn btn-primary" type="submit"><i class="fa fa-filter" aria-hidden="true"></i> Lọc</button>
	                           		</div>
	                           	</div>
	                           	</form>
                            </div>
                            <br>
                            <s:if test="hasActionMessages()">
									<div class="alert alert-danger fade in"
										style="text-align: center;">
										<a href="#" class="close" data-dismiss="alert"
											aria-label="close">&times;</a>
										<s:actionmessage />
									</div>
								</s:if>
                            <div  id ="div1" class="">
                                <table id="table-group" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                    	<th style="text-align: center;font-size:14px;width:100px;">STT</th>
                                        <th style="text-align: center;width:100px;font-size:14px;">Tài khoản</th>
                                        <th style="text-align: center;width:150px;font-size:14px;">Thời gian</th>
                                        <th style="text-align: center;font-size:14px;">Nội dung</th>
                                    </tr>
                                    </thead>
                                    <tbody id="body-group" >
                                    	<c:set var="k" value="0"></c:set>
                                   		<s:iterator value="logs">
                                   			<tr class="row-role">
                                   				<td style="text-align: center;">${k=k+1}</td>
                                   				<td style="text-align: center;"><s:property value="getUsername()"></s:property></td>
                                   				<td style="text-align: center;"><s:property value="checkDate()"></s:property></td>
                                   				<td><s:property value="content"></s:property></td>
                                   			<tr>
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
			
			$("tr").each(function(){
				if(this.innerHTML.trim() == "") 
					this.remove();
			});
			$("#table-group").dataTable({
				"searching": false
			});
		});
	</script>
</body>
</html>