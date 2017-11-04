<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<rapid:override name="title">宁波市公共信用信息服务平台</rapid:override>
<rapid:override name="css">
	<link href="${rs}/css/plugins/jQueryUI/jquery-ui-1.10.4.custom.min.css"
		rel="stylesheet">
	<!-- Data Tables -->
	<link href="${rs}/css/plugins/jqgrid/ui.jqgrid.css" rel="stylesheet">
	<link href="${rs}/js/plugins/layer/skin/layer.css" rel="stylesheet">
	<style>
/* Additional style to fix warning dialog position */
#alertmod_table_list_2 {
	top: 900px !important;
}

.login-dialog {
	width: 800px;
	height: 800px;
}
</style>
</rapid:override>
<rapid:override name="content">
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
<div class="portlet box blue">
				<!-- begin title-->
				<div class="portlet-title">
					<div class="caption">模板修改</div>
				</div>
			<!-- begin title-->

			<div class="portlet-body form">
			<form novalidate="novalidate"  id="myform"
						class="form-horizontal">
						<input type="hidden" name="ZTBM" value="${map.ZTBM}"/>
<%-- 						<input type="hidden" value="{~ZTBM~:~${map.ZTBM}~}" name="KEYJSON" /> --%>
						<div class="form-body">
							<div class="form-group">
								<label class="control-label col-md-3">表名称<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-6">
									<input type="text" name="BMC" class="form-control"
										value="${map.BMC}">
								</div><span
										class="help-block " id="name-error"></span>

							</div>


							<div class="form-group has-error">
								<label class="control-label col-md-3">主题编码<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-8">
									<input type="text" aria-describedby="name-error"
										aria-invalid="true" aria-required="true" name="ZTBM"
										readonly="readonly"
										data-required="1" class="form-control" value="${map.ZTBM}"><span
										class="help-block help-block-error" id="name-error">This
										field is required.</span>
								</div>
							</div>




							<div class="form-group">
								<label class="control-label col-md-3">主题名称 <span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-8">
									<input type="text" name="ZTMC" class="form-control"
										value="${map.ZTMC}">
								</div>
							</div>


							<div class="form-group">
								<label class="control-label col-md-3">主题序号
								</label>
								<div class="col-md-8">
									<input type="text" name="ZTXH" class="form-control" value="${map.ZTXH}">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3">主题URL<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-8">
									<input type="text" name="URL" class="form-control"
										value="${map.URL}">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3">上级主题编码
								</label>
								<div class="col-md-8">
									<input type="text" name="SJZTBM" class="form-control" value="${map.SJZTBM}">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3">数据源
								</label>
								<div class="col-md-8">
									<input type="text" name="SJY" class="form-control" value="${map.SJY}">
								</div>
							</div>


							<div class="form-group">
								<label class="control-label col-md-3">类型<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-8">
									<select class="form-control" name="LX">
										<option value="1" <c:if test="${map.LX==1}">checked</c:if> >单表查询</option>
										<option value="2" <c:if test="${map.LX==2}">checked</c:if> >数据上传</option>
									</select>
								</div>
							</div>


							<div class="form-group">
								<label class="control-label col-md-3">是否目录<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-8">
									<select class="form-control" name="ISML">
										<option value="N" <c:if test="${map.ISML=='N'}">checked</c:if> >否</option>
										<option value="Y" <c:if test="${map.ISML=='Y'}">checked</c:if> >是</option>
									</select>
								</div>
							</div>



							<div class="form-group">
								<label class="control-label col-md-3">是否启用<span
									aria-required="true" class="required"> * </span></label>
								<div class="col-md-8 md-radio-inline">
									<div class="md-radio">
										<input type="radio" id="radio14" name="QYBJ" value="1"
											class="md-radiobtn" <c:if test="${map.QYBJ==1}">checked=""</c:if> > 
											<label for="radio14">
											<span></span> <span class="check"></span> <span class="box"></span>
											启用
										</label>
									</div>
									<div class="md-radio has-error">
										<input type="radio" id="radio15" name="QYBJ" value="0"
											class="md-radiobtn" <c:if test="${map.QYBJ==0}">checked=""</c:if>> <label for="radio15"> <span></span>
											<span class="check"></span> <span class="box"></span> 禁止
										</label>
									</div>
								</div>
							</div>


							<div class="form-group">
								<label class="control-label col-md-3">主键字段<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-8">
									<input type="text" name="ZJZD" class="form-control"
										value="${map.ZJZD}">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3">SQL内容<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-8">
									<textarea class="form-control" name="SQL"  rows="12">${map.SQL}</textarea>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3">查询条件表单定义<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-8">
									<textarea class="form-control" name="BDDY" rows="12" >${map.BDDY}</textarea>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3">结果定义<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-8">
									<textarea class="form-control" name="JGDY" rows="12" >${map.JGDY}</textarea>
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-md-3">详细信息SQL
								</label>
								<div class="col-md-8">
									<textarea class="form-control" name="XXSQL" rows="12" >${map.XXSQL}</textarea>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3">样式
								</label>
								<div class="col-md-8">
									<textarea class="form-control" name="CSS">${map.CSS}</textarea>
								</div>
							</div>


							<div class="form-group">
								<label class="control-label col-md-3">js脚本
								</label>
								<div class="col-md-8">
									<textarea class="form-control" name="JSJB" rows="12" >${map.JSJB}</textarea>
								</div>
							</div>
							
							


							<div class="form-group">
								<label class="control-label col-md-3">详情定义
								</label>
								<div class="col-md-8">
									<input type="text" name="XQDY" class="form-control"
										value="${map.XQDY}">
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-md-3">数据插入表单定义
								</label>
								<div class="col-md-8">
								<textarea class="form-control" name="INSDY" rows="14" >${map.INSDY}</textarea>
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-md-3">数据插入JS定义
								</label>
								<div class="col-md-8">
								<textarea class="form-control" name="INSJS" rows="12" >${map.INSJS}</textarea>
									
								</div>
							</div>

						</div>
						<div class="form-actions">
							<div class="row">
								<div class="col-md-offset-3 col-md-8">
									<button type="button" class="btn blue" id="t_update">
									
									<i class="fa fa-check">提交</i></button>
									<a href="javascript:history.go(-1);"><button
											 type="button"  class="btn blue ">
											<i class="fa fa-reply">返回</i>
										</button></a>
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
	<script src="${rs}/js/plugins/layer/layer.js"></script>
<script>
	$(document).ready(function() {
		$("#t_update").click(function() {
			$("#myform").ajaxSubmit({
				url : '${ctx}/demo/updateDemo',
				type : "POST",
				dataType : "json",
				error : function(json) {
					layer.msg('保存失败，请重试');
				},
				success : function(json) {
					//alert(json);
					var msg = json.code;
					if (msg == "1") {
						layer.msg('数据保存成功');

// 						window.location.href = "${ctx}/demo/toDemoList";
					} else {
						layer.msg('数据保存失败，请重试');
					}
				}
			});
		});
	});
</script>
</rapid:override>
<%@ include file="../template/base.jsp"%>