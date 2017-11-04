<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<!DOCTYPE html>
<html>
<head>
<title>宁波市政务云计算中心-<rapid:block name="title"></rapid:block></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<rapid:block name="meta"></rapid:block>
<!--全局变量-->
<script type="text/javascript"> 
var GLOBAL_VAR = { CTX: "${ctx}", RS: "${rs}" }; 
</script>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<!-- <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"> -->
<link href="${rs}/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${rs}/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="${rs}/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${rs}/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<link href="${rs}/global/plugins/jqgrid/css/ui.jqgrid-bootstrap.css" rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<rapid:block name="css"></rapid:block>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="${rs}/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="${rs}/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="${rs}/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="${rs}/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="${rs}/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
</head>
<body>
<!-- BEGIN PAGE CONTENT -->
<rapid:block name="content"></rapid:block>        
<!-- END PAGE CONTENT -->

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="${rs}/global/plugins/respond.min.js"></script>
<script src="${rs}/global/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="${rs}/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="${rs}/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<rapid:block name="plugins_script"></rapid:block>
<!-- END PAGE LEVEL SCRIPTS -->
<%-- <script src="${rs}/admin/pages/scripts/ui-tree.js"></script> --%>
<script src="${rs}/golbal/scripts/common.js" type="text/javascript"></script>
<script src="${rs}/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${rs}/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="${rs}/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script>
var ctx = "${ctx}";
var resId = "${resId}";
var resName;
jQuery(document).ready(function() {       
    // initiate layout and plugins
	//Metronic.init(); // init metronic core components
	//Layout.init(); // init current layout
	//Demo.init(); // init demo features
});
</script>
<rapid:block name="page_script"></rapid:block>
<!-- END JAVASCRIPTS -->
</body>
</html>