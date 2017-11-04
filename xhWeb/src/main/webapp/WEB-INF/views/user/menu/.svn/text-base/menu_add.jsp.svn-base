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
                        <h3>添加功能菜单</h3>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" id="menuForm" method="post">
                            <div class="form-group">
                                <label class="col-lg-3 control-label">功能菜单名称：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="GNCDMC" placeholder="功能菜单名称 " class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">上级功能菜单名称：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="SJGNCDMC" placeholder="上级功能菜单名称 " class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">序号：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="XH" placeholder="序号 " class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">URL地址：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="URL" placeholder="URL地址 " class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">功能菜单描述：</label>
                                <div class="col-lg-8">
                                    <textarea type="text" name="GNCDMS" placeholder="功能菜单描述" class="form-control"  style="resize: none;" rows="5" cols="10"></textarea>
                                </div>
                            </div>
                            
                            
                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-8">
                                    <button class="btn btn-primary" type="submit"><i class="fa fa-check">提交</i></button>
                                    <a href="${ctx}/menu/getInit"><button class="btn btn-warning" type="button" id="back"><i class="fa fa-check">返回</i></button></a>
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
    
    $().ready(function () {
        $("#menuForm").validate({
            submitHandler: function(form){
            	$("#menuForm").ajaxSubmit({
                    url:'${ctx}/menu/addMenu',
                    dataType:'json',
                    type:'post',
                    success:function(data){
                        var code = data.code;
                        if(code == 0){
                            layer.msg('功能菜单添加成功');
                            window.location.href = '${ctx}/menu/getInit';
                            form.reset();
                        }else{
                        	layer.msg(data.msg);
                        }
                    },
                    error:function(html){
                        alert("提交数据失败，代码:" +html.status+ "，请稍候再试");
                  
                    }
                });

                return false; //不刷新页面 
            },
            rules: {
            	GNCDMC:{required:true},
            	XH:{required:true},
            	URL:{required:true},
            	GNCDMS:{required:true},
            },
            messages: {
            	GNCDMC:{required:"<span style='color:red'>请输入功能菜单描述</span>"},
            	XH:{required:"<span style='color:red'>请输入序号</span>"},
            	URL:{required:"<span style='color:red'>请输入URL</span>"},
            	GNCDMS:{required:"<span style='color:red'>请输入功能菜单描述</span>"},
            }
        });
    });

</script>
</rapid:override>
<%@ include file="../../template/base.jsp"  %>