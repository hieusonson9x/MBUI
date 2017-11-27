<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<body>
	<div class="col-md-3 left_col">
		<div class="left_col scroll-view">
			<div class="navbar nav_title" style="border: 0;">
				<a href="#" class="site_title"><span>MBAL</span></a>
			</div>
			<input type="hidden" id="context-path" value="<%=request.getContextPath()%>">
			<div class="clearfix"></div>

			<!-- menu profile quick info -->
			<div class="profile clearfix">

				<div class="profile_info">
					<span>Xin chào,</span>
					<h2 id="check-ss">
						Hiếu
					</h2>
				</div>
			</div>
			<!-- /menu profile quick info -->

			<br />

			<div class="ln_solid"></div>

			<!-- sidebar menu -->
			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
				<div class="menu_section">
					<h3>MBAL</h3>
						<ul class="nav side-menu">
							<li><a></i>Cấu hình danh mục<span
									class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu">
									
										<li><a id="a-ag"
											href="#">
											 Quản lý chi nhánh</a>
										</li>
										
									<li><a id="a-product"
										href="#">
										 Quản lý cấu hình sản phẩm </a></li>
										
								</ul></li>
						</ul>
					<ul class="nav side-menu">
							<li><a></i>Quản lý nghiệp vụ<span
									class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu">
									
									<li><a id="a-ins"
										href="#">
										 Quản lý thông tin hợp đồng bảo hiểm </a></li>
										 
									<li><a
										href="#">
										 Danh sách các hợp đồng cần thẩm định thông thường</a>
									</li>
									
									<li><a
										href="#">
										 Khôi phục hợp đồng nợ phí</a>
									</li>
									
									<li><a id="a-pay"
										href="#">
										Quản lý thông tin góp phí </a></li>
									
									<li><a id="a-compen"
										href="#">
										 Quản lý thông tin bồi thường</a>
									</li>
									 
									<li><a id="a-kh"
										href="#">
										Quản lý thông tin khách hàng </a></li>
									
									<li><a
										href="<s:url action='callMBqueryNewInsuranceDaily' namespace='/web/user'/>">
										 Call Data Hợp đồng tự động </a></li>
									<li><a
										href="<s:url action='callMBqueryInsuranceFeeDaily' namespace='/web/user'/>">
										 Call Data góp phí tự động </a></li>
								</ul>
							</li>
						</ul>
					<ul class="nav side-menu">
							<li><a href="#"></i>Quản trị hệ thống<span
									class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu">
									
										<li><a id="a-emp"
											href="#">
												Quản lý người dùng </a></li>
									
										<li><a
										 id="a-nq"	href="#">
												Quản lý nhóm quyền </a></li>
									
										<li><a id="a-q" 
										href="#">
											 Quản lý quyền</a> </li>
									
										</ul>
					</ul>
				</div>

			</div>
			<!-- /sidebar menu -->


		</div>
	</div>
	<div class="top_nav">
		<div class="nav_menu">
			<nav>
				<div class="nav toggle">
					<a id="menu_toggle"><i class="fa fa-bars"></i></a>
				</div>

				<ul class="nav navbar-nav navbar-right">
					<li class=""><a href="javascript:;"
						class="user-profile dropdown-toggle" data-toggle="dropdown"
						aria-expanded="false"> <img src="images/img.jpg" alt="">
						<s:property value="%{#session.fullname}" /> <span
							class=" fa fa-angle-down"></span>
					</a>
						<ul class="dropdown-menu dropdown-usermenu pull-right">
							<li>
								<form id="logout-form" name="f" action="<c:url value="/logout-page"/>"
									method="post">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<button type="submit" class="btn btn-link">
										Đăng xuất <i class="fa fa-sign-out" aria-hidden="true"></i>
									</button>
								</form>
							</li>
						</ul></li>

					<li role="presentation" class="dropdown"><%-- <a
						href="javascript:;" class="dropdown-toggle info-number"
						data-toggle="dropdown" aria-expanded="false"> <i
							class="fa fa-envelope-o"></i> <span class="badge bg-green">6</span>
					</a> --%>
						<ul id="menu1" class="dropdown-menu list-unstyled msg_list"
							role="menu">
							<li><a> <span class="image"><img
										src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
											Smith</span> <span class="time">3 mins ago</span>
								</span> <span class="message"> Film festivals used to be
										do-or-die moments for movie makers. They were where... </span>
							</a></li>
							<li><a> <span class="image"><img
										src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
											Smith</span> <span class="time">3 mins ago</span>
								</span> <span class="message"> Film festivals used to be
										do-or-die moments for movie makers. They were where... </span>
							</a></li>
							<li><a> <span class="image"><img
										src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
											Smith</span> <span class="time">3 mins ago</span>
								</span> <span class="message"> Film festivals used to be
										do-or-die moments for movie makers. They were where... </span>
							</a></li>
							<li><a> <span class="image"><img
										src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
											Smith</span> <span class="time">3 mins ago</span>
								</span> <span class="message"> Film festivals used to be
										do-or-die moments for movie makers. They were where... </span>
							</a></li>
							<li>
								<div class="text-center">
									<a> <strong>See All Alerts</strong> <i
										class="fa fa-angle-right"></i>
									</a>
								</div>
							</li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</div>

</body>
<script src="<c:url value = "/resource/js/jquery.min.js" />"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/app.js"></script>
</html>
