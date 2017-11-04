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
                       	添加角色
                    </div>
<!--                     <div class="tools"> -->
<!-- 								<a class="collapse" href="" data-original-title="" title=""> -->
<!-- 								</a> -->
<!--                     </div> -->
                </div>
                <div class="portlet-body form">
                	<br/>
                        <form class="form-horizontal" id="roleForm" method="post">
                            <div class="form-group">
                                <label class="col-lg-3 control-label">角色名：</label>
                                <div class="col-lg-3">
                                    <input type="text" name="JSM" placeholder="角色名" class="form-control">
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">状态：</label>
                                <div class="col-lg-3">
                                    	<div class="radio-list">
											<label class="radio-inline">
												<span class="checked"><input name="ZT"  value="1"  type="radio" class="radiosCA" checked="checked"></span>
													启用
											</label>
											<label class="radio-inline">
												<span class=""><input name="ZT" value="2"  type="radio" class="radiosCA" ></span>
													停用
											</label>
										</div>
                                </div>
                            </div>
                            
                            <input type="hidden" name="AQJB" value="0">
                            <!--  
                            <div class="form-group">
                                <label class="col-lg-3 control-label">安全级别：</label>
                                <div class="col-lg-8">
                                    <select name="AQJB">
                                   		<option value="">请选择安全级别</option>
                                    	<option value="1">低</option>
                                    	<option value="2">中</option>
                                    	<option value="3">高</option>
                                    </select>
                                </div>
                            </div>
                            -->
                            <div class="form-group">
                                <label class="col-lg-3 control-label">角色描述：</label>
                                <div class="col-lg-8">
                                    <textarea type="text" name="JSMS" placeholder="角色描述" class="form-control"  style="resize: none;" rows="5" cols="10"></textarea>
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                            
                            
                              <div class="form-actions"> 
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn blue" type="submit"><i class="fa fa-check"></i> 提  交</button>
											<button class="btn blue" id="back" type="button" onclick="javascript:window.location.href='${ctx}/role/getInit'" ><i class="fa fa-reply"></i> 返  回</button>
										</div>
									</div>
							</div>	
                        </form>
</rapid:override>
<rapid:override name="script">
<script src="${rs}/js/jquery.form.js"></script>
<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
<link href="${rs}/js/plugins/layer/skin/layer.css" rel="stylesheet">
<script src="${rs}/js/plugins/layer/layer.js"></script>
<!-- Page-Level Scripts -->
<script type="text/javascript">
    
    $().ready(function () {
        $("#roleForm").validate({
            submitHandler: function(form){
            	layer.confirm('是否添加？', {
        		    btn: ['确定','取消'], 
        		    shade: false 
        		}, function(){
	            	$("#roleForm").ajaxSubmit({
	                    url:'${ctx}/role/addRole',
	                    dataType:'json',
	                    type:'post',
	                    success:function(data){
	                        var code = data.code;
	                        if(code == 0){
	                            layer.msg('角色添加成功');
	                            window.location.href = '${ctx}/role/getInit';
	                            form.reset();
	                        }else{
	                        	layer.msg(data.msg);
	                        }
	                    },
	                    error:function(html){
	                    	layer.msg("提交数据失败，代码:" +html.status+ "，请稍候再试");
	                  
	                    }
	                });
        		}, function(){
        		    
        		});
	
                return false; //不刷新页面 
            },
            rules: {
            	JSM:{required:true},
            	JSMS:{required:true}
            	//AQJB:{required:true},
            },
            messages: {
            	JSM:{required:"<span style='color:red'>请输入角色名称</span>"},
            	JSMS:{required:"<span style='color:red'>请输入角色描述</span>"}
            	//AQJB:{required:"<span style='color:red'>请选择安全级别</span>"},
            }
        });
    });

</script>
</rapid:override>
<%@ include file="../../template/base.jsp"  %>