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

    <title>Thông tin vai trò </title>

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
     <link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/grouprole/edit.css" />" />
    
    <%-- <script src="<c:url value="/js/view/user/add.js"/>"></script> --%>
    <script src="<c:url value = "/js/jquery.validate.min.js" />"></script>
    <%-- <script src="<c:url value = "/js/jquery.min.js" />"></script> --%>
     <style type="text/css">
    .iradio_flat-green {
    	margin-left: 10px;
 }
 </style>
</head>
<body class="nav-md">
	 <s:token/>
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
		                    <h2>
		                    <i class="fa fa-bars"></i> Thông tin vai trò</h2>

		                    <div class="clearfix"></div>
		                  </div>
		                  <div class="x_content">
		
		
		                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
		                      <ul id="myTab" class="nav nav-tabs" role="tablist">
		                        <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Thông tin chung</a>
		                        </li>
		                        <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Danh sách quyền</a>
		                        </li>
		                       
		                      </ul>
		                      <div id="myTabContent" class="tab-content">
		                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
		                          	 <form  data-parsley-validate class="form-horizontal form-label-left" 
													>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
											>Mã vai trò<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<s:textfield class="form-control col-md-7 col-xs-12" type="text" name="groupRole.groupRoleCode"
												value="%{groupRole.groupRoleCode}" required="required"  id="ip-role-code" disabled="true"/>
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												>Tên<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<s:textfield type="text" name="groupRole.groupRoleName" 
												value="%{groupRole.groupRoleName}"	class="form-control col-md-7 col-xs-12" disabled="true"/>
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												>Nhóm quyền cha </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												 <input value="<s:property value='groupRole.parent.groupRoleCode'/>" 
												 autocomplete="off" list="bro" name="parentCode" class="form-control col-md-7 col-xs-12" disabled="true" />
												<datalist id="bro">
													<option value="No">Không có</option>
													<s:iterator value="groupRoles">
															<option value="<s:property value='groupRoleCode'/>" selected>
																<s:property value='groupRoleName'/>
															</option>
													</s:iterator>
												</datalist>
											</div>
										</div>
							
										 
										<div class="form-group">
					                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Mô tả</span>
					                        </label>
					                        <div class="col-md-6 col-sm-6 col-xs-12">
					                          <textarea class="form-control" rows="3" name="groupRole.description" disabled="true"><s:property value='groupRole.description'/>
					                          </textarea>
					                        </div>
					                      </div>
					                      
					                      <div class="form-group">
					                     		  <label class="control-label col-md-3 col-sm-3 col-xs-12">Trạng thái</span></label>
						                      <div class="col-md-6 col-sm-6 col-xs-12" style="margin-top: 8px;">
						                      <p>
						                      <s:if test="%{groupRole.active}" >
						                        <input type="radio" class="flat" name="groupRole.active"  value="1" checked /> Hoạt động
						                        <input type="radio" class="flat" name="groupRole.active" value="0" disabled="true"/>
						                         Vô hiệu
						                        </s:if>
						                        <s:else>
						                        	<input type="radio" class="flat" name="groupRole.active"  value="1" disabled="true"/> Hoạt động
						                        	<input type="radio" class="flat" name="groupRole.active" value="0" checked/>  Vô hiệu
						                        </s:else>
						                      </p>
						                      </div>
						                     </div>
						                     
									</form>
									<div class="col-md-12"  style="text-align: center;">
                  	<a class="btn btn-default" href="<s:url action='getall' namespace='/web/grouprole'/>">Thoát</a>
                  </div>
									
		                        </div>
		                        <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
		                           <div  id ="div1" class="x_content table-responsive">		                           		
		                                <table id="datatable" class="table table-striped table-hover table-bordered" >
		                                     <col width="300">
		                                    <thead>
		                                    <tr>
		                                        <th bgcolor="#E1F5FE">Mã</th>
		                                        <th bgcolor="#E1F5FE" colspan="2">Tên</th>
		                                        
		                                    </tr>
		                                    </thead>
		                                    <tbody id="tbl-tbody-role">
		                                   		<s:iterator value="roles">
		                                   			<tr>
		                                   				<td><s:property value="roleCode"></s:property></td>
		                                   				<td colspan="2"><s:property value="roleName"></s:property></td>
		                                   				
		                                   			<tr>
		                                   		</s:iterator>
		                                    </tbody>
		                                </table>
		                             	
                            		</div>
	
		                      </div>
		                      </div>
		                    </div>
		                  
		                    <div >
		                    
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
	Bootstrap
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
	FastClick
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/fastclick/lib/fastclick.js"></script>
	NProgress
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/nprogress/nprogress.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/gauge.js/dist/gauge.min.js"></script>
	bootstrap-progressbar
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	iCheck
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/iCheck/icheck.min.js"></script>
	Custom Theme Scripts
	
	<script src="<%=request.getContextPath()%>/resource/vendor/jquery.tagsinput/src/jquery.tagsinput.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
	
	
</body>
</html>