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
                       	部门编辑
                    </div>
<!--                     <div class="tools"> -->
<!-- 								<a class="collapse" href="" data-original-title="" title=""> -->
<!-- 								</a> -->
<!--                     </div> -->
                </div>
                <div class="portlet-body form">
                	<br/>
                        <form class="form-horizontal" id="deptForm" method="post">
                            <input type="hidden" name="ID" value="${map.ID}">
                           <div class="form-group">
                                <label class="col-lg-3 control-label">部门名称：</label>
                                <div class="col-lg-3">
                                    <input type="text" name="BMMC" placeholder="部门名称" class="form-control" value="${map.BMMC }">
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">所属区域：</label>
                                <div class="col-lg-3">
                                   <select name="QYID"  id="QYID"  class="form-control">
                                   		
                                   </select>
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                              <div class="form-group">
                                <label class="col-lg-3 control-label">部门排序：</label>
                                <div class="col-lg-3">
                                    <input type="text" name="PX" placeholder="部门排序" class="form-control" value="${map.PX }" readOnly >
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                     <%--         <div class="form-group">
                                <label class="col-lg-3 control-label">部门类型：</label>
                                <div class="col-lg-3">
                                	<select name="BMLX" class="form-control">
                                		<option value="">请选择类型</option>
                                		<option value="1" ${map.BMLX=='1' ? "selected=selected" : ""}>数据提供</option>
                                		<option value="2" ${map.BMLX=='2' ? "selected=selected" : ""}>数据使用</option>
                                		<option value="3" ${map.BMLX=='3' ? "selected=selected" : ""}>数据提供并使用</option>
                                	</select>
                                </div>
                                <label class="help-inline red">*</label>
                            </div> --%>
                            <%-- <div class="form-group">
                                <label class="col-lg-3 control-label">部门描述：</label>
                                <div class="col-lg-8">
                                    <textarea type="text" name="BMMS" placeholder="部门描述" class="form-control">${map.BMMS }</textarea>
                                </div>
                                <label class="help-inline red">*</label>
                            </div> --%>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">部门属性：</label>
                                <div class="col-lg-9">
                                	<div class="radio-list">
                                		<!-- 县市区信用办 -->
	                             		<c:if test="${map.YHQYID!='55bdc68587f74fc28e6a035e64c3c572'}">
	                             			<label class="radio-inline">
										  		<span>区县（市）部门</span>
											</label>
	                             			<input name="ISXYB" value="3" type="hidden"/>
	                             		</c:if>
                                	 
										<!-- 市级 -->
	                                	<c:if test="${map.YHQYID=='55bdc68587f74fc28e6a035e64c3c572'}">
	                                		<label class="radio-inline">
												<span class="checked" >
													<input name="ISXYB" id="radios1" checked="checked" value="1" type="radio" class="radios" disabled />
												</span>
												宁波市部门
											</label>
											<label class="radio-inline">
												<span>
												<input name="ISXYB" id="radios2" value="2"  type="radio"  class="radios" disabled /></span>
												区县（市）信用办
											</label>
											<label class="radio-inline">
												<span>
												<input name="ISXYB" id="radios3" value="3"  type="radio"  class="radios" disabled /></span>
												区县（市）部门
											</label>
											<input name="XYB" id="XYB" value="1" type="hidden"/>
	                                	</c:if>
	                                	
									</div>
                                </div>
                            </div>
                            <div class="form-actions"> 
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
										<button class="btn blue" type="submit"><i class="fa fa-check"></i> 提  交</button>
										<a href="${ctx}/dept/getInit?page=${page}"><button class="btn blue" id="back" type="button"><i class="fa fa-reply"></i> 返  回</button></a>
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
    	
    	$("#deptForm").validate({
            submitHandler: function(form){
            	layer.confirm('是否修改？', {
        		    btn: ['确定','取消'], 
        		    shade: false 
        		}, function(){
	                $("#deptForm").ajaxSubmit({
	                    url:'${ctx}/dept/updateDept',
	                    dataType:'json',
	                    type:'post',
	                    success:function(data){
	                        var code = data.code;
	                        if(code == 0){
	                            layer.msg('信息修改成功');
	                            window.location.href = '${ctx}/dept/getInit';
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
            	BMMC:{required:true},
            	BMMS:{required:true},
            	BMLX:{required:true}
            },
            messages: {
            	BMMC:{required:"请输入部门名称"},
            	BMMS:{required:"请输入部门描述"},
            	BMLX:{required:"请选择部门类型"}
            }
        });
    	
    	 //用户所在区域
     	var yhQYID = '${map.YHQYID}';
    	//部门所在区域
    	var bmQYID = '${map.QYID}';
    	
     	 //部门属性初始化
        changeBMSX(bmQYID);
     	
        //所属区域初始化
        $.ajax({
            url: '${ctx}/dept/initSSQYList',
            type: "POST",
            data: {QYID:yhQYID},
            dataType: "json"
        }).done(function(data,ss) {
        	var list = "<option value='${map.QYID}'>${map.QYMC}</option>";
       		for(var i=0; i<data.length; i++){
       			list += "<option value='"+data[i].UNID+"'>"+data[i].QYMC+"</option>";
       		}
       		$("#QYID").html(list);
        }).fail(function(jqXHR, textStatus, errorThrown){
       	 	layer.msg('数据加载失败，请稍后重试');
        });
        
        //区域选择后自动修改部门类别
        $("#QYID").change(function(){
        	 var options=$("#QYID option:selected").text();//拿到选中项的值
        	 
        	 if(options!='宁波市'){
       			 $("#uniform-radios1 > span").removeClass('checked');
               	 $("#uniform-radios2 > span").addClass('checked');
               	 $("#radios2").removeAttr("disabled");
                 $("#radios3").removeAttr("disabled");
                 $('#XYB').val('2');//（默认）县市区信用办
                  
        	 }else{
        		 $("#uniform-radios1 > span").addClass('checked');
        		 $("#uniform-radios2 > span").removeClass('checked');
        		 $('#XYB').val('1');//市级
        	 }
		});
      
        //部门类别状态选择
        $(".radios").click(function(){
       
        	 $('#XYB').val($(this).val()); 
/*           $("input:radio[name='ISXYB']").attr("checked",false);
     	     $(this).attr('checked',true);  */
     	   
 		}); 
         
    });
	
    //初始化部门属性选项
    function changeBMSX(qyid){
     	
    	if(qyid=='55bdc68587f74fc28e6a035e64c3c572'){
    		 $("#uniform-radios1 > span").addClass('checked');
    		 $("#uniform-radios2 > span").removeClass('checked');
    		 $('#XYB').val('1');//市级
    	}else{
    		 $("#uniform-radios1 > span").removeClass('checked');
           	 $("#uniform-radios2 > span").addClass('checked');
             $("#radios2").removeAttr("disabled");
             $("#radios3").removeAttr("disabled");
           	 
             $('#XYB').val('2');//县市区
             
    	}
    	
    }
</script>
</rapid:override>
<%@ include file="../../template/base.jsp"  %>
