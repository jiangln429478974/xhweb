<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<rapid:override name="title">jqgrid</rapid:override>
<rapid:override name="content">
<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box blue">
				<!-- begin title-->
				<div class="portlet-title">
					<div class="caption">
						添加信息
					</div>
				</div>
				<div class="portlet-body form">
                        <form class="form-horizontal" id="myForm" method="post">
                        <div class="form-body">
                        <input type="hidden" name="BMC" value="${map.BMC }" />
                            <c:out value="${map.INSDY }"  escapeXml="false"/>
                            
                            </div>
                            <div class="form-actions">
							<div class="row">
                                <div class="col-lg-offset-3 col-lg-9">
                                    <button class="btn btn-primary" type="submit"><i class="fa fa-check">提交</i></button>
                               		<a href="javascript:history.go(-1);">
                               		<button class="btn yellow" type="button" id="back">
                               		<i class="fa fa-reply">返回</i></button></a>
                                </div>
                            </div>
                            </div>
                        </form>
                        </div>
                       </div>
                       </div>
                       </div>
</rapid:override>
<rapid:override name="script">
<script src="${rs}/js/jquery.form.js"></script>
<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
<link href="${rs}/js/plugins/layer/skin/layer.css" rel="stylesheet">
<script src="${rs}/js/plugins/layer/layer.js"></script>
<!-- Page-Level Scripts -->
<script type="text/javascript">
    
    $().ready(function () {
        $("#myForm").validate({
            submitHandler: function(form){
            	layer.confirm('是否新增？', {
        		    btn: ['确定','取消'], 
        		    shade: false 
        		}, function(){
	            	$("#myForm").ajaxSubmit({
	                    url:'${ctx}/demo/add',
	                    dataType:'json',
	                    type:'post',
	                    success:function(data){
	                        var msg = data.result;
	                        if(msg == 1){
	                            layer.msg('新增成功');
	                            //window.location.href = '${ctx}/users/getInit';
	                            form.reset();
	                        }else{
	                        	layer.msg('插入失败');
	                        }
	                    },
	                    error:function(html){
	                        alert("提交数据失败，代码:" +html.status+ "，请稍候再试");
	                  
	                    }
	                });
        		}, function(){
        		    
        		});
                return false; //不刷新页面 
            },
            <c:out value="${map.INSJSDY }"  escapeXml="false"/>
        });
        
    });
        
</script>
</rapid:override>
<%@ include file="../template/base.jsp"  %>