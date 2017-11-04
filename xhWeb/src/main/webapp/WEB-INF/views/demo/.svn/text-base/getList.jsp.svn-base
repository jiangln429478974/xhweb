<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
</head>
<body>
	
							<table  class="table table-bordered">
							<c:forEach items="${list}" var="map">
								<c:if test="${map.V_CN eq '查询内容' }">
							
<!-- 								自然人日志信息查询 -->
<!-- 									<tr><td colspan=2> -->
<%-- 									<c:out value="${map.V_VAL.yyTitle }"/> --%>
<!-- 									</td></tr><tr><td colspan=2> -->
<%-- 									<c:out value="${map.V_VAL.yysx }"/> --%>
<!-- 									</td></tr> -->
								<c:if test="${!empty map.V_VAL }">
									<c:forEach var="nr" items="${map.V_VAL.jbsj }" varStatus="end">
									<tr><td colspan=2>
									<c:out value="${nr.jbbmmc }"/>：
									<c:out value="${nr.jbTitle }"/>
									</td></tr>
										<c:forEach var="jtnr" items="${nr.DATA }">
										<tr><td width="25%">
										<c:out value="${jtnr.ZW }"/>:</td><td>
										<c:out value="${jtnr.VAL }"/></td></tr>
										</c:forEach>
										<c:if test="${!end.last }">
										<tr><td colspan=2 style="background:#EBEBEB"></td></tr>
										</c:if>
									</c:forEach>
								</c:if>
<!-- 								法人日志信息查询 -->
								<c:if test="${!empty map.V_VALUE }">
									<c:forEach var="wclist" items="${map.V_VALUE }">
										<c:forEach var="zclist" items="${wclist.BMDATALIST2 }" varStatus="end">
										<tr>
										<td colspan=2>
										<c:out value="${zclist.BZWM}"/>(来源部门：<c:out value="${wclist.BMMC}"/>)
										</td></tr>
										<c:forEach var="nclist" items="${zclist.BDATALIST }">
										<c:forEach var="nr" items="${nclist.aa }">
										<tr><td width="25%">
										<c:out value="${nr.ZW }"></c:out>:</td><td>
										<c:out value="${nr.VAL }"></c:out>
										</td></tr>
										</c:forEach>
										</c:forEach>
										<c:if test="${!end.last }">
										<tr><td colspan=2 style="background:#EBEBEB"></td></tr>
										</c:if>
										</c:forEach>
									</c:forEach>
								</c:if>
								
								</c:if>
							</c:forEach>
							</table>
					
</body>
</html>