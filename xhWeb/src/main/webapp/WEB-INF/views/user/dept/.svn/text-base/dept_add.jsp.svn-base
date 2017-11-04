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
                       	添加部门
                    </div>
                </div>
                <div class="portlet-body form">
                	<br/>
                        <form class="form-horizontal" id="deptForm" method="post">
                            <div class="form-group">
                                <label class="col-lg-3 control-label">部门名称：</label>
                                <div class="col-lg-3">
                                    <input type="text" name="BMMC" placeholder="部门名称" class="form-control">
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                             <div class="form-group">
                                <label class="col-lg-3 control-label">所属区域：</label>
                                <div class="col-lg-3">
                                   <select name="QYID"  id="QYID"  class="form-control"></select>
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">部门编码：</label>
                                <div class="col-lg-3">
                                    <input type="text" name="PX" placeholder="部门编码" class="form-control" value="${map.PX}" readonly>
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                         <!--    <div class="form-group">
                                <label class="col-lg-3 control-label">部门类型：</label>
                                <div class="col-lg-3">
                                	<select name="BMLX" class="form-control">
                                		<option value="">请选择类型</option>
                                		<option value="1">数据提供</option>
                                		<option value="2">数据使用</option>
                                		<option value="3">数据提供并使用</option>
                                	</select>
                                </div>
                                <label class="help-inline red">*</label>
                            </div> -->
                  <!--           <div class="form-group">
                                <label class="col-lg-3 control-label">部门描述：</label>
                                <div class="col-lg-8">
                                    <textarea type="text" name="BMMS" placeholder="部门描述" class="form-control"  style="resize: none;" rows="5" cols="10"></textarea>
                                </div>
                                <label class="help-inline red">*</label>
                            </div> -->
                            
                            <div class="form-group">
                                <label class="col-lg-3 control-label">部门类型：</label>
                                <div class="col-lg-9">
                                	<div class="radio-list">
                                		<!-- 县市区信用办  新增-->
	                             		<c:if test="${map.QYID=='XYB'}">
	                             			<label class="radio-inline">
												<span>区县（市）部门</span>
											</label>
	                             			 <input name="ISXYB" value="3" type="hidden"/>
	                             		</c:if>
	                             		
	                                	<!-- 非县市区信用办 新增-->
	                                	<c:if test="${map.QYID=='QT'}">
											<div class="radio-list">
												<label class="radio-inline"><span><input name="ISXYB" id="radios1" value="1"   type="radio" class="radios"  checked="checked"/> 市本级部门</span></label>
												<label class="radio-inline"><span><input name="ISXYB" id="radios2" value="2"  type="radio"  class="radios"  />区县（市）信用办</span></label>
												<label class="radio-inline"><span><input name="ISXYB" id="radios3" value="3"  type="radio"  class="radios"  />区县（市）部门</span></label>
											</div>
	                                	</c:if>
	                                	
									
									</div>
                                </div>
                               
                            </div>
                            
                             <div class="form-actions"> 
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
										<button class="btn blue" type="submit"><i class="fa fa-check"></i> 提  交</button>
										<a href="${ctx}/dept/getInit"><button class="btn blue" id="back" type="button"><i class="fa fa-reply"></i> 返  回</button></a>
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
    
    $().ready(function () {
     	  
        $("#deptForm").validate({
            submitHandler: function(form){
            	layer.confirm('是否添加？', {
        		    btn: ['确定','取消'], 
        		    shade: false 
        		}, function(){
	            	$("#deptForm").ajaxSubmit({
	                    url:'${ctx}/dept/addDept',
	                    dataType:'json',
	                    type:'post',
	                    success:function(data){
	                        var code = data.code;
	                        if(code == 0){
	                            layer.msg('部门添加成功');
	                            window.location.href = '${ctx}/dept/getInit';
	                            form.reset();
	                        }else{
	                        	layer.msg(data.msg);
	                        }
	                    },
	                    error:function(html){
	                        alert("提交数据失败，代码:" +html.status+ "，请稍候再试");
	                  
	                    }
	                });
        		}, function(){
        		    
        		});
                return false; //不刷新页面 
            },
            rules: {
            	BMMC:{required:true},
            	QYID:{required:true},
            	BMMS:{required:true},
            	BMLX:{required:true},
            	PX:{required:true,digits:true}
            },
            messages: {
            	BMMC:{required:"<span style='color:red'>请输入部门名称</span>"},
            	BMMS:{required:"<span style='color:red'>请输入部门描述</span>"},
            	BMLX:{required:"<span style='color:red'>请选择部门类型</span>"},
            	PX:{required:"<span style='color:red'>请输入部门排序</span>"},
            	QYID:{required:"<span style='color:red'>请选择部门所属区域</span>"}
            }
        });
        
        
        //所属区域初始化
        $.ajax({
            url: '${ctx}/dept/initSSQYList',
            type: "POST",
            data: { },
            dataType: "json"
        }).done(function(data,ss) {
       		/* var list = "<option value=''>请选择区域</option>"; */
       		var list = "";
       		for(var i=0; i<data.length; i++){
       			list += "<option value='"+data[i].UNID+"'>"+data[i].QYMC+"</option>";
       		}
       		$("#QYID").html(list);
        }).fail(function(jqXHR, textStatus, errorThrown){
       	 	layer.msg('数据加载失败，请稍后重试');
        });
        
        //区域选择后自动修改部门类别
    /*     $("#QYID").change(function(){
        	 var options=$("#QYID option:selected").text();//拿到选中项的值
        	 
        	 if(options!='宁波市'){
        		//县市区 或者县市区部门
               	$('#radios2').attr('disabled',true);
             	$('#radios3').attr('disabled',true);
        	 }else{
        		 //市本级部门
        		 $('#radios2').attr('disabled',true);
        		 $('#radios3').attr('disabled',true);
        	 }
		}); */
        
        //部门类别状态选择
        $(".radios").click(function(){
     	   $("input:radio[name='ISXYB']").attr("checked",false);
     	   $(this).attr('checked',true); 
     	    
 		});
        
     
    });

</script>
</rapid:override>
<%@ include file="../../template/base.jsp"  %>