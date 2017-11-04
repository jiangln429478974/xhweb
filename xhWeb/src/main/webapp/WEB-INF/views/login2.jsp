<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.4
Version: 3.3.0
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>宁波公共信用信息平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<!-- <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/> -->
<link href="${rs}/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="${rs}/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
<link href="${rs}/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${rs}/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="${rs}/admin/pages/css/login.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME STYLES -->
<link href="${rs}/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css"/>
<link href="${rs}/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="${rs}/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
<link href="${rs}/admin/layout/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="${rs}/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="maina">
<div class="login">
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler">
</div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGO -->
<div class="logo">
	
	<img src="${rs}/admin/layout4/img/logo-big.png" alt=""/>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
	<!-- BEGIN LOGIN FORM -->
	<form class="login-form" action="${ctx}/loginPass2" method="post">
		<h3 class="form-title">用户登入</h3>
		<span style="color: red;"><c:out value="${message}"/><c:out value="${msg}"/></span>
		<div class="alert alert-danger display-hide">
			<button class="close" data-close="alert"></button>
			<span>
			Enter any username and password. </span>
		</div>
		<div class="form-group">
			<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
			<label class="control-label visible-ie8 visible-ie9">用户名</label>
			<input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="username"/>
		</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">密码</label>
			<input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password"/>
		</div>
		<div class="form-actions text-center">
			<button type="submit" class="btn btn-success uppercase">登入</button>
<!-- 			<label class="rememberme check"> -->
<!-- 			<input type="checkbox" name="remember" value="1"/>记住密码</label> -->
<!-- 			<a href="javascript:;" id="forget-password" class="forget-password">Forgot Password?</a> -->
		</div>
		
		
	</form>
	<!-- END LOGIN FORM -->
	
	
</div>
<!-- <div class="copyright"> -->
<!-- 	 2015 © 宁波市公共信用信息平台 -->
<!-- </div> -->
<div class="copyright">
	 <div>2015 © 宁波市公共信用信息平台</div>
	 <div>技术支持联系电话：0574-83873513   0574-87360806 </div>
</div>
<!-- END LOGIN -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="${rs}/global/plugins/respond.min.js"></script>
<script src="${rs}/global/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="${rs}/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${rs}/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${rs}/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${rs}/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="${rs}/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script src="${rs}/admin/pages/scripts/login.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {     
Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Login.init();
Demo.init();
});


</script>
<!-- END JAVASCRIPTS -->
</div>
</body>
<!-- END BODY -->
</html>