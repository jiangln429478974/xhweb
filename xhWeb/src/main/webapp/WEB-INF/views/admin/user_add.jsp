<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<rapid:override name="title">jqgrid</rapid:override>
<rapid:override name="content">
<div id="wrapper">

                        <form class="form-horizontal" id="userForm" method="post">
                            <div class="form-group">
                                <label class="col-lg-3 control-label">用户名：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="userName" placeholder="用户名" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">姓名：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="nickName" placeholder="姓名" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">密码：</label>
                                <div class="col-lg-8">
                                    <input type="password" id="password" name="password" placeholder="密码" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">确认密码：</label>
                                <div class="col-lg-8">
                                    <input type="password" name="password2" placeholder="确认密码" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">性别：</label>

                                <div class="col-sm-8">
                                    <div class="radio">
                                        <label>
                                            <input type="radio"  checked="checked"  name="sex" value="0">男</label>&nbsp;&nbsp;
                                        <label>
                                            <input type="radio"  name="sex" value="1">女</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">电话：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="phone" placeholder="电话" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">地址：</label>
                                <div class="col-lg-8">
                                    <input type="text" name="address" placeholder="地址" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-8">
                                    <button class="btn btn-primary" type="submit"><i class="fa fa-check">提交</i></button>
                                </div>
                            </div>
                        </form>
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
                form.ajaxSubmit({
                    url:'${ctx}/admin/user/addUser',
                    dataType:'json',
                    success:function(data){
                        var code = data.code;
                        if(code == 0){
                            toastr.success('用户新增成功');
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
                userName: { required: true },
                nickName: { required: true },
                password: { required: true },
                password2: { required: true, equalTo: "#password" },
                sex: { required: true }
            },
            messages: {
                userName: { required: "请输入您的用户名" },
                nickName: { required: "请输入您的姓名" },
                password: { required: "请输入您的密码" },
                password2: { required: "请再次输入密码", equalTo: "两次输入的密码不一致" },
                sex: "请选择您的性别"
            }
        });
    });

</script>
</rapid:override>
<%@ include file="../template/base.jsp"  %>