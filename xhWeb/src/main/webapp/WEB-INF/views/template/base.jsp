<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources"/>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>宁波市公共信用信息工作平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="${rs}/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="${rs}/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
<link href="${rs}/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${rs}/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="${rs}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link href="${rs}/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>
<link href="${rs}/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
<link href="${rs}/global/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>
<link href="${rs}/global/plugins/morris/morris.css" rel="stylesheet" type="text/css">
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN PAGE STYLES -->
<link href="${rs}/admin/pages/css/tasks.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE STYLES -->
<!-- BEGIN THEME STYLES -->
<!-- DOC: To use 'rounded corners' style just load 'components-rounded.css' stylesheet instead of 'components.css' in the below style tag -->
<link href="${rs}/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css"/>
<link href="${rs}/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="${rs}/admin/layout4/css/layout.css" rel="stylesheet" type="text/css"/>
<link href="${rs}/admin/layout4/css/themes/light.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="${rs}/admin/layout4/css/custom.css" rel="stylesheet" type="text/css"/>

<!--[if IE 8]>
<link href="${rs}/admin/layout4/css/ie8.css" rel="stylesheet" type="text/css"/>
<![endif]-->

<!--bootstrap modal-->
<link href="${rs}/js/plugins/bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<link href="${rs}/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css" />
<link href="${rs}/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${rs}/css/zTree/zTreeStyle/zTreeStyle.css" type="text/css">

 <LINK href="${rs}/js/style.css" rel="stylesheet" type="text/css">
