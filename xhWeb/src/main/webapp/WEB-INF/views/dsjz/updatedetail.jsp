<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">

<rapid:override name="script">
<script src="${rs}/js/jquery.form.js"></script>
<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
<script>
  
//提交修改
function updateDX(){
// 	var strValue = $("#WFNR").val();
// 	alert(strValue);
// 	strValue.replaceAll("%","&permil;");
// 	alert(strValue);	
var tname = $("#TNAME").val();

var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	layer.confirm('确认提交后将会重新进行清洗比对。', {
	    btn: ['确定','取消'], 
	    shade: false 
	}, function(){
			$("#dsjzForm").ajaxSubmit({
				url : '${ctx}/dsjz/updateDsjz',
				type : "POST",
				dataType : "json",
				error : function(json) {
					layer.msg('修改失败，请重试');
				},
				success : function(json) {
					var s_message=json.message;
					  
					if (s_message == "1") {
						layer.msg('异常信息修改成功， 重新入库');
						
						window.location.href = "${ctx}/dsjz/ddjzlist?TNAME="+tname; 
					} else {
						layer.msg('数据保存失败，请重试');
					}
				}
			});
	},
	function(){
	    
 		});
}

</script>
</rapid:override>
</head>
<body> 
		<form action="${ctx}/lhcj/insertCJCS" id="dsjzForm" style="margin-top:20px;">
			<table class="table table-bordered" style="width:80%;align:center;margin-left:auto;margin-right:auto;" id="ajxx">
				<tbody style="width:100%">
				
				<c:forEach items="${list}" var="map">
				 	<tr>
						
							<c:choose>
							   <c:when test="${map.V_EN=='UNID'}">    
								      <input class="form-control" type="hidden"  value="${map.V_VAL}"  name="${map.V_EN}" id="${map.V_EN}" ></input> 
							   </c:when>	
							   <c:when test="${map.V_EN=='XM' ||map.V_EN=='SFZH'  }">   
								     <td style="width: 30%;"><c:out value="${map.V_CN}" />：	</td>
								     <td> <input class="form-control" type="text"  value="${map.V_VAL}"  name="${map.V_EN}" id="${map.V_EN}" ></input> </td>
							   </c:when>
							   <c:otherwise>
							   		<td style="width: 30%;"><c:out value="${map.V_CN}" />：	</td>
								    <td> ${map.V_VAL} </td> 
							   </c:otherwise> 
							</c:choose>
					
						 
						 
						
					</tr> 
				</c:forEach>
				 
<%-- 					<input class="form-control" type="text"  value="${webMap.TNAME}"  name="TNAME" id="TNAME" ></input> --%>
				</tbody>
			</table>
			
		<div style="width:80%;text-align:left;margin-left:51px;padding-bottom:15px;">
		    <span style="color:red;">*</span>  修改成功后将重新进行清洗比对。
		</div>
			<div align="center">
			     <button type="button" class="btn btn-primary" onclick="updateDX()">
			     提交</button>
                      <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">
			     关闭</button>
			</div>
		</form>
</body>
</html>
