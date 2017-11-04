<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<script src="${rs}/js/jquery.form.js"></script>
<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
<script>
	$(document).ready(function() {
		$("#t_update").click(function() {
			$("#myform").ajaxSubmit({
				url : '${ctx}/demo/updateDate',
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

					} else {
						layer.msg('数据保存失败，请重试');
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			
				<!-- begin title-->
				
				<div class="portlet-body form">
				<form class="form-horizontal" id="myform" method="post"
					action="${ctx}/demo/updateDate">
					<input type="hidden" value="${KEYJSON}" name="KEYJSON" />
					
					<div class="form-body">
						<c:forEach items="${list}" var="map">
						<div class="form-group">
								<label class="control-label col-md-4">
								<c:out value="${map.V_CN}" />：</label>
								<div class="col-md-8">
								<input name="${map.V_EN}" value="${map.V_VAL}"  class="form-control"></input>
								</div>
							</div>
						</c:forEach>
						<div class="form-group">
										<div class="col-lg-offset-4 col-lg-8">
											<button class="btn btn-info " type="button" id="t_update">修改</button>

										</div>
								</div>
						</div>
						
								
				</form>
				</div>
				</div>
				</div>
</body>
</html>