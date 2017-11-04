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

<!--bootstrap modal-->
<link href="${rs}/js/plugins/bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<link href="${rs}/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css" />
<link href="${rs}/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${rs}/css/zTree/zTreeStyle/zTreeStyle.css" type="text/css">
<!--bootstrap modal-->
<rapid:block name="css"></rapid:block>	
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<style>
	.page-header.navbar{ background-color:#005c94;}
	.page-header.navbar .page-logo{  margin-left: 20px;
    margin-right: 10px;
    width: 54px;}
	.page-header.navbar .search-form{ background:none;}
	.page-header.navbar .top-menu .navbar-nav > li.dropdown.open .dropdown-toggle {
  background-color: #f1f1f1;
}

</style>
<script type="text/javascript">
function logout(){
	try{
		if(confirm("确定退出吗？")){
// 			parent.window.opener=null;
// 			parent.window.close();
			var lm = "n-n-n-n"; 
			document.cookie="lm="+lm+";path=/";
			window.location.href = "${ctx}/logout";
			
		}
	}catch(e){}
}
</script>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-sidebar-closed-hide-logo">

<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner">
		<!-- BEGIN LOGO -->
		 
				<div class="page-logo">
					<!--<a href="${ctx }/">
					<img src="${rs}/admin/layout4/img/logo-light.png" alt="logo" class="logo-default"/>
					</a> -->
					   
				<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
				<li class="dropdown dropdown-user dropdown-dark">
						<a href="${ctx }/index" class="dropdown-toggle" style="height:74px;width:80px">
						<span class="username username-hide-on-mobile" style="display:inlin-block;margin-top:5px;font-size:16px;">首页</span>
<!-- 						<img/> -->
						</a>
					</li>
				</ul>
				</div>
				</div>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN PAGE ACTIONS -->
		<!-- DOC: Remove "hide" class to enable the page header actions -->
		
		<!-- END PAGE ACTIONS -->
		
		<div class="page-actions" style="margin-top: 0px;">
		
		<img src="${rs}/admin/layout4/img/logc.png" alt="logo"/>
		</div>
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
					
					<!-- END TODO DROPDOWN -->
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<li class="dropdown dropdown-user dropdown-dark">
						<a href="${ctx }/resources/client/CZSC.pdf" target="_blank" class="dropdown-toggle" style="display:inlin-block;height:74px;">
						<span class="username username-hide-on-mobile" style="display:inlin-block;margin-top:5px">平台操作手册</span>
<!-- 						<img/> -->
						</a>
					</li>
					<li class="dropdown dropdown-user dropdown-dark">
						<a href="${ctx }/resources/client/PTGLGD.pdf" target="_blank" class="dropdown-toggle" style="display:inlin-block;height:74px">
						<span class="username username-hide-on-mobile" style="display:inlin-block;margin-top:5px">平台管理规定</span>
<!-- 						<img/> -->
						</a>
					</li>
					<li class="dropdown dropdown-user dropdown-dark">
						<a href="#" class="dropdown-toggle" onclick="modifyUserData();">
						<span class="username username-hide-on-mobile" id="userxm">
<%-- 						<shiro:principal/>   --%>
						</span>
						<!-- DOC: Do not remove below empty space(&nbsp;) as its purposely used -->
						<img alt="" class="img-circle" src="${ctx }/resources/admin/layout4/img/people.png"/>
						</a>
					</li>
<!-- 					<li> -->
<!-- 						<span style="color:#FFFFFF;font-size:20px; z-index: auto; text-align: center;"> -->
<%-- 						当前用户：<c:out value="${name}"/> </span> --%>
<!-- 						DOC: Do not remove below empty space(&nbsp;) as its purposely used -->
<!-- 					</li> -->
					<!-- END USER LOGIN DROPDOWN -->
					<!-- BEGIN USER LOGIN DROPDOWN -->
<!-- 					<li class="dropdown dropdown-extended quick-sidebar-toggler"> -->
<!-- 	                    <span class="sr-only">Toggle Quick Sidebar</span> -->
<%-- 	                    <a href="${ctx}/logout"><i class="icon-logout"></i></a> --%>
<!-- 	                </li> -->
					<li class="dropdown dropdown-extended quick-sidebar-toggler" onclick="javascript:logout()" >
	                    <span  class="sr-only">Toggle Quick Sidebar</span>
	                    <i class="icon-logout"></i>
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
	<div class="page-sidebar-wrapper" style="display:none">
		<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
		<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
		<div class="page-sidebar navbar-collapse collapse" style="background:url(/nbggxy/resources/admin/layout4/img/bottome.jpg) left bottom no-repeat #fff; padding-bottom:200px;">

			<!-- BEGIN SIDEBAR MENU -->
			<!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
			<!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
			<!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
			<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
			<!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
			<!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
			<ul id="menuTree" class="page-sidebar-menu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
				<li class="start active ">
					<a href="${ctx}/index">
					<i class="icon-home"></i>
					<span class="title">首页</span>
					</a>
				</li>
				
				
				
				
				
				

			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
	</div>
	<!-- END SIDEBAR -->
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content_hidd">
			<rapid:block name="content"></rapid:block>	
		</div>	
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->


<!-- BEGIN FOOTER -->
<hr style=" height:5px;border:none;border-top:5px solid #005c94;" />
<div class="page-footer" style="text-align:center; background:#f2f2f2;height:100px;margin-top:-25px;" > 
	<div style="padding:2px; margin-top:30px;">	2015 &copy; 宁波市公共信用信息平台  </div>
	<div>技术支持：中国软件与技术服务股份有限公司 宁波分公司</div>
    <div><span>技术支持电话：0574-83873515</span>&nbsp;&nbsp;<span>0574-87360806</span></div>
    <div class="page-footer"  style="background:#f2f2f2;" ></div>
</div>

<!-- <div class="page-footer" style="text-align:center;">  -->
<!-- 		技术支持：中国软件与技术服务股份有限公司 宁波分公司 -->
<!-- </div> -->
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
<!-- ca证书 -->
<script type="text/javascript"src="${rs}/js/ca_script.js"></script> 
<script src="${rs}/global/plugins/jquery.cookie.js" type="text/javascript"></script>

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
		      alert('Error loading XML document'+data); 
		}, 
		success: function(data){		
			//alert(data);
			//$("#id").val(data);
			document.getElementById("userxm").innerText = data;
		}
	}); 
	
	$.ajax({
		url:"${ctx}/menu/loadMenu?random="+Math.random(),
		type: 'post', 
		dataType: 'json',//这里可以不写，但千万别写text或者html!!! 或者XML
		timeout: 100000000, 
		async: false,
		error: function(data){
		      alert('Error loading XML document'+data); 
		}, 
		success: function(data){		
			loadMenu(data);	
		}
	}); 
   Metronic.init(); // init metronic core componets
   Layout.init(); // init layout
   Demo.init(); // init demo features
   QuickSidebar.init(); // init quick sidebar
    //Index.init(); // init index page
 Tasks.initDashboardWidget(); // init tash dashboard widget  
