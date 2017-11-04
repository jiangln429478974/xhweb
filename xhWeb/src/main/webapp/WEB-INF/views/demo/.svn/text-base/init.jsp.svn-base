<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
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
						填报表单模板新增
					</div>
				</div>
				<!-- end title -->
				<div class="portlet-body form">
					<!-- BEGIN FORM-->
					<form novalidate="novalidate" action="${ctx}/demo/auto" id="myform"
						class="form-horizontal">
						<div class="form-body">
							<div class="form-group">
								<label class="control-label col-md-4">表名称<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-4">
									<input type="text" name="TABLE_NAME" class="form-control">
								</div>
							</div>
						</div>
						<div class="form-actions">
							<div class="row">
								<div class="col-md-offset-4 col-md-8">
									<button type="submit" class="btn blue">
									
									<i class="fa fa-check">提交</i></button>

								</div>
							</div>
						</div>
					</form>
					<!-- END FORM-->
				</div>
			</div>
			<!-- END VALIDATION STATES-->
		</div>
	</div>
</rapid:override>
<rapid:override name="script">
	<script src="${rs}/js/jquery.form.js"></script>
	<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
	<!-- Page-Level Scripts -->
	<script type="text/javascript">
		$().ready(function() {

		});
	</script>
</rapid:override>
<%@ include file="../template/base.jsp"%>