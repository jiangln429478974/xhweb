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
                            <input type="hidden" name="userId" value="${user.userId}">
                            <div class="form-group">
                                <label class="col-lg-3 control-label">用户名：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="userName" placeholder="用户名" readonly="readonly" value="${user.userName}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">姓名：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="nickName" placeholder="姓名" value="${user.nickName}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">性别：</label>
                                <div class="col-sm-8">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" id="sex1"  name="sex" value="0">男</label>&nbsp;&nbsp;
                                        <label>
                                            <input type="radio" id="sex2" name="sex" value="1">女</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">电话：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="phone" placeholder="电话" value="${user.phone}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">地址：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="address" placeholder="地址" value="${user.address}" class="form-control">
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
     var $sex1 = $('#sex1');
     var $sex2 = $('#sex2');
    if($sex1.val() == '${user.sex}') {
        $sex1.prop('checked',true);
    }else if($sex2.val() == '${user.sex}'){
        $sex2.prop('checked',true);
    }
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
                $("#userForm").ajaxSubmit({
                    url:'${ctx}/admin/user/updateUser',
                    dataType:'json',
                    success:function(data){
                        var code = data.code;
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
            },
            rules: {
                nickName: { required: true },
                sex: { required: true }
            },
            messages: {
                nickName: { required: "请输入您的姓名" },
                sex: "请选择您的性别"
            }
        });
    });

</script>
</rapid:override>
<%@ include file="../template/base.jsp"  %>