<!--bootstrap modal-->
<rapid:block name="css"></rapid:block>	
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<style>
	.page-header.navbar{ background-color:#0E6D67;}
	.page-header.navbar .search-form{ background:none;}
	.page-header.navbar .top-menu .navbar-nav > li.dropdown.open .dropdown-toggle {
  background-color: #f1f1f1;
}

</style>
<script type="text/javascript">
function logout(){
	try{
		if(confirm("确定退出吗？")){ 
			var lm = "n-n-n-n"; 
			document.cookie="lm="+lm+";path=/";
			window.location.href = "${ctx}/logout";
			
		}
	}catch(e){}
}
</script>
<OBJECT id=InfoSecNetSign1 
codebase=NetSign20.cab#version=2.0.59.9
data=DATA:application/x-oleobject;BASE64,xDi5YpBBN0+M8KkrCpHMdwADAACgRwAA/wIAAA== 
classid=clsid:B3B938C4-4190-4F37-8CF0-A92B0A91CC77 
VIEWASTEXT width="0" height="0"></OBJECT> 


<body class="page-header-fixed page-sidebar-closed-hide-logo page-sidebar-closed-hide-logo">

<!-- BEGIN HEADER -->

<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner">
		<!-- BEGIN LOGO -->
		
				<div class="page-logo">
					<a href="${ctx }/">
 					<img src="${rs}/admin/layout4/img/logiccccc.png" alt="logo" class="logo-default"  width="250px;" height="70px;" style="margin-left:-500px;"/>
					</a>
					<div class="menu-toggler sidebar-toggler"> 
					<!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header  -->
					</div> 
					<div id="bgDiv" class = "bgDiv"   style="display:none;position:absolute;top:0;background:#777;filter:progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75);opacity:0.7;left:0;">
					</div>
				</div>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler hide" data-toggle="collapse" data-target=".navbar-collapse">
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN PAGE ACTIONS -->
		<!-- DOC: Remove "hide" class to enable the page header actions -->
		
		<!-- END PAGE ACTIONS -->
		
		
		<!-- BEGIN PAGE TOP -->
		<div class="page-top">
			<!-- BEGIN HEADER SEARCH BOX -->
			<!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
			
			<!-- END HEADER SEARCH BOX -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
					<li class="separator hide">
					</li>
					<!-- BEGIN NOTIFICATION DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
			
					<!-- END NOTIFICATION DROPDOWN -->
					<li class="separator hide">
					</li>
					<!-- BEGIN INBOX DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<!-- END INBOX DROPDOWN -->
					<li class="separator hide">
					</li>
					 
					<li class="dropdown dropdown-user dropdown-dark">
						<a href="#" class="dropdown-toggle" onclick="modifyUserData();">
						<span class="username username-hide-on-mobile" id="userxm">
						</span>
						<!-- DOC: Do not remove below empty space(&nbsp;) as its purposely used -->
						<img alt="" class="img-circle" src="${ctx }/resources/admin/layout4/img/people.png"/>
						</a>
					</li> 
	                
	                <li class="dropdown dropdown-user dropdown-dark" onclick="javascript:logout()">
						<a  target="_blank" class="dropdown-toggle" style="display:inlin-block;height:74px">
						<span class="username username-hide-on-mobile" style="display:inlin-block;margin-top:5px">退出</span>
						</a>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END PAGE TOP -->
	</div>
	<!-- END HEADER INNER -->
</div>
<!-- END HEADER -->


<div class="clearfix">
</div>

<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper">
		<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
		<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
		<div class="page-sidebar navbar-collapse collapse" style="  padding-bottom:200px;margin-top:-15px;">

			<!-- BEGIN SIDEBAR MENU -->
			<!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
			<!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
			<!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
			<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
			<!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
			<!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
			<ul id="menuTree" class="page-sidebar-menu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
				<li class="start active ">
					<a href="${ctx}/">
					<i class="icon-home"></i>
					<span class="title">首页</span>
					</a>
				</li>
				<li><a target= "_blank " ><span class="title" ><i class="fa fa-folder"></i>Scorecard</span></a></li>
				<li><a target= "_blank " ><span class="title" ><i class="fa fa-folder"></i>Customer</span></a></li>
				<li><a target= "_blank " ><span class="title" ><i class="fa fa-folder"></i>Tasks</span></a></li>
				<li><a target= "_blank " ><span class="title" ><i class="fa fa-folder"></i>Item/Price/Cost</span></a></li>
				<li><a target= "_blank " ><span class="title" ><i class="fa fa-folder"></i>Stock</span></a></li>
				<li><a target= "_blank " ><span class="title" ><i class="fa fa-folder"></i>Warehouse</span></a></li>
				<li><a target= "_blank " ><span class="title" ><i class="fa fa-folder"></i>Call Report</span></a></li>
				<li><a target= "_blank " ><span class="title" ><i class="fa fa-folder"></i>NBO</span></a></li>
				<li><a target= "_blank " ><span class="title" ><i class="fa fa-folder"></i>Sample</span></a></li>
				<li><a target= "_blank " ><span class="title" ><i class="fa fa-folder"></i>RFQ</span></a></li>
				<li><a target= "_blank " ><span class="title" ><i class="fa fa-folder"></i>Forecast</span></a></li>
				<li><a target= "_blank " ><span class="title" ><i class="fa fa-folder"></i>Sales Order Biling</span></a></li>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
	</div>
	<!-- END SIDEBAR -->
	<!-- BEGIN CONTENT -->
	
	<div class="page-content-wrapper">
		<div class="page-content"> 
			<rapid:block name="content"> </rapid:block>	
		</div>	
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->


<!-- BEGIN FOOTER -->
<hr style=" height:5px;border:none;border-top:5px solid #005c94;" />
 
 
<!-- ca证书 -->
<script type="text/javascript"src="${rs}/js/ca_script.js"></script> 
<script src="${rs}/global/plugins/jquery.cookie.js" type="text/javascript"></script>
<SCRIPT type="text/javascript" src="${rs}/js/zjcacom.js"></SCRIPT>
<script type="text/javascript" src="${rs}/js/ADD.js"></script>
 
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
<script src="${rs}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${rs}/global/plugins/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script>
<!-- IMPORTANT! fullcalendar depends on jquery-ui.min.js for drag & drop support -->

<script src="${rs}/global/plugins/morris/raphael-min.js" type="text/javascript"></script>
<%-- <script src="${rs}/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script> --%>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${rs}/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${rs}/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<script src="${rs}/admin/layout2/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="${rs}/admin/layout4/scripts/demo.js" type="text/javascript"></script>

<script src="${rs}/js/plugins/bootstrap-dialog/js/bootstrap-dialog.min.js"></script>
<script src="${rs}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript" ></script>
<script src="${rs}/admin/pages/scripts/tasks.js" type="text/javascript"></script>

<script src="${rs}/global/plugins/multiselect/jquery.form.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/multiselect/multiselect.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/multiselect/jquery.easyui.min.js" type="text/javascript"></script>
<script src="${rs}/global/plugins/multiselect/easyui.css" type="text/javascript"></script>
<script type="text/javascript"src="${rs}/js/zTree/jquery.ztree.core-3.5.min.js"></script>


<!-- END PAGE LEVEL SCRIPTS -->

<script>
 
 
jQuery(document).ready(function() {
	
	$.ajax({
		url:"${ctx}/menu/loadXM",
		type: 'post', 
		dataType: 'json',//这里可以不写，但千万别写text或者html!!! 或者XML
		timeout: 100000000, 
		async: false,
		error: function(data){
		      //alert('Error loading XML document'+data); 
		}, 
		success: function(data){		
			 
			document.getElementById("userxm").innerText = data;
		}
	}); 
  
   Metronic.init(); // init metronic core componets
   Layout.init(); // init layout
   Demo.init(); // init demo features
   QuickSidebar.init(); // init quick sidebar
   Tasks.initDashboardWidget(); // init tash dashboard widget  
 //常用功能默认打开
 
 //modify by wangmin at 20160627 for关闭搜索框
 $(".tools").append('<button id="searchtwo" class="btn btn-sm blue filter-submit margin-bottom "><i class="fa fa-search"></i> <span id="searchc">显示查询条件</span></button><a id="searchone" class="collapse"  style="display:none;"></a>');

	  $("#searchone").trigger("click");
	  $("#searchtwo").toggle(
			  function () {
				  $("#searchone").trigger("click");
			    $("#searchc").html("隐藏查询条件");
			  },
			  function () {
				  $("#searchone").trigger("click");
				  $("#searchc").html("显示查询条件");
			  }
			);
	   
 //END 关闭搜索框

	var zccd = zclm.split("-");  //左侧菜单数组
	if(zccd=="" || zccd=="n,n,n,n"){
		 $("#常用功能").trigger("click");
	}
});
 
function modifyUserData(){
 
	window.location.href = "${ctx }/users/toModifyUserData";
	}
 </script>

<rapid:block name="script"></rapid:block>

</body>
</html>