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

.input-control {
   
    height: 34px;
  
    font-size: 14px;
  
    color: #555;
    background-color: #FFF;
    background-image: none;
    border: 1px solid #CCC;
    border-radius: 4px;
    box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset;
 }
</style>
</rapid:override>
<rapid:override name="content">
	<div class="wrapper">
		<div class="portlet box blue">
			<div class="portlet-title ">
				<div class="caption">定时任务新增</div>
<!-- 				<div class="tools"> -->
<!-- 					<a class="collapse" href="" data-original-title="" title=""> </a> -->
<!-- 				</div> -->
			</div>
			<div class="portlet-body form">
				<div class="form-horizontal">
					<div class="wrapper wrapper-content  animated fadeInRight">
						<div class="row" style="margin-left: 12px">
						<br/>
							<div class="col-lg-12">
								<div class="ibox ">
									<form id="form_message">

										<div class="container" style="width: 100%">
											<div class="col-md-12">
												<span>执行时间:</span> <input style="margin-left: 14px"
													type="text" id="zxsj" name="fbsj_start" readonly class="input-control"
													onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
											</div>
											<br />
											<br />
											<div class="col-md-12">
												<span>执行周期:</span> <select id="select_zxzq"
													style="width: 120px; margin-left: 14px" class="input-control">
													<option>按日</option>
													<option>按月</option>
													<option>按季</option>
													<option>按年</option>
													<option>一次性</option>
												</select>
											</div>
										</div>
										<br />
										<div class="form-group"
											style="margin-left: 62px; margin-top: 20px; width: 100%">
											<button type="button" class="btn btn-primary" id="btn_send"
												onClick="commitNewTask()">保存</button>
											<button type="button" class="btn btn-primary" id="btn_cancel"
												style="background-color: #F36A5A">舍弃</button>
										</div>

									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</rapid:override>
<rapid:override name="script">
	<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
	<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
	<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="${rs}/js/plugins/layer/layer.js"></script>

	<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
	<script src="${rs}/js/jquery.form.js"></script>
	<script>
		function commitNewTask() {
			var ZXSJ = $("#zxsj").val();
			var ZXZQ = $("#select_zxzq").find("option:selected").text();

			if (ZXSJ == null || ZXSJ == '') {
				alert('请选择执行时间');
				return;
			}

			if (ZXZQ == null || ZXZQ == '') {
				alert('请选择执行周期');
				return;
			}

			$.ajax({
				url : '${ctx}/task/insertTask/',
				type : "POST",
				data : {
					"ZXSJ" : ZXSJ,
					"ZXZQ" : ZXZQ
				},
				dataType : "json"
			}).done(function(data, ss) {
				layer.msg('新增成功');
				window.location.href = "${ctx}/task/taskList/";

			}).fail(function(jqXHR, textStatus, errorThrown) {

				layer.msg('数据获取失败，请稍后重试');
			});

		}
		$(document).ready(function() {
			$("#btn_cancel").click(function() {
				window.location.href = "${ctx}/task/taskList/";
			});
		});
	</script>

</rapid:override>
<%@ include file="../../template/base.jsp"%>