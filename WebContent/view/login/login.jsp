<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập MBAL</title>
  
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
 -->
     <link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/login/style.css" />" />
  
</head>

<body>
  
<!-- Form Mixin-->
<!-- Input Mixin-->
<!-- Button Mixin-->
<!-- Pen Title-->
<div class="pen-title">
  <h1>MBAL</h1>
  </div>
<!-- Form Module-->
<div class="module form-module">
  <div class="">
  </div>
  <div class="form">
    <h2>Đăng nhập</h2>
    <form name="f" action="<c:url value="/login"/>" method="post">
      <label id="lblError" style="color: red; float: left; padding-bottom: 5px;"></label>
      <input type="text" placeholder="Username" id="username" name="username"/>
      <input type="password" placeholder="Password"  id="password" name="password"/>
       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <button type="submit" class="btn">Login</button>
    </form>
  </div>
		<s:if test="hasActionMessages()">
			<div class="alert alert-danger col-xs-12 col-sm-12 col-md-12"
				style="text-align: left;" id="errorLogin">
				<s:actionmessage />
			</div>
		</s:if>
		<div class="cta"><a href="#">Bạn đã quên mật khẩu?</a></div>
</div>
  <%-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
   --%>  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/login/index.js"></script>

</body>
</html>