//  alert(1);
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
 
 
 var strCookie=document.cookie;
	var zclm = "";

	var arrCookie=strCookie.split("; "); 
	//遍历cookie数组，处理每个cookie对
	for(var i=0;i<arrCookie.length;i++){
	             var arr=arrCookie[i].split("=");
	             //找到名称为lm的cookie，并返回它的值
	             if("lm"==arr[0]){
	            	 zclm=arr[1];
	                    break;
	             }
	} 
	
//	alert(zclm);
	var zccd = zclm.split("-");  //左侧菜单数组
	
//  alert(zccd);
	if(zccd=="" || zccd=="n,n,n,n"){
		 $("#常用功能").trigger("click");
	}

//  alert(2)
// alert( $("#常用功能").html());
});



// function logout(){
	
// 	window.location.href = "${ctx}/logout";
// }
function modifyUserData(){
//   	var xlh = "";
<%-- 	if('<%=request.getSession().getAttribute("ISCA")%>'=="N"){ --%>
<%-- 		xlh ='<%=request.getSession().getAttribute("S_CABZF")%>'; --%>
// 	}else{
<%-- 	  xlh =cazs_select('<%=request.getSession().getAttribute("S_CABZF")%>');  --%>
// 	} 
// 	 if(xlh!="error"){
// 	 $.ajax({
// 			url : '${ctx}/testca',
// 			type : "POST",
// 			data : {
// 				"passport" : xlh 
// 			},
// 			dataType : "json"
// 		}).done(function(resultData, ss) {
// 			if(resultData.SFYX=='Y'){ 
	window.location.href = "${ctx }/users/toModifyUserData";
	

// }else{
// 	layer.msg('无此CA用户。');
// }
// }).fail(function(jqXHR, textStatus, errirThrown) {
// layer.msg('数据加载失败,请稍后重试');
// });

// }else{
// layer.msg("请确认安装数字证书客户端。");
// }
	
	 
}
/* function loadMenu(data){
	
	var now_href=window.location.href;
	//当前页面的地址
	var now_href_part=now_href.split("nbggxy")
// 	alert(now_href_part[1]);
	//上级菜单
	var parent_menu;
	//判断子栏目点中
	var is_now;
	var liStr = "";
	for( var i = 0; i < data.length; i++){
		//d是第一级栏目
		var d = data[i]; 
		if(d.SJGNCDMC == "" || d.SJGNCDMC == null){
			var ulStr = "";
			var towtrue=false;
			for( var j = 0; j < data.length; j++){
				//n是第二级
				var n = data[j];
				if(n.SJGNCDID==d.ID){
					var mStr = "";
					var mtrue=false;
					//begin 罗列第三级目录
					for( var k = 0; k < data.length; k++){
						//m是第三级
						m = data[k];
						if(n.ID==m.SJGNCDID){
							if(m.URL==now_href_part[1]){
									if(m.URL=="http://10.19.13.245/jcms/"){
										mStr += "<li class=\"active\"><a href=\"" + m.URL + "\"  target=\"_blank\" ><i class=\"fa fa-dot-circle-o \"></i>"+m.GNCDMC+"</a></li>";
										mtrue=true;
										towtrue=true;
									} else{
										mStr += "<li class=\"active\"><a href=\""+"${ctx}" + m.URL + "\"><i class=\"fa fa-dot-circle-o \"></i>"+m.GNCDMC+"</a></li>";
										mtrue=true;
										towtrue=true;
									}
								
							}else{
								if(m.URL=="http://10.19.13.245/jcms/"){
									mStr += "<li><a href=\"" + m.URL + "\" target=\"_blank\" ><i class=\"fa fa-circle-thin \"></i>"+m.GNCDMC+"</a></li>";
								}else{
									mStr += "<li><a href=\""+"${ctx}" + m.URL + "\"><i class=\"fa fa-circle-thin \"></i>"+m.GNCDMC+"</a></li>";
								}
								
								}
							}
					}
					//end 第三级
					//如果第三级是空的，则添加第二级
					if(mStr==""){
						if(n.URL==now_href_part[1]){
							towtrue=true;
							if(n.URL=="http://10.19.13.245/jcms/"){
								ulStr += "<li class=\"active\"><a href=\"" + n.URL + "\" target=\"_blank\" ><i class=\"fa fa-book\"></i>"+n.GNCDMC+"</a></li>";
							}else{
								ulStr += "<li class=\"active\"><a href=\""+"${ctx}" + n.URL + "\"><i class=\"fa fa-book\"></i>"+n.GNCDMC+"</a></li>";
							}
						}else{
							if(n.URL=="http://10.19.13.245/jcms/"){
								ulStr += "<li><a href=\"" + n.URL + "\" target=\"_blank\" ><i class=\"fa fa-book\"></i>"+n.GNCDMC+"</a></li>";
							}else{
								ulStr += "<li><a href=\""+"${ctx}" + n.URL + "\"><i class=\"fa fa-book\" target=\"_blank\"></i>"+n.GNCDMC+"</a></li>";
							}
						}
					} else {
						ulStr += "<li><a href=\"javascript:;\"><i class=\"fa fa-book\"></i><span class=\"title\">"+n.GNCDMC+"</span>";
						if(mtrue==true){
							ulStr+="<span class=\"arrow open \"></span></a>";
							ulStr+="<ul class=\"sub-menu\" style=\"display: block;\">"+mStr+"</ul>";
						}else{
							ulStr+="<span class=\"arrow \"></span></a>";
							ulStr+="<ul class=\"sub-menu\">"+mStr+"</ul>";
						}
						
						ulStr += "</li>"
					}
				}
			}
			if(ulStr==""){
				if(d.URL=="http://10.19.13.245/jcms/"){
					liStr += "<li><a href=\"" + d.URL + "\"  target=\"_blank\" ><span class=\"title\" >"+d.GNCDMC+"</span></a></li>";
				}else{
					liStr += "<li><a href=\"" +"${ctx}" + d.URL + "\"><span class=\"title\">"+d.GNCDMC+"</span></a></li>";
				}
			} else {
				
				liStr += "<li><a href=\"javascript:;\"><span class=\"title\">"+d.GNCDMC+"</span>";
				if(towtrue==true){
					liStr+="<span class=\"arrow open \"></span></a>";
					liStr+="<ul class=\"sub-menu\" style=\"display: block;\">"+ulStr+"</ul>";
				}else{
					liStr+="<span class=\"arrow\"></span></a>";
					liStr+="<ul class=\"sub-menu\">"+ulStr+"</ul>";
				}
				
				liStr += "</li>";
			}
		}
	}
	$("#menuTree").append(liStr);
} */
     
function loadMenu(data){
	
	var name='<%=request.getSession().getAttribute("name")%>';
	var pass2='<%=request.getSession().getAttribute("pass")%>';
	var bmmczm='<%=request.getSession().getAttribute("bmmc")%>';
	var zwmc='<%=request.getSession().getAttribute("zwmc")%>';
	var bmmc = encodeURI(encodeURI(bmmczm)); 
	var varzwmc = encodeURI(encodeURI(zwmc));  
	
	var pass = escape(pass2) ;
	//alert(bmmczm);
	
	var strCookie=document.cookie;
	var zclm = "";
 
	var arrCookie=strCookie.split("; "); 
	//遍历cookie数组，处理每个cookie对
	for(var i=0;i<arrCookie.length;i++){
	             var arr=arrCookie[i].split("=");
	             //找到名称为lm的cookie，并返回它的值
	             if("lm"==arr[0]){
	            	 zclm=arr[1];
	                    break;
	             }
	} 
	
// 	alert(zclm);
	var zccd = zclm.split("-");  //左侧菜单数组
// 	alert(zccd);
// 	alert(yi+"bbbb"+er+"bbbb"+sa+"bbbb"+si);
	var yi=zccd[0];
	var er=zccd[1];
	var sa=zccd[2];
	var si=zccd[3];
//  	alert(yi+"bbbb"+er+"bbbb"+sa+"bbbb"+si);
	var now_href=window.location.href;
	//当前页面的地址
	var now_href_part=now_href.split("nbggxy")
// 	alert(now_href_part[1]);
	//上级菜单
/* 	var parent_menu;
	//判断子栏目点中
	var is_now; */
	
	var liStr = "";
	for( var i = 0; i < data.length; i++){
		//d是第一级栏目
		var d = data[i];
		if(d.SJGNCDMC == "" || d.SJGNCDMC == null){
			var ulStr = "";
			var towtrue=false;
			//begin 罗列第二级目录
			for( var j = 0; j < data.length; j++){
				//n是第二级
				var n = data[j];
				if(n.SJGNCDID==d.ID){
					var mStr = "";
					var mtrue=false;
					//begin 罗列第三级目录
					for( var k = 0; k < data.length; k++){
						//m是第三级
						var m = data[k];
						if(n.ID==m.SJGNCDID){
							 var bStr = ""; //第四级也要判断过
							 var btrue=false;
							//begin 罗列第四级目录
							for(var b=0; b<data.length;b++){
								//b 是第四级
								var l=data[b];
								if(m.ID==l.SJGNCDID){
									
									if(i==yi&&j==er&&k==sa&&b==si){
									
// 									if(l.URL==now_href_part[1]){
										 if(l.URL=="http://10.19.13.245/jcms/"){
											// bStr += "<li class=\"active\"><a href=\"" + l.URL + "\"  target=\"_blank\" ><i class=\"fa fa-dot-circle-o \"></i>"+l.GNCDMC+"</a></li>";
											 bStr += "<li><a href=\"" + l.URL+"interface/ldap/receive.jsp?state=C&result=T&loginuser="+name+ "&loginpass="+pass+"&domainname="+bmmc+"&alldomainname="+bmmc+"&modifyuser=T&ndlogin=1&t_name="+varzwmc+  "\"  target=\"_blank\" ><span class=\"title\" >"+l.GNCDMC+"</span></a></li>";
							
											btrue=true;
											 mtrue=true;
											towtrue=true; 
										 } else {
											 bStr += "<li class=\"active\"><a href='#' onclick=\"casubmit('" + l.URL + "','" + i + "','" + j + "','" + k + "','" + b + "','" + l.SFCAYZ + "')\"  ><i class=\"fa fa-dot-circle-o \"></i>"+l.GNCDMC+"</a></li>"; 
											
											 btrue=true;
											 mtrue=true;
											 towtrue=true;
										 } 
									 }else{
										 if(l.URL=="http://10.19.13.245/jcms/"){
											 bStr += "<li><a href=\"" + l.URL + "\" target=\"_blank\" ><i class=\"fa fa-circle-thin \"></i>"+l.GNCDMC+"</a></li>";
										 }else {
											 bStr += "<li><a href='#' onclick=\"casubmit('" + l.URL + "','" + i + "','" + j + "','" + k + "','" + b + "','" + l.SFCAYZ + "')\"  ><i class=\"fa fa-circle-thin \"></i>"+l.GNCDMC+"</a></li>";
										 } 
							       }
									}
								}
								//end 第四级
								if(bStr==""){
									
									if(i==yi&&j==er&&k==sa&&'n'==si){
// 									if(m.URL==now_href_part[1]){
										if(m.URL=="http://10.19.13.245/jcms/"){
										//	mStr += "<li class=\"active\"><a href=\"" + m.URL + "\"  target=\"_blank\" ><i class=\"fa fa-dot-circle-o \"></i>"+m.GNCDMC+"</a></li>";
										 	mStr += "<li><a href=\"" + m.URL+"interface/ldap/receive.jsp?state=C&result=T&loginuser="+name+ "&loginpass="+pass+"&domainname="+bmmc+"&alldomainname="+bmmc+"&modifyuser=T&ndlogin=1&t_name="+varzwmc+  "\"  target=\"_blank\" ><span class=\"title\" >"+m.GNCDMC+"</span></a></li>";
							
									     	mtrue=true;
											towtrue=true;
										} else {
											mStr += "<li class=\"active\"><a href='#' onclick=\"casubmit('" + m.URL + "','" + i + "','" + j + "','" + k + "','n','" + m.SFCAYZ + "')\"  ><i class=\"fa fa-dot-circle-o \"></i>"+m.GNCDMC+"</a></li>";
											mtrue=true;
											towtrue=true; 
										}   
									}else{
										if(m.URL=="http://10.19.13.245/jcms/"){
										 //mStr += "<li><a href=\"" + m.URL + "\" target=\"_blank\" ><i class=\"fa fa-circle-thin \"></i>"+m.GNCDMC+"</a></li>";
											mStr += "<li><a href=\"" + m.URL+"interface/ldap/receive.jsp?state=C&result=T&loginuser="+name+ "&loginpass="+pass+"&domainname="+bmmc+"&alldomainname="+bmmc+"&modifyuser=T&ndlogin=1&t_name="+varzwmc+  "\"  target=\"_blank\" ><span class=\"title\" >"+m.GNCDMC+"</span></a></li>";
										} else {
											mStr += "<li><a href='#' onclick=\"casubmit('" + m.URL + "','" + i + "','" + j + "','" + k + "','n','" + m.SFCAYZ + "')\"  ><i class=\"fa fa-circle-thin \"></i>"+m.GNCDMC+"</a></li>";
										 }  
									}
								}else{ 
									
									mStr += "<li><a href=\"javascript:;\"><i class=\"fa fa-book\"></i><span class=\"title\">"+m.GNCDMC+"</span>";
									if(btrue==true){
										mStr+="<span class=\"arrow open \"></span></a>"; 
										mStr+="<ul class=\"sub-menu\" style=\"display: block;\">"+bStr+"</ul>";
									}else{
										mStr+="<span class=\"arrow \"></span></a>";
										mStr+="<ul class=\"sub-menu\">"+bStr+"</ul>";
									}
									mStr += "</li>"
								}
							}
					}
					//end 第三级
					//如果第三级是空的，则添加第二级
					if(mStr==""){
						
						if(i==yi&&j==er&&'n'==sa&&'n'==si){
// 						if(n.URL==now_href_part[1]){
							
	
							towtrue=true;
							if(n.URL=="http://10.19.13.245/jcms/"){
								//ulStr += "<li class=\"active\"><a href=\"" + n.URL + "\" target=\"_blank\" ><i class=\"fa fa-book\"></i>"+n.GNCDMC+"</a></li>";
								ulStr += "<li><a href=\"" + n.URL+"interface/ldap/receive.jsp?state=C&result=T&loginuser="+name+ "&loginpass="+pass+"&domainname="+bmmc+"&alldomainname="+bmmc+"&modifyuser=T&ndlogin=1&t_name="+varzwmc+  "\"  target=\"_blank\" ><span class=\"title\" >"+n.GNCDMC+"</span></a></li>";
							}
							 else {
								ulStr += "<li class=\"active\"><a href='#' onclick=\"casubmit('" + n.URL + "','" + i + "','" + j + "','n','n','" + n.SFCAYZ + "')\"  ><i class=\"fa fa-book\"></i>"+n.GNCDMC+"</a> </li>";
							}  
						}else{
							if(n.URL=="http://10.19.13.245/jcms/"){
								//ulStr += "<li><a href=\"" + n.URL + "\" target=\"_blank\" ><i class=\"fa fa-book\"></i>"+n.GNCDMC+"</a></li>";
								ulStr += "<li><a href=\"" + n.URL+"interface/ldap/receive.jsp?state=C&result=T&loginuser="+name+ "&loginpass="+pass+"&domainname="+bmmc+"&alldomainname="+bmmc+"&modifyuser=T&ndlogin=1&t_name="+varzwmc+  "\"  target=\"_blank\" ><span class=\"title\" >"+n.GNCDMC+"</span></a></li>";
							} else  {
								ulStr += "<li><a href='#' onclick=\"casubmit('" + n.URL + "','" + i + "','" + j + "','n','n','" + n.SFCAYZ + "')\"  ><i class=\"fa fa-book\"></i>"+n.GNCDMC+"</a></li>";
							}  
						}
					} else {
						ulStr += "<li><a href=\"javascript:;\"><i class=\"fa fa-book\"></i><span class=\"title\">"+n.GNCDMC+"</span>";
						if(mtrue==true){
							ulStr+="<span class=\"arrow open \"></span></a>";
							ulStr+="<ul class=\"sub-menu\" style=\"display: block;\">"+mStr+"</ul>";
						}else{
							ulStr+="<span class=\"arrow \"></span></a>";
							ulStr+="<ul class=\"sub-menu\">"+mStr+"</ul>";
						}
						
						ulStr += "</li>"
					}
				}
			}
			//end 第二级
			if(ulStr==""){
				if(d.URL=="http://10.19.13.245/jcms/"){
				//	liStr += "<li><a href=\"" + d.URL + "\"  target=\"_blank\" ><span class=\"title\" >"+d.GNCDMC+"</span></a></li>";
					liStr += "<li><a href=\"" + d.URL+"interface/ldap/receive.jsp?state=C&result=T&loginuser="+name+ "&loginpass="+pass+"&domainname="+bmmc+"&alldomainname="+bmmc+"&modifyuser=T&ndlogin=1&t_name="+varzwmc+  "\"  target=\"_blank\" ><span class=\"title\" >"+d.GNCDMC+"</span></a></li>";
				}
				  else  {
					liStr += "<li><a href='#' onclick=\"casubmit('" + d.URL + "','" + i + "','n','n','n','" + d.SFCAYZ + "')\"  ><span class=\"title\" >"+d.GNCDMC+"</span></a></li>";
				}  
			} else {
// 				style='background:url(/nbggxy/resources/admin/layout4/img/1.png) '
				liStr += "<li ><a href=\"javascript:;\" id ='"+d.GNCDMC+"' ><span class=\"title\">"+d.GNCDMC+"</span>"; 
				if(towtrue==true){
					liStr+="<span class=\"arrow open \"></span></a>";
					liStr+="<ul class=\"sub-menu\" style=\"display: block;\">"+ulStr+"</ul>";
				}else{
					liStr+="<span class=\"arrow \"></span></a>";
					liStr+="<ul class=\"sub-menu\">"+ulStr+"</ul>";
				}
				
				liStr += "</li>";
			}
		}
		//end 第一级
	}
	$("#menuTree").append(liStr);
	
}

			
function delCookie(name)
{
var exp = new Date();
exp.setTime(exp.getTime() - 1);
var cval=getCookie(name);
if(cval!=null)
document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}

function casubmit(url,i,j,k,b,SFCAYZ){
	
// 	alert(i+"aaaaaaaaaaa"+j+"aaaaaaaaaaa"+k+"aaaaaaaaaaa"+b+"aaaaaaaaaaa");
// 	 $.cookie("yi", null);
// 	 $.cookie("er", null);
// 	 $.cookie("sa", null);
// 	 $.cookie("si", null);
	
// 	 $.cookie("yi", i, 1);
// 	 $.cookie("er", j, 1);
// 	 $.cookie("sa", k, 1);
// 	 $.cookie("si", b, 1);

var lm = i+"-"+j+"-"+k+"-"+b; 
document.cookie="lm="+lm+";path=/";

//alert(lm);

	if(SFCAYZ=="1"&&'<%=request.getSession().getAttribute("S_Y")%>'!=1){
		

	var cabzf = $("#cabzf").val(); 
	 if(cabzf=="0"){
		 
			 
		  	var xlh = "";
			if('<%=request.getSession().getAttribute("ISCA")%>'=="N"){
				xlh ='<%=request.getSession().getAttribute("S_CABZF")%>';
			}else{
			  xlh =cazs_select('<%=request.getSession().getAttribute("S_CABZF")%>'); 
			} 
			 
		 if(xlh!="error"){
		 $.ajax({
				url : '${ctx}/testca',
				type : "POST",
				data : {
					"passport" : xlh 
				},
				dataType : "json"
			}).done(function(resultData, ss) {
				if(resultData.SFYX=='Y'){
					 $("#cabzf").val(resultData.CABZF); 
					window.location.href = "${ctx}"+url;
				}else{
					layer.msg('无此CA用户。');
				}
			}).fail(function(jqXHR, textStatus, errirThrown) {
				layer.msg('数据加载失败,请稍后重试');
			});
	 
		 }else{
			 layer.msg("请确认安装数字证书客户端。");
		 }
	 }
	 
}else{
	window.location.href = "${ctx}"+url;
}
}

function setCookie(c_name,value,expiredays){    
	var exdate=new Date()    
	exdate.setDate(exdate.getDate()+expiredays)    
	document.cookie=c_name+ "=" +escape(value)+   
	((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
	}//读取cookie
function getCookie(c_name){    
		if (document.cookie.length>0)      
		{     
			c_start=document.cookie.indexOf(c_name + "=")      
			if (c_start!=-1)       
			{        
				c_start=c_start + c_name.length+1        
				c_end=document.cookie.indexOf(";",c_start)        
				if (c_end==-1) c_end=document.cookie.length        
				return unescape(document.cookie.substring(c_start,c_end))  
				}       
			}    
		return ""
	}
// function casubmit2(){  
// 	var cabzf = $("#cabzf").val(); 
// 	 if(cabzf=="0"){ 
<%-- 	 var xlh =cazs_select('<%=request.getSession().getAttribute("S_CABZF")%>');   --%>
	 
	//	 if(xlh!="error"){
// 		 $.ajax({
// 				url : '${ctx}/testca',
// 				type : "POST",
// 				data : {
// 					"passport" : xlh 
// 				},
// 				dataType : "json"
// 			}).done(function(resultData, ss) {
// 				if(resultData.SFYX=='Y'){
// 					//window.location.href = "${ctx}"+url;
// 				 $("#cabzf").val(resultData.CABZF);
// 				}else{
// 					layer.msg('无此CA用户。');
// 				}
// 			}).fail(function(jqXHR, textStatus, errirThrown) {
// 				layer.msg('数据加载失败,请稍后重试');
// 			});
	 
// 		 }else{
// 			 layer.msg("请确认安装数字证书客户端。");
// 		 }
	 
		 
// 	 }
// }
</script>
<!-- END JAVASCRIPTS -->
<input type="text" id = "cabzf" value = "0" style="display:none;"></input>
</body>
<!-- END BODY -->


<rapid:block name="script"></rapid:block>
</body>
</html>