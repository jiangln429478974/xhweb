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
				<div class="portlet-title">
					<div class="caption">
						模板设置
					</div>
				</div>
				<div class="portlet-body form">
					<!-- BEGIN FORM-->
					<form novalidate="novalidate" action="#" id="myform"
						class="form-horizontal">
						<div class="form-body">
							<div class="form-group">
								<label class="control-label col-md-3">表或试图名称<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-8">
									<input type="text" name="BMC" class="form-control"
										value="${map.TABLE_NAME}">
								</div><span
										class="help-block " id="name-error">必须是实体表</span>

							</div>


							<div class="form-group has-error">
								<label class="control-label col-md-3">主题编码<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-8">
									<input type="text" aria-describedby="name-error"
										aria-invalid="true" aria-required="true" name="ZTBM"
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
										value="${map.TABLE_CN}">
								</div>
							</div>


							<div class="form-group">
								<label class="control-label col-md-3">主题序号
								</label>
								<div class="col-md-8">
									<input type="text" name="ZTXH" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3">主题URL<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-8">
									<input type="text" name="URL" class="form-control"
										value="/demo/list?ZTBM=${map.ZTBM}">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3">上级主题编码
								</label>
								<div class="col-md-8">
									<input type="text" name="SJZTBM" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3">数据源
								</label>
								<div class="col-md-8">
									<input type="text" name="SJY" class="form-control">
								</div>
							</div>


							<div class="form-group">
								<label class="control-label col-md-3">类型<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-8">
									<select class="form-control" name="LX">
										<option value="1" checked>单表查询</option>
										<option value="2">数据上传</option>
									</select>
								</div>
							</div>


							<div class="form-group">
								<label class="control-label col-md-3">是否目录<span
									aria-required="true" class="required"> * </span>
								</label>
								<div class="col-md-8">
									<select class="form-control" name="ISML">
										<option value="N" >否</option>
										<option value="Y">是</option>
									</select>
								</div>
							</div>



							<div class="form-group">
								<label class="control-label col-md-3">是否启用<span
									aria-required="true" class="required"> * </span></label>
								<div class="col-md-8 md-radio-inline">
									<div class="md-radio">
										<input type="radio" id="radio14" name="QYBJ" value="1"
											class="md-radiobtn" checked=""> 
											<label for="radio14">
											<span></span> <span class="check"></span> <span class="box"></span>
											启用
										</label>
									</div>
									<div class="md-radio has-error">
										<input type="radio" id="radio15" name="QYBJ" value="0"
											class="md-radiobtn"> <label for="radio15"> <span></span>
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
									<textarea class="form-control" name="SQL" rows="12">${map.SQL}</textarea>
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
								<div class="col-md-offset-3 col-md-9">
									<button type="submit" class="btn blue">
									<i class="fa fa-check">提交</i>
									</button>
									<a href="javascript:history.go(-1);"><button class="btn yellow" type="button" id="back"><i class="fa fa-reply">返回</i></button></a>
                               
									
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

    $().ready(function () {
        $("#myform").validate({
            submitHandler: function(form){
            	$("#myform").ajaxSubmit({
                    url:'${ctx}/demo/addDemo',
                    dataType:'json',
                    type:'post',
                    success:function(data){
                    	var result = data.result;
                        if(result == 1){
                        	BootstrapDialog.alert('操作成功');
                        	form.reset();
                        }else{
                        	BootstrapDialog.alert('操作失败');
                        }
                    },
                    error:function(html){
                    	BootstrapDialog.alert("提交数据失败，代码:" +html.status+ "，请稍候再试");
                  
                    },
                    rules: {
                    	ZTBM: { required: true }
                    },
                    messages: {
                    	ZTBM: { required: "请输入主题编码" }
                    }
                });

                return false; //不刷新页面 
            }
        });
        
        $("#autoTc").bind("click",function(){
        	
        });
        
    });
		
	</script>
</rapid:override>
<%@ include file="../template/base.jsp"%>