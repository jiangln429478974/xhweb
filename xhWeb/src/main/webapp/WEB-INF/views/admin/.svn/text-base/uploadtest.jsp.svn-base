<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>上传测试</title>
    <link href="${rs}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${rs}/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="${rs}/css/animate.css" rel="stylesheet">
    <link href="${rs}/css/style.css" rel="stylesheet">
</head>
<body class="gray-bg">
测试啊测试
<!-- Mainly scripts -->
<script src="${rs}/js/jquery-2.1.1.min.js"></script>
<script src="${rs}/js/bootstrap.min.js?v=1.7"></script>
<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
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
    $(function(){
        document.getElementById('username').focus();
        $('#loginForm img').click(function() {
            $(this).hide().attr('src', '${ctx}/captcha?' + Math.floor(Math.random() * 100)).fadeIn();
        });

        var validator = $("#loginForm").validate({
            submitHandler: function(form){
                form.submit();
            },
            rules: {
                username:{required:true},
                password: {required:true},
                captcha:{required:true,remote:'${ctx}/checkCaptcha'}
            },
            messages:{
                username:{required:"请输入用户名！"},
                password:{required:"请输入密码！"},
                captcha:{required:"请输入验证码！",remote:"验证码错误！"}
            }
        });
    });
</script>
</body>
</html>