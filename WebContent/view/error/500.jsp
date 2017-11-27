<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html >
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentelella Alela! | </title>

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />" />
    
    <!-- Font Awesome -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/font-awesome/css/font-awesome.min.css" />" />

    <!-- NProgress -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/vendor/nprogress/nprogress.css" />" />

    <!-- Custom Theme Style -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resource/css/custom.min.css" />" />
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <!-- page content -->
        <div class="col-md-12">
          <div class="col-middle">
            <div class="text-center">
              <h1 class="error-number">500</h1>
              <h2>Internal Server Error</h2>
              <p>We track these errors automatically, but if the problem persists feel free to contact us. In the meantime, try refreshing. <a href="#">Report this?</a>
              </p>
              <div class="mid_center">
                <h3>Search</h3>
                <form>
                  <div class="col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="Search for...">
                      <span class="input-group-btn">
                              <button class="btn btn-default" type="button">Go!</button>
                          </span>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
      </div>
    </div>

		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/jquery/dist/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/fastclick/lib/fastclick.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/vendor/nprogress/nprogress.js"></script>

    <!-- Custom Theme Scripts -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/custom.min.js"></script>
  </body>
</html>