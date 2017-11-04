<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<rapid:override name="title">jqgrid</rapid:override>
<rapid:override name="content">
<div id="wrapper">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h4>密码重置</h4>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" id="pwdForm" method="post">
                            <input type="hidden" name="ID" value="${map.ID}">
                            <div class="form-group">
                                <label class="col-lg-3 control-label">用户名：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="YHM" disabled="disabled" placeholder="用户名" value="${map.YHM}" class="form-control">
                                </div>
                            </div>
                              
                            <div class="form-group">
                                <label class="col-lg-3 control-label">原密码：</label>
                                <div class="col-lg-8">
                                    <input type="password" name="YMM" placeholder="原密码" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">新密码：</label>
                                <div class="col-lg-8">
                                    <input type="password" id="XMM" name="XMM" placeholder="新密码" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">新密码验证：</label>
                                <div class="col-lg-8">
                                    <input type="password" id="XMMYZ" name="XMMYZ" placeholder="新密码验证" class="form-control">
                                </div>
                            </div>
                           
                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-8">
                                    <button class="btn btn-primary" type="submit"><i class="fa fa-check">重置</i></button>
                                </div>
                            </div>
                        </form>
                   <%-- </div>
                </div>
            </div>--%>
</rapid:override>
<rapid:override name="script">
<script src="${rs}/js/jquery.form.js"></script>
<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
<link href="${rs}/js/plugins/layer/skin/layer.css" rel="stylesheet">
<script src="${rs}/js/plugins/layer/layer.js"></script>
<!-- Page-Level Scripts -->
<script type="text/javascript">
  
    //以下为官方示例
    $().ready(function () {
	    	$("#pwdForm").validate({
	            submitHandler: function(form){
	            	layer.confirm('是否重置？', {
	        		    btn: ['确定','取消'], 
	        		    shade: false 
	        		}, function(){
		                $("#pwdForm").ajaxSubmit({
		                    url:'${ctx}/users/resetPwd',
		                    dataType:'json',
		                    type:'post',
		                    success:function(data){
		                        var code = data.code;
		                        if(code == 0){
		                            layer.msg('用户密码修改成功');
		                            window.location.href = '${ctx}/users/getInit';
		                            //form.reset();
		                        }else{
		                        	layer.msg(data.msg);
		                        }
		                        return false;
		                    },
		                    error:function(html){
		                    	layer.msg("提交数据失败，代码:" +html.status+ "，请稍候再试");
		                    }
		                });
	        		}, function(){
	        		    
	        		});
	            },
	            rules: {
	                YMM: { required: true },
	                XMM: { required: true },
	                XMMYZ: { required: true,equalTo:"#XMM" }
	            },
	            messages: {
	            	YMM: { required: "请输入原密码" },
	            	XMM: { required: "请输入新密码" },
	            	XMMYZ: { required: "请输入新密码验证" }
	            }
	        });
    });
</script>
</rapid:override>
<%@ include file="../template/base.jsp"  %>
