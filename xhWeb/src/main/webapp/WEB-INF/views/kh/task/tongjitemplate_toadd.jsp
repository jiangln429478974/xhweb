<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
 
<rapid:override name="title">宁波市公共信用信息服务平台</rapid:override>
<rapid:override name="css">
    <link href="${rs}/css/plugins/jQueryUI/jquery-ui-1.10.4.custom.min.css" rel="stylesheet">
    <!-- Data Tables -->
    <link href="${rs}/css/plugins/jqgrid/ui.jqgrid.css" rel="stylesheet">
    <link href="${rs}/js/plugins/layer/skin/layer.css" rel="stylesheet">
    <style>
        /* Additional style to fix warning dialog position */
        #alertmod_table_list_2 {
            top: 900px !important;
        }
        
    </style>
</rapid:override>
<rapid:override name="content">

<div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox "> 
						<form  id="form_message">
		                      <div   style="width:100%">
		                      	<span  style="width:80px">统计模板名称:</span>
		                      	<input  type="text"  style="width:250px"/>
		                      </div>
		                    
		                     <div  style="width:100%;margin-top:12px">
		                      	<span  style="width:80px; vertical-align:top; ">统计模板内容:</span>
		                      	<textarea  type="text" style="resize: none;width:450px;height:300px"></textarea>
		                      </div>
		                      
		                      <div  style="width:100%;margin-top:12px" id="radio_area">
		                      </div>
		                      
		                       <div  style="margin-left:80px;margin-top:16px">
		                       		<button type="button" class="btn btn-primary" id="btn_send">提交</button>
		                       		<button type="button" class="btn btn-primary" id="btn_cancel" style="background-color:#F36A5A;margin-left:24px">放弃</button>
		                       </div>
						</form>	
                       
                </div>
            </div>
        </div>
    </div>
</rapid:override>
<rapid:override name="script">

<!-- <script src="${rs}/scripts/jquery-1.7.1.min.js"></script>  -->
<script src="${rs}/js/jquery-2.1.1.min.js"></script> 
<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${rs}/js/plugins/layer/layer.js"></script>

<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
<script src="${rs}/js/jquery.form.js"></script>

<script>
jQuery.noConflict();
var  $$ = jQuery;
function  checkRadio(obj){
	if(obj.value=="on"){
		$$("#radio_on").attr("checked","checked");
		$$("#radio_off").removeAttr("checked");
		
		/**
		alert($$("#radio_on").is(":checked"));
		alert($$("#radio_off").is(":checked"));
		**/
	}else{
		$$("#radio_off").attr('checked','checked');
		$$("#radio_on").removeAttr('checked');
	}
	
}
$(document).ready(function(){
	$("#radio_area").append("<span  style='width:120px;'>是否启用:</span>"+
	 	"<input  type='radio' id='radio_on' style='margin-left:26px' name='rad' value='on' checked='checked' onclick='checkRadio(this)'/><span>启用</span>"+
	 	"<input  type='radio' id='radio_off' style='margin-left:24px' name='rad' value='off' onclick='checkRadio(this)'/><span>停用</span>"
	 );
});
</script>

</rapid:override>
<%@ include file="../../template/base.jsp"  %>