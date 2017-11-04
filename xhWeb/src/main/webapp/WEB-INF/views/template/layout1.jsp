<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>宁波市政务云计算中心数据架构体系-<rapid:block name="title"></rapid:block></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
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
<!-- BEGIN HEADER -->
<div class="page-header">
	<!-- BEGIN HEADER TOP -->
	<div class="page-header-top">
		<div class="container">
        	<div class="top_gfont">欢迎进入宁波市政务云计算中心</div>
        	<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li class="dropdown dropdown-user dropdown-dark">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<img alt="" class="img-circle" src="${rs}/admin/layout3/img/avatar9.jpg">
						<span class="username username-hide-mobile"><shiro:principal/></span>
						</a>
						<ul class="dropdown-menu dropdown-menu-default">
							<li>
								<a href="extra_profile.html">
								<i class="icon-user"></i>账号管理 </a>
							</li>
							<li>
								<a href="inbox.html">
								<i class="icon-envelope-open"></i>我的信息 <span class="badge badge-danger">
								3 </span>
								</a>
							</li>
							<li>
								<a href="${ctx}/logout">
								<i class="icon-logout"></i>退出 </a>
							</li>
						</ul>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
					
                    <!-- BEGIN NOTIFICATION DROPDOWN -->
					<li class="dropdown dropdown-extended dropdown-dark dropdown-notification" id="header_notification_bar">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<i class="icon-bell"></i>
						<span class="badge badge-default">4</span>
						</a>
						<ul class="dropdown-menu">
							<li class="external">
								<h3>您有 <strong>4 条</strong> 信息未读</h3>
								<a href="javascript:;">详细</a>
							</li>
							<li>
								<ul class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283">
									<li>
										<a href="javascript:;">
										<span class="time">07-01</span>
										<span class="details">
										<span class="label label-sm label-icon label-success">
										<i class="fa fa-bullhorn"></i>
										</span>
										食品生产企业信息(质监局)</span>
										</a>
									</li>
									<li>
										<a href="javascript:;">
										<span class="time">07-01</span>
										<span class="details">
										<span class="label label-sm label-icon label-danger">
										<i class="fa fa-bullhorn"></i>
										</span>
										食品生产企业信息(质监局) </span>
										</a>
									</li>
									<li>
										<a href="javascript:;">
										<span class="time">07-01</span>
										<span class="details">
										<span class="label label-sm label-icon label-warning">
										<i class="fa fa-bullhorn"></i>
										</span>
										食品生产企业信息(质监局) </span>
										</a>
									</li>
									<li>
										<a href="javascript:;">
										<span class="time">07-01</span>
										<span class="details">
										<span class="label label-sm label-icon label-info">
										<i class="fa fa-bullhorn"></i>
										</span>
										食品生产企业信息(质监局) </span>
										</a>
									</li>
								</ul>
							</li>
						</ul>
					</li>
					<!-- END INBOX DROPDOWN -->
				</ul>
			</div>	
            <div class="top_menu2">
            	<span><i class="fa fa-cog tpbinc01"></i><a href="#">系统设置</a></span>
                <span><i class="fa fa-info-circle tpbinc01"></i><a href="#">系统帮助</a></span>
            </div>
        </div>
    </div>
    <div class="page-header-menu" style="display: block;">
		<div class="container">
        	<div class="logo"></div>
			
			<!-- BEGIN MEGA MENU -->
			<!-- DOC: Apply "hor-menu-light" class after the "hor-menu" class below to have a horizontal menu with white background -->
			<!-- DOC: Remove data-hover="dropdown" and data-close-others="true" attributes below to disable the dropdown opening on mouse hover -->
			<div class="hor-menu ">
				<ul class="nav navbar-nav">
					<li>
						<a href="${ctx}/sjgx/index">
	                        <img class="incg01" src="${rs}/admin/layout3/img/inc01.png" alt="">
	                        <span>系统首页</span>
                        </a>
					</li>
                    <li class="menu-dropdown   mega-menu-dropdown">
						<a class="nav03" data-hover="megamenu-dropdown" data-toggle="dropdown" class="dropdown-toggle">
                              <img class="incg01" src="${rs}/admin/layout3/img/inc02.png" alt="">
                              <span>资源提供</span>
                        </a>
                        <ul class="dropdown-menu">
                        	<shiro:hasAnyRoles name="admin">
                        		<li>
                            		<a href="${ctx}/cjpt/datalist/auditlist/index">
                            			<i class="fa fa-angle-right"></i>注册审核
                            		</a>
                            	</li>
                            	<li>
                            		<a href="${ctx}/cjpt/datalist/showList/index">
                            			<i class="fa fa-angle-right"></i>任务监控
                            		</a>
                            	</li>
                        	</shiro:hasAnyRoles>
                        	<shiro:hasAnyRoles name="dataProvide">
                            	<li>
                            		<a href="${ctx}/cjpt/datalist/auditlist/index">
                            			<i class="fa fa-angle-right"></i>资源注册
                            		</a>
                            	</li>
                            	<li>
                            		<a href="${ctx}/cjpt/datalist/showList/index">
                            			<i class="fa fa-angle-right"></i>任务监控
                            	</a>
							</li>
							</shiro:hasAnyRoles>
                        </ul>
					</li>
                    <li class="menu-dropdown   mega-menu-dropdown">
						<a class="nav03" data-hover="megamenu-dropdown" data-toggle="dropdown" class="dropdown-toggle">
                            <img class="incg01" src="${rs}/admin/layout3/img/inc03.png" alt="">
                            <span>资源共享</span></a>
                        </a>
                         <ul class="dropdown-menu">
                         	<shiro:hasAnyRoles name="admin">
                            <li>
                            	<a href="${ctx}/sjgx/manage/datalist/index">
                            			<i class="fa fa-angle-right"></i>共享监控
                            	</a>
							</li>
                            <li>
                            	<a href="${ctx}/sjgx/check/datalist/index">
                            		<i class="fa fa-angle-right"></i>订单审核
                            	</a>
							</li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="dataShare">
							<li>
                            	<a href="${ctx}/sjgx/manage/datalist/index">
                            		<i class="fa fa-angle-right"></i>共享监控
                            		</a>
                            </li>
                            <li>
                            	<a href="${ctx}/sjgx/check/datalist/index">
                            		<i class="fa fa-angle-right"></i>订单申请
                            	</a>
							</li>
							</shiro:hasAnyRoles>
							<li>
                            	<a href="${ctx}/sjgx/resdate/index">
                            		<i class="fa fa-angle-right"></i>数据查询
                            	</a>
							</li>
                        </ul>
					</li>
					
				</ul>
			</div>
			<!-- END MEGA MENU -->
		</div>
	</div>
</div>   
<rapid:block name="page-nav">
</rapid:block>  
<!-- END PAGE HEAD -->
<!-- BEGIN PAGE CONTENT -->
<rapid:block name="content"></rapid:block>        
<!-- END PAGE CONTENT -->
<!-- BEGIN FOOTER -->
<footer>
      <hr>
        <div class="container">
        <p class="fonterp">版权所有：宁波市经济和信息化委员会</p>
        </div>
 </footer>
<!-- END FOOTER -->
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

<script src="${rs}/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/layer/layer.js"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<rapid:block name="plugins_script"></rapid:block>
<!-- END PAGE LEVEL SCRIPTS -->
<%-- <script src="${rs}/admin/pages/scripts/ui-tree.js"></script> --%>
<script src="${rs}/global/scripts/common.js" type="text/javascript"></script>
<script src="${rs}/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${rs}/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="${rs}/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script>
var ctx = "${ctx}";
var resId = "${resId}";
var resName;
jQuery(document).ready(function() {       
    // initiate layout and plugins
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	Demo.init(); // init demo features
});
</script>
<rapid:block name="page_script"></rapid:block>
<!-- END JAVASCRIPTS -->
</body>
</html>