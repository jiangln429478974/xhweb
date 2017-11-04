<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<rapid:override name="css"><style>.red{color:red;}</style></rapid:override>
<rapid:override name="title">jqgrid</rapid:override>
<rapid:override name="content">
	<div class="portlet box blue">
               <div class="portlet-title ">
                    <div class="caption">
                       	功能菜单编辑
                    </div>
<!--                     <div class="tools"> -->
<!-- 								<a class="collapse" href="" data-original-title="" title=""> -->
<!-- 								</a> -->
<!--                     </div> -->
                </div>
                <div class="portlet-body form">
                	<br/>
                        <form class="form-horizontal" id="menuForm" method="post">
                            <input type="hidden" name="ID" value="${map.ID}">
                           <div class="form-group">
                                <label class="col-lg-3 control-label">功能菜单名称：</label>
                                <div class="col-lg-4">
                                    <input type="text" name="GNCDMC" placeholder="功能菜单名称 " class="form-control" value="${map.GNCDMC }">
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">上级功能菜单名称：</label>
                                <div class="col-lg-4">
                                    <input type="text" name="SJGNCDMC"  placeholder="上级功能菜单名称 " class="form-control" value="${map.SJGNCDMC }">
                                </div>
                                <div class="col-lg-4"></div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">序号：</label>
                                <div class="col-lg-4">
                                    <input type="text" name="XH" placeholder="序号 " class="form-control" value="${map.XH }">
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">URL地址：</label>
                                <div class="col-lg-4">
                                    <input type="text" name="URL" placeholder="URL地址 " class="form-control" value="${map.URL }">
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                             <div class="form-group">
                                <label class="col-lg-3 control-label">是否CA验证：</label>
                                <div class="col-lg-4">
                                    <label><input type="radio" name="CAYZ" id="CAYZ"  value="1" <c:if test="${map.SFCAYZ=='1' }">checked </c:if> /> 是</label>
   									<label><input type="radio" name="CAYZ" id="CAYZ"  value="0" <c:if test="${map.SFCAYZ=='0' }">checked </c:if>/> 否</label> 	 
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">功能菜单描述：</label>
                                <div class="col-lg-8">
                                    <textarea type="text" name="GNCDMS" placeholder="功能菜单描述" class="form-control"  style="resize: none;" rows="5" cols="10">${map.GNCDMS }</textarea>
                                </div>
                            </div>
                           
                              <div class="form-actions"> 
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn blue" type="submit"><i class="fa fa-check"></i> 提  交</button>
											<a href="${ctx}/menu/getInit?page=${page}"><button class="btn blue" id="back" type="button"><i class="fa fa-reply"></i> 返  回</button></a>
										</div>
									</div>
							</div>	
                        </form>
                  </div>
                </div>
            </div>
</rapid:override>
<rapid:override name="script">
<script src="${rs}/js/jquery.form.js"></script>
<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
<link href="${rs}/js/plugins/layer/skin/layer.css" rel="stylesheet">
<script src="${rs}/js/plugins/layer/layer.js"></script>
<!-- Page-Level Scripts -->
<script type="text/javascript">
  
    //以下为官方示例
    $().ready(function () {
    	$("#menuForm").validate({
            submitHandler: function(form){
            	layer.confirm('是否修改？', {
        		    btn: ['确定','取消'], 
        		    shade: false 
        		}, function(){
	                $("#menuForm").ajaxSubmit({
	                    url:'${ctx}/menu/updateMenu',
	                    dataType:'json',
	                    type:'post',
	                    success:function(data){
	                        var code = data.code;
	                        if(code == 0){
	                            layer.msg('信息修改成功');
	                            window.location.href = '${ctx}/menu/getInit';
	                            form.reset();
	                        }else{
	                        	layer.msg(data.msg);
	                        }
	                        return false;
	                    },
	                    error:function(html){
	                    	layer.msg("提交数据失败，代码:" +html.status+ "，请稍候再试");
	                    }
	                });
        		}, function(){
        		    
        		});
            },
            rules: {
            	XH:{required:true},
            	URL:{required:true},
            	GNCDMC:{required:true}
            },
            messages: {
            	XH:{required:"<span style='color:red'>请输入序号</span>"},
            	URL:{required:"<span style='color:red'>请输入URL</span>"},
            	GNCDMC:{required:"<span style='color:red'>请输入功能菜单名称</span>"}
            }
        });
    });

</script>
</rapid:override>
<%@ include file="../../template/base.jsp"  %>
