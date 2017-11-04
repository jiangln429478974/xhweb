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
<title>宁波市社会信用工作平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
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
<!-- forget -->
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

 <LINK href="${rs}/js/style.css" rel="stylesheet" type="text/css">
<!--bootstrap modal-->
<rapid:block name="css"></rapid:block>	
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
<object id="oCAPICOM"
     codeBase=" ${rs}/client/capicom.cab #version=2,0,0,3"
       classid="clsid:A996E48C-D3DC-4244-89F7-AFA33EC60679" style="display:none;">
</object>
<div class="logo"> 	
	
	<img src="${rs}/admin/layout4/img/logo-big.png" alt=""/>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->

<div class="content" style="height:340px">
	<!-- BEGIN LOGIN FORM -->
 
<form  name="form1" class="login-form" action="${ctx}/loginPass" method="post">
<div>
       <h3 class="form-title">用户登入</h3></div>
       <span style="color: red;"><c:out value="${message}"/><c:out value="${msg}"/></span>
       <div class="alert alert-danger display-hide" style="height:10%;">
			<button class="close" data-close="alert"></button>
			<span>
			请输入用户名密码. </span>
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
		<div style="height:10px;"></div>
		<div class="form-actions text-center" >
		     <div><button type="submit" class="btn btn-success uppercase">登录</button></div>
		     <a target="_blank" style="float:right;margin-top:-25px;" onclick="show()">忘记密码？</a>
		      </br></br>
<%-- 		       <a href="${rs}/client/ZJCA.rar" target="_blank">下载数字证书客户端</a> --%>
				<a href="${ctx}/file/download" target="_blank">下载数字证书客户端</a>初始PIN码为111111<br/> 
				<!-- <a href="${ctx}/file/downloadfile?filename=ZHSQ.zip" target="_blank">宁波市公共信用信息平台帐号业务申请</a> -->
				<a href="/nbggxy/shenqing" target="_blank">账号申请指南</a>
		</div>
	    <input type="hidden" name="passport" value="">
  
</form>
	<!-- END LOGIN FORM -->
	

</div>
<div class="copyright">
	 <div>2015 © 宁波市公共信用信息平台</div>
	 <div>技术支持联系电话：0574-83873513   0574-87360806 </div>
	 <div>平台需使用微软公司IE8.0或以上版本</div>
</div>
   <div id="bgDiv" class = "loginbgDiv"   style="display:none;position:absolute;top:0;background:#777;filter:progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75);opacity:0.7;left:0;"> 
   </div>
   <div  id="calogin" class="calogin portlet box grey-cascade" style="display:none;" >
	 <div class = "portlet-title" style="background-color:#428bca;">
	 	<div class="caption2"  >请选择您要用的证书
	 	</div>
	 </div>
	 <div   id="cacert" class = "portlet-body" style ="min-height:150px;_height:150px; "  >
	 </div>
  </div>  
<div  id="calogin2" class="calogin2 portlet box grey-cascade" style="display:none;top:26%;left:47.5%;" >
	 <div class = "portlet-title" style="background-color:#428bca;">
	 	<div class="caption2"> 提示
	 	</div>
	 </div>
	 <div   id="cacert2" class = "portlet-body" style ="min-height:150px;_height:150px;  "  >
		 <div style=" text-align:left;font-size:16px;padding:15px;text-indent:2em;">请联系信用中心进行密码重置,联系电话0574-83873513。</div>
		 <br>
		 <div><input type = "button" value = "确定" onclick = "ex()" style="margin-bottom: 15px;" class="btn btn-primary"></input></div>
 
	 </div>
	  
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
 
<script type="text/javascript">
function show(){
	document.getElementById("bgDiv").style.display = "block";
	document.getElementById("calogin2").style.display = "block"; 
}
function ex(){
	 document.getElementById("bgDiv").style.display = "none";
	 document.getElementById("calogin2").style.display = "none"; 
}
function submitform()
{ 
	
	/*  var CAPICOM_CURRENT_USER_STORE = 2  
	var CAPICOM_MY_STORE = "My"  
	var CAPICOM_STORE_OPEN_READ_ONLY = 0  
	var CAPICOM_STORE_OPEN_EXISTING_ONLY = 128  
	var CAPICOM_CERTIFICATE_FIND_KEY_USAGE = 12  
	var CAPICOM_DIGITAL_SIGNATURE_KEY_USAGE = 128  
	var CAPICOM_CERT_INFO_SUBJECT_EMAIL_NAME = 2  
	var CAPICOM_HASH_ALGORITHM_SHA1 = 0   
	var CAPICOM_VERIFY_SIGNATURE_AND_CERTIFICATE = 1  
	var CAPICOM_CERT_INFO_SUBJECT_SIMPLE_NAME = 0  
	var CAPICOM_CERT_INFO_ISSUER_SIMPLE_NAME = 1  
	var CAPICOM_CERT_INFO_SUBJECT_EMAIL_NAME = 2  
	var CAPICOM_CERT_INFO_ISSUER_EMAIL_NAME = 3  
	var CAPICOM_ENCODE_BASE64 = 0;  
	var CAPICOM_VERIFY_SIGNATURE_ONLY = 0;  
	
	
	var store = new ActiveXObject("CAPICOM.Store");  
    var oSigner = new ActiveXObject("CAPICOM.Signer");  
    var oSignedData = new ActiveXObject("CAPICOM.SignedData");  
    //store.Open(CAPICOM_CURRENT_USER_STORE, CAPICOM_MY_STORE,   
    //        CAPICOM_STORE_OPEN_READ_ONLY | CAPICOM_STORE_OPEN_EXISTING_ONLY);  
   
    store.Open(CAPICOM_CURRENT_USER_STORE,"My",CAPICOM_STORE_OPEN_READ_ONLY);
    certs = store.Certificates.Find(CAPICOM_CERTIFICATE_FIND_KEY_USAGE,  CAPICOM_DIGITAL_SIGNATURE_KEY_USAGE, true);
  //  alert(certs );
   // alert(certs.Item(1).SerialNumber );
    // certs = store.Certificates ;   
     var mycerts= certs.Select("选择证书","请选择证书",false);
     //alert(mycerts.Item(1).SerialNumber );
     form1.passport.value= mycerts.Item(1).SerialNumber;
   // certs = certs.Select();//弹出证书选择框  
     var cert = mycerts (1);  
    oSigner.Certificate = cert; 
   // oSignedData.Content = "123456";  
   // var signResult = oSignedData.Sign(oSigner, false, CAPICOM_ENCODE_BASE64);  
   
   
     */
    form1.submit(); 

       /*  var signature= SignText("999");  
       if(signature==null)return;
       form1.passport.value= signature; 
       form1.submit();   */
        
}
</script>
<!-- END JAVASCRIPTS -->
</div>
</body>
<!-- END BODY -->
</html>