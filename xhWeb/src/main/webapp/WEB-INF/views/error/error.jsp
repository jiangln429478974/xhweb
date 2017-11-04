<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>服务器内部错误</title>
    <meta name="description" content="服务器内部错误">
    <link href="${rs}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${rs}/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="${rs}/css/animate.css" rel="stylesheet">
    <link href="${rs}/css/style.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="middle-box text-center animated fadeInDown">
    <h1>500</h1>
    <h3 class="font-bold">服务器内部错误</h3>
    <div class="error-desc">
        服务器好像出错了...
        <br/>您可以返回主页看看
        <br/><a href="${ctx}/index" class="btn btn-primary m-t">主页</a>
    </div>
</div>

<% Exception e = (Exception)request.getAttribute("exception"); %>
<H2>未知错误: <%= e.getClass().getSimpleName()%></H2>
<hr />
<P>错误描述：</P>
<%= e.getMessage()%>
<P>错误信息：</P>
<% e.printStackTrace(new java.io.PrintWriter(out)); %>
<!-- Mainly scripts -->
<script src="${rs}/js/jquery-2.1.1.min.js"></script>
<script src="${rs}/js/bootstrap.min.js?v=1.7"></script>
</body>
</html>
