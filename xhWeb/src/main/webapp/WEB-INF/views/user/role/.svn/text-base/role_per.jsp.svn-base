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
                        <h3>功能授权</h3>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" id="deptForm" method="post">
                            <input type="hidden" name="ID" value="${map.ID}">
                           <div class="form-group">
                                <label class="col-lg-3 control-label">角色名：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="JSM" placeholder="角色名" class="form-control" value="${map.JSM }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">状态：</label>
                                <input type="hidden" id="ZT" value="${map.ZT }"/>
                                <div class="col-lg-8">
                                    <select name="ZT" id="ZT_SEL">
                                    	<option value="1">启用</option>
                                    	<option value="2">停用</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">安全等级：</label>
                                <input type="hidden" id="AQJB" value="${map.AQJB }"/>
                                <div class="col-lg-8" id="AQJB_SEL">
                                    <select name="AQJB">
                                    	<option value="1">低</option>
                                    	<option value="2">中</option>
                                    	<option value="3">高</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">角色描述：</label>
                                <div class="col-lg-8">
                                    <textarea type="text" name="JSMS" placeholder="角色描述" class="form-control"  style="resize: none;" rows="5" cols="10">${map.JSMS }</textarea>
                                </div>
                            </div>
                            
                           
                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-8">
                                    <button class="btn btn-primary" type="submit"><i class="fa fa-check">修改</i></button>
                               		<a href="${ctx}/role/getInit"><button class="btn btn-warning" type="button" id="back"><i class="fa fa-check">返回</i></button></a>
                                </div>
                            </div>
                        </form>
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
  
    //以下为官方示例
    $().ready(function () {
    	$("#ZT_SEL option[value='"+$("#ZT").val()+"']").attr('selected',true);
    	$("#AQJB_SEL option[value='"+$("#AQJB").val()+"']").attr('selected',true);
    	
    	$("#deptForm").validate({
            submitHandler: function(form){
                $("#deptForm").ajaxSubmit({
                    url:'${ctx}/role/updateRole',
                    dataType:'json',
                    type:'post',
                    success:function(data){
                        var code = data.code;
                        if(code == 0){
                            layer.msg('信息修改成功');
                            window.location.href = '${ctx}/role/getInit';
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
            },
            rules: {
            	JSM:{required:true},
            	JSMS:{required:true},
            },
            messages: {
            	JSM:{required:"请输入角色名称"},
            	JSMS:{required:"请输入角色描述"},
            }
        });
    });

</script>
</rapid:override>
<%@ include file="../../template/base.jsp"  %>
