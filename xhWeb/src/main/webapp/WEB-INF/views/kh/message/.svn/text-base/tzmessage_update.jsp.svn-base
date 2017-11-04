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
                
                	<div id="div_sfcheck" style="margin-left:6px;margin-top:12px;  display:none">
                		<span>身份验证:</span>
                		
                		<button type="button" class="btn btn-primary" id="btn_check">验证</button>
                	</div>
                    <div class="ibox-content">
						<form  id="form_message"  style="display:block;">
						 <input type="hidden" id="chooseOptionId" value="${map.BMID}">
						  <input type="hidden" name="ID"  value="${map.ID}">
							<div style="margin-left:6px;margin-top:12px;">
			                       	<span>接收部门:</span>
			                       	<select  id="select_bm"  name="BMID">
			                       	</select>
		                      </div>
		                      
		                        <div style="margin-left:-6px;margin-top:12px;">
			                       	<span>接收人角色:</span>
			                       	<select   name="JSRJS">
			                       		<option>所有角色</option>
			                       		<option  selected>主管</option>
			                       	</select>
	                       		</div>
		                      
							<div style="margin-left:6px;margin-top:12px;">
			                       	<span>短信类型:</span>
			                       	<select>
			                       		<option  value="1">彩信</option>
			                       		<option  value="2">普通短信</option>
			                       	</select>
		                      </div>
	                       
							 <div  style="margin-left:6px;margin-top:12px">
								<span style="vertical-align:top">短信内容:</span>  <textarea name="MBNR"  style="resize: none;width:450px;height:210px">${map.MBNR}</textarea>                    		
                       		</div>
	                     
	                       <div  style="margin-left:62px;margin-top:16px">
	                       		<button type="submit" class="btn btn-primary" id="btn_send">发送</button>
	                       		<button type="button" class="btn btn-primary" id="btn_cancel" style="background-color:#F36A5A">放弃</button>
	                       </div>
						</form>	
                       
                        <div class="jqGrid_wrapper">
                            <table id="userJqgrid"></table>
                            <div id="pager_list"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</rapid:override>
<rapid:override name="script">
<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${rs}/js/plugins/layer/layer.js"></script>

<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
<script src="${rs}/js/jquery.form.js"></script>
<script>

$(document).ready(function(){	
	
	$("#btn_check").click(function(){
		$("#form_message").css('display', 'block');
		$("#div_sfcheck").css('display', 'none');
	});
	
	/**
	$("#").click(function(){
		//alert($("#select_bm").val());
		  
		  $.ajax({
			  url:"${ctx}/message/findJSRbyBMId",
	            type: "POST",
	            data: {},
	            dataType: "json"
	        	}).done(function(data,ss) {
	        		for(var i=0; i<data.length; i++){
	        			//alert(data[i].id);       			
	        		}
	       			
		        }).fail(function(jqXHR, textStatus, errorThrown){
		       	 	layer.msg('数据删除失败，请稍后重试');
		        }	
		        
	        );
	});
	**/
	
	$('#select_bm').change(function(){
		alert($("#select_bm").val());
	});
	
	
	  $("#form_message").validate({
          submitHandler: function(form){
          	$("#form_message").ajaxSubmit({
                  url:'${ctx}/message/tzMessageUpdate',
                  dataType:'json',
                  type:'post',
                  success:function(data){
                      var code = data.code;
                      if(code == 0){
                         alert("修改成功");
                    	 // toastr.success('用户新增成功');
                          form.reset();
                          window.location.href = "${ctx}/message/getTzmessage";
                      }else{
                          toastr.error(data.msg);
                      }
                  },
                  error:function(html){
                      alert("提交数据失败，代码:" +html.status+ "，请稍候再试");
                
                  }
              });

              return false; //不刷新页面 
          },
          rules: {
        	  BMID: { required: true },
        	  JSRJS: { required: true },
        	  MBNR: { required: true }
          },
          messages: {
        	  BMID: { required: "请选择部门" },
        	  JSRJS: { required: "请选择接收人角色" },
        	  MBNR: { required: "请填写短息内容" }
          }
      });
});


</script>

</rapid:override>
<c:if test='${sessionScope.loginname!="hzh_fgw" }'>
<%@ include file="../../template/base.jsp"  %>
</c:if>
<c:if test='${sessionScope.loginname=="hzh_fgw" }'>
<%@ include file="../../template/basenomenu.jsp"  %>
</c:if> 