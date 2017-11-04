<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<rapid:override name="title">jqgrid</rapid:override>
<rapid:override name="content">
<div id="wrapper">
<%--                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>修改用户</h5>
                    </div>
                    <div class="ibox-content">--%>
                        <form class="form-horizontal" id="userForm" method="post">
                            <input type="hidden" name="userId" value="${task.ID}">
                            <div class="form-group">
                                <label class="col-lg-3 control-label">ID：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="ID" placeholder="ID" readonly="readonly" value="${task.ID}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">RES_ID：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="RES_ID" placeholder="RES_ID" value="${task.RES_ID}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">COLLECTION_MODE：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="COLLECTION_MODE" placeholder="COLLECTION_MODE" value="${task.COLLECTION_MODE}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">FREQUENCY：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="FREQUENCY" placeholder="FREQUENCY" value="${task.FREQUENCY}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">STATUS：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="STATUS" placeholder="STATUS" value="${task.STATUS}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-8">
                                    <button class="btn btn-primary" type="submit"><i class="fa fa-check">保存</i></button>
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

<!-- Page-Level Scripts -->
<script type="text/javascript">
    
    //以下为修改jQuery Validation插件兼容Bootstrap的方法
    $.validator.setDefaults({
        highlight: function (element) {
            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        },
        success: function (element) {
            element.closest('.form-group').removeClass('has-error').addClass('has-success');
        },
        errorElement: "span",
        errorClass: "help-block m-b-none",
        validClass: "help-block m-b-none"
    });
    //以下为官方示例
    $().ready(function () {
        $("#userForm").validate({
            submitHandler: function(form){
            	alert(1);
            	 $("#userForm").ajaxSubmit({
            		 
                    url:'${ctx}/admin/user/updateData',
                    dataType:'json',
                    success:function(data){
                        var code = data.code;
                        alert(code);
                        if(code == 0){
                            toastr.success('用户信息修改成功');
                            form.reset();
                        }else{
                            toastr.error(data.msg);
                        }
                    },
                    error:function(html){
                        alert("提交数据失败，代码:" +html.status+ "，请稍候再试");
                    }
                });
            }
        });
    });

</script>
</rapid:override>
<%@ include file="../template/base.jsp"  %>
