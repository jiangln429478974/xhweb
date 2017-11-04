<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>政务云后台 - 登录</title>
<link href="${rs}/css/bootstrap.min.css" rel="stylesheet">
<link href="${rs}/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="${rs}/css/animate.css" rel="stylesheet">
<link href="${rs}/css/style.css" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="middle-box text-center loginscreen  animated fadeInDown">
		<div>
			<div>
				<h1 class="logo-name">云</h1>
			</div>
			<!--<h3>欢迎使用 H+</h3>-->
			<form class="m-t" action="${ctx}/login" method="post" id="loginForm">
				<div class="form-group">
					<input type="text" name="username" id="username"
						class="form-control" placeholder="用户名">
				</div>
				<div class="form-group">
					<input type="password" name="password" class="form-control" id="password"
						placeholder="密码">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" width="30%" id="captcha"
						name="captcha" placeholder="验证码" /><span><img
						src="${ctx}/captcha" width="40%" /></span>
				</div>
				<button type="submit" class="btn btn-primary block full-width m-b" onclick="login()">登
					录</button>
				<%-- <p class="text-muted text-center"> <a href="#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>--%>
				<%-- </p>--%>
				<p>${shiroLoginFailure}</p>
				<div>
					<button type="submit" onclick="admin()">admin</button>
					<button type="submit" onclick="bmyh()">部门用户</button>
					<button type="submit" onclick="ptyh()">普通用户</button>
				</div>
			</form>
		</div>
	</div>
	<!-- Mainly scripts -->
	<script src="${rs}/js/jquery-2.1.1.min.js"></script>
	<script src="${rs}/js/bootstrap.min.js?v=1.7"></script>
	<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
	<script type="text/javascript">
		//以下为修改jQuery Validation插件兼容Bootstrap的方法
		$.validator.setDefaults({
			highlight : function(element) {
				$(element).closest('.form-group').removeClass('has-success')
						.addClass('has-error');
			},
			success : function(element) {
				element.closest('.form-group').removeClass('has-error')
						.addClass('has-success');
			},
			errorElement : "span",
			errorClass : "help-block m-b-none",
			validClass : "help-block m-b-none"
		});
		function login() {
			document.getElementById('username').focus();
			$('#loginForm img').click(
					function() {
						$(this).hide().attr(
								'src',
								'${ctx}/captcha?'
										+ Math.floor(Math.random() * 100))
								.fadeIn();
					});

			var validator = $("#loginForm").validate({
				submitHandler : function(form) {
					form.submit();
				},
				rules : {
					username : {
						required : true
					},
					password : {
						required : true
					},
					captcha : {
						required : false,
						remote : '${ctx}/checkCaptcha'
					}
				},
				messages : {
					username : {
						required : "请输入用户名！"
					},
					password : {
						required : "请输入密码！"
					},
					captcha : {
						required : "请输入验证码！",
						remote : "验证码错误！"
					}
				}
			});
		};
		function admin() {
			$("#username").val("admin");
			$("#password").val("admin");
		}
		function bmyh() {
			$("#username").val("bmyh");
			$("#password").val("bmyh");
		}
		function ptyh() {
			$("#username").val("ptyh");
			$("#password").val("ptyh");
		}
	</script>
</body>
</html>