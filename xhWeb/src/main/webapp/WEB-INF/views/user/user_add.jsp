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
                       	添加用户
                    </div>
                </div>
                <div class="portlet-body form">
                	<br/>
                        <form class="form-horizontal" id="userForm" method="post">
                      		 <div class="form-group">
                                <label class="col-lg-3 control-label">姓名：</label>
                                <div class="col-lg-3">
                                    <input type="text" name="XM" id ="XM" placeholder="姓名" class="form-control">
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">身份证号：</label>
                                <div class="col-lg-3">
                                    <input type="text" name="YHM" id="YHM" placeholder="身份证号" class="form-control">
                                </div>
                                 <p class="help-inline red">* <c:if test="${map.YHLX=='XYB'}">将用于平台登录</c:if> </p>
                            </div>
                           
                            <c:if test="${map.YHLX=='XYB'}">
                            	<div class="form-group">
                            
                            	  <label class="col-lg-3 control-label"></label>
	                                <div class="col-lg-3">
                                    	<button type="button" class="btn btn-primary" onclick="checkInfo()">信息核查</button>
	                                </div>
                            	</div>
                            </c:if>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">密码：</label>
                                <div class="col-lg-3">
                                    <c:if test="${map.YHLX=='XYZX'}"><input type="password" name="MM" id="MM" placeholder="密码" class="form-control"></c:if>
                                    <c:if test="${map.YHLX=='XYB'}"><input type="password" name="MM" id="MM" placeholder="密码" class="form-control" disabled="disabled"></c:if>
                                </div>
                                <label class="help-inline red">
                                	* 长度在8-20位，必须含有"小写字母"、大写字母"、"数字"、"特殊符号"中的任意三种
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">确认密码：</label>
                                <div class="col-lg-3">
                                    <c:if test="${map.YHLX=='XYZX'}"><input type="password" id="MMYZ" name="MMYZ" placeholder="确认密码" class="form-control"></c:if>
                                    <c:if test="${map.YHLX=='XYB'}">  <input type="password" id="MMYZ" name="MMYZ" placeholder="确认密码" class="form-control" disabled="disabled"></c:if>
                                </div>
                                <label class="help-inline red">* 请重新输入密码</label>
                            </div>
                            
                            <c:if test="${map.YHLX=='XYZX'}">
	                            <div class="form-group">
	                                <label class="col-lg-3 control-label">是否CA用户：</label>
	                                <div class="col-lg-9">
	                                	<div class="radio-list">
												<label class="radio-inline">
													<span class=""><input name="SFCA" checked="checked" value="1"  type="radio" class="radiosCA"></span>
														是
												</label>
												<label class="radio-inline">
													<span class="checked"><input name="SFCA" value="2"  type="radio" class="radiosCA" checked="checked"></span>
														否
												</label>
											</div>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-lg-3 control-label">CA标识符：</label>
	                                <div class="col-lg-3">
	                                    <input type="text" name="CABZF" id="CABZF" placeholder="CA标识符" class="form-control" disabled="disabled">
	                                </div>
	                            </div>
                            </c:if>
                            <c:if test="${map.YHLX=='XYB'}">
                          	   <input name="SFCA" value="2"  type="hidden" class="radiosCA" checked="checked"  >  
                          	   <input type="hidden" name="CABZF" id="CABZF" placeholder="CA标识符" class="form-control" disabled="disabled" value="0"  >
                            </c:if>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">部门：</label>
                                <div class="col-lg-3">
                             	    <c:if test="${map.YHLX=='XYZX'}"><select name="BMID" id="BMID" class="form-control"></select></c:if>
                                    <c:if test="${map.YHLX=='XYB'}" ><select name="BMID" id="BMID" class="form-control" disabled="disabled"></select> </c:if>
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">职务：</label>
                                <div class="col-lg-3">
                                    <c:if test="${map.YHLX=='XYZX'}"><input type="text" name="ZW" id="ZW" placeholder="职务" class="form-control"></c:if>
                                    <c:if test="${map.YHLX=='XYB'}" ><input type="text" name="ZW" id="ZW" placeholder="职务" class="form-control" disabled="disabled"></c:if>
                                </div>
                                  <label class="help-inline red">*</label>
                            </div>
                            
                           <c:if test="${map.YHLX=='XYZX'}">
	                           <div class="form-group">
								<label class="col-lg-3 control-label">角色：</label>
									<div class="col-md-3">
									 	<select id="JSID" class="form-control" size="8" multiple="multiple"></select>
								    </div>
								    <div class="col-md-1">
										  <button type="button" id="JSID_rightAll" class="btn btn-block" style="margin-left: 0px;"><i class="glyphicon glyphicon-forward"></i></button>
										  <button type="button" id="JSID_rightSelected" class="btn btn-block" style="margin-left: 0px;"><i class="glyphicon glyphicon-chevron-right"></i></button>
										  <button type="button" id="JSID_leftSelected" class="btn btn-block" style="margin-left: 0px;"><i class="glyphicon glyphicon-chevron-left"></i></button>
										  <button type="button" id="JSID_leftAll" class="btn btn-block" style="margin-left: 0px;"><i class="glyphicon glyphicon-backward"></i></button>
								    </div>
								    <div class="col-md-3">
										  <select name="JSIDTO" id="JSID_to" class="form-control" size="8" multiple="multiple"></select>
								    </div>
								 	<label class="help-inline red">*</label>
								</div>
                           </c:if>
                            <c:if test="${map.YHLX=='XYB'}">
                            	  <div class="form-group">
	                              	<label class="col-lg-3 control-label">角色：</label>
	                                <div class="col-lg-3">
	                                    <input type="text"  placeholder="" value="区县（市）部门用户" class="form-control" disabled="disabled" >
	                               		  <select name="JSIDTO" id="JSID_to"  value="" class="form-control" size="8"  style="display:none;">
	                               			  <option value='bd004325d76145f38bd963f0cfef0a6a'>区县（市）部门用户</option>
	                               		  </select>
	                                </div>
	                                <label class="help-inline red">*</label>
                           		 </div>
                            </c:if>
                           
                           
                            <div class="form-group">
                                <label class="col-lg-3 control-label">状态：</label>
                                <div class="col-lg-9">
                                	<div class="radio-list">
                                			<label class="radio-inline">
												<c:if test="${map.YHLX=='XYZX'}">
													<span class=""><input name="ZT" id="radios1" checked="checked" value="1"  type="radio" class="radios"></span>启用
												</c:if>
												<c:if test="${map.YHLX=='XYB'}">
													<span class=""><input name="ZT" id="radios1" checked="checked" value="1"  type="radio" class="radios" disabled="disabled"></span>启用
												</c:if>
											</label>
											<label class="radio-inline">
												<c:if test="${map.YHLX=='XYZX'}">
													<span class="checked"><input name="ZT" id="radios2" value="2"  type="radio" class="radios"></span>停用
												</c:if>
												<c:if test="${map.YHLX=='XYB'}">
													 <span class="checked"><input name="ZT" id="radios2" value="2"  type="radio" class="radios" disabled="disabled"></span>停用   
												</c:if>
											</label>
									</div>
                                </div>
                            </div>
                          
                            <div class="form-group">
                                <label class="col-lg-3 control-label">接收手机号码：</label>
                                <div class="col-lg-3">
                                    <c:if test="${map.YHLX=='XYZX'}">
                                       <input type="text" name="JSSJHM" placeholder="接收手机号码" class="form-control sjhm">
                                    </c:if>
                                    <c:if test="${map.YHLX=='XYB'}">
                                       <input type="text" name="JSSJHM" id="JSSJHM" placeholder="接收手机号码" class="form-control sjhm" disabled="disabled">
                                    </c:if>
                                    
                                </div>
                                 <label class="help-inline red">* 用于接收重要通知短信</label>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">电子邮箱：</label>
                                <div class="col-lg-3">
                                    <c:if test="${map.YHLX=='XYZX'}">
                                       <input type="text" name="DJYX" placeholder="电子邮箱" class="form-control mail">
                                    </c:if>
                                    <c:if test="${map.YHLX=='XYB'}">
                                       <input type="text" name="DJYX" id="DJYX" placeholder="电子邮箱" class="form-control mail" disabled="disabled">
                                    </c:if>
                                </div>
                                <label class="help-inline red">* 用于接收重要通知邮箱</label>
                            </div>
                            
                            <div class="form-actions" style="margin-left: 0px;margin-right: 0px;"> 
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn blue" type="submit"><i class="fa fa-check"></i> 提  交</button>
											<a href="${ctx}/users/getInit"><button class="btn blue" id="back" type="button"><i class="fa fa-reply"></i> 返  回</button></a>
										</div>
									</div>
							</div>	
                        </form>
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
    var bool=false;
    
    $().ready(function () {
    	//角色多选框
    	$('#JSID').multiselect();
    	
        $("#userForm").validate({
            submitHandler: function(form){
            	layer.confirm('是否添加？', {
        		    btn: ['确定','取消'], 
        		    shade: false 
        		}, function(){
        			 
        			//右边角色全选
        	    	$("#JSID_to option").each(function(){
            		    $(this).attr("selected","selected");
            		});
	            	$("#userForm").ajaxSubmit({
	                    url:'${ctx}/users/addUser',
	                    dataType:'json',
	                    type:'post',
	                    success:function(data){
	                        var code = data.code;
	                        if(code == 0){
	                            layer.msg('用户添加成功');
	                            var  XM =  $("#XM").val();
		                    	  XM = encodeURI(encodeURI(XM)); 
		                        var  YHM =  $("#YHM").val();
		                        var  MM2 =  $("#MM").val();
		                        MM = escape(MM2) ;
		                        var  BMMC2 =   $("#BMID").find("option:selected").text(); 
		                        BMMC = encodeURI(encodeURI(BMMC2));  
	                            window.location.href = 'http://10.19.13.245/jcms/interface/ldap/receive.jsp?state=C&result=T&loginuser='+YHM+'&loginpass='+MM+'&domainname='+BMMC+'&alldomainname= '+BMMC+'&modifyuser=T&ndlogin=0&t_name='+XM;
		                           
	                            window.location.href = '${ctx}/';
	                           
	                        }else{//错误信息提示
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
            	YHM:{required:true,maxlength:20},
            	MM:{required:true,rangelength:[8,20],equalTo:"#MMYZ",regex:true  },
            	MMYZ:{required:true,rangelength:[8,20],equalTo:"#MM",regex:true  },
            	XM:{required:true},
            	JSSJHM: { required: true,digits:true,maxlength:11,minlength:11 },
                DJYX: { required: true,email:true },
                BMID: { required: true },
                ZW:   { required: true },
                JSIDTO: { required: true }
            },
            messages: {
            	YHM:{required:"<span style='color:red'>请输入用户名</span>"},
            	MM:{required:"<span style='color:red'>请输入密码</span>",rangelength:"<span style='color:red'>请输入长度在8-20位的密码</span>",equalTo:"<span style='color:red'>两次输入的密码不相同</span>"},
            	MMYZ:{required:"<span style='color:red'>请确认密码</span>",rangelength:"<span style='color:red'>请输入长度在8-20位的密码</span>",equalTo:"<span style='color:red'>请输入密码</span>"},
            	XM:{required:"<span style='color:red'>请输入姓名</span>"},
            	JSSJHM: { required: "<span style='color:red'>请输入您的手机号</span>" },
            	DJYX: { required: "<span style='color:red'>请输入电子邮箱</span>" },
            	BMID: { required: "<span style='color:red'>请选择部门</span>" },
            	ZW: { required: "<span style='color:red'>请输入职务</span>" },
            	JSIDTO: { required: "<span style='color:red'>请选择角色</span>" }
            }
        });
        
    	jQuery.validator.addMethod("regex",function(str, element){  //扩展方法示例:　　　　　　　　　　　  
			var rC = {  lW:'[a-z]',  uW:'[A-Z]',  nW:'[0-9]',  sW:'[\\u0020-\\u002F\\u003A-\\u0040\\u005B-\\u0060\\u007B-\\u007E]'  };
			var tR = {  l:Reg(str, rC.lW),  u:Reg(str, rC.uW), n:Reg(str, rC.nW), s:Reg(str, rC.sW)  };
			function Reg(str, rStr){ 
		        var reg = new RegExp(rStr); 
		        if(reg.test(str)) return true; 
		        else return false; 
		    }
			if((tR.l && tR.u && tR.n) || (tR.l && tR.u && tR.s) || (tR.s && tR.u && tR.n) || (tR.s && tR.l && tR.n)){ 
	            return true; 
	        }else{ 
	            return false; 
	        }
	       },"<span style='color:red'>您的密码必须含有“小写字母”、“大写字母”、“数字”、“特殊符号”中的任意三种</span>");  
        
       //初始化部门
        $.ajax({
            url: '${ctx}/dept/initDeptList',
            type: "POST",
            data: {},
            dataType: "json"
        }).done(function(data,ss) {
       		var list = "<option value=''>请选择部门</option>";
       		for(var i=0; i<data.length; i++){
       			list += "<option value='"+data[i].ID+"'>"+data[i].BMMC+"</option>";
       		}
       		$("#BMID").html(list);
        }).fail(function(jqXHR, textStatus, errorThrown){
       	 	layer.msg('数据加载失败，请稍后重试');
        });
        
       
        //初始化角色
        $.ajax({
            url: '${ctx}/role/initRoleList',
            type: "POST",
            data: {},
            dataType: "json"
        }).done(function(data,ss) {
       		var list = "";
       		for(var i=0; i<data.length; i++){
       			list += "<option value='"+data[i].ID+"'>"+data[i].JSM+"</option>";
       			//st += "<input type='checkbox' name='rr' value='"+data[i].ID+"' onclick='checkItem(this,"+'bb'+")' style='margin-left:10px;' />"+data[i].BMMC;
       		}
       		$("#JSID").html(list);
        }).fail(function(jqXHR, textStatus, errorThrown){
       	 	layer.msg('数据加载失败，请稍后重试');
        });
        //状态选择
       $(".radios").click(function(){
    	   $("input:radio[name='ZT']").attr("checked",false);
    	   $(this).attr('checked',true); 
		});
        //是否CA用户
       $(".radiosCA").click(function(){
    	   $("input:radio[name='SFCA']").attr("checked",false);
    	   $(this).attr('checked',true); 
    	   if($(this).val()==1)$("#CABZF").attr('disabled',false);
    	   else $("#CABZF").attr('disabled',true);
		});
        
        
        //validate自定义方法名 
       jQuery.validator.addMethod("sjhm", function(value, element) {
    	     var length = value.length;     
    	     var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(16[0-9]{9})|(19[0-9]{9})|(15[0-9]{9})$/;    
    	     return (length == 11 && mobile.exec(value))? true:false; 
       }, "<span class='help-inline' style='color:red;'>请正确填写您的手机号码</span>");
     
       //邮箱 表单验证规则
       jQuery.validator.addMethod("mail", function (value, element) {
       	var mail = /^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$/;
       	return this.optional(element) || (mail.test(value));
       }, "<span class='help-inline' style='color:red;'>邮箱格式不对</span>");
 
     //end ready
    });

    
    function ajaxSub(obj){
    	var dt;
	   	 $.ajax({
	   		 async:false,
	         url: '${ctx}/users/isShareExe/',
	         type: "POST",
	         data: {GXMLMC:obj},
	         dataType: "json"
	     }).done(function(data,ss) {
	    		dt = data.result;
	     });
	   	 		return  dt;
    }
    
    function checkInfo(){
    	 
		  var sfzh=$('#YHM').val();
		var xm=$('#XM').val();
		if((sfzh.replace(/(^s*)|(s*$)/g, "").length >0) && (xm.replace(/(^s*)|(s*$)/g, "").length >0) ){
			   $.ajax({
			    	 url: '${ctx}/users/checkInfo/',
			         type: "POST",
			         data: {sfzhm:sfzh,xm:xm},
			         dataType: "json"
			    }).done(function(data,ss) {
		    		 
			    	layer.msg(data.msg);
		    		if(data.code=='0'){
		    			//成功
		    			$('#YHM').attr('disabled','disabled'); 
		    			$('#XM').attr('disabled','disabled'); 
		    			
		    			$('#MMYZ').removeAttr('disabled');
		    			$('#MM').removeAttr('disabled');
		    			$('#MMYZ').removeAttr('disabled');
		    			$('#BMID').removeAttr('disabled');
		    			$('#ZW').removeAttr('disabled');
		    			$('#radios1').removeAttr('disabled');
		    			$('#radios2').removeAttr('disabled');
		    			$('#JSSJHM').removeAttr('disabled');
		    			$('#DJYX').removeAttr('disabled');
		    			
		    			bool=true;
		    		}else{
		    			bool=false;
		    		} 
		    		 
		   		});
		}else{
			layer.msg('请输入身份证号和姓名');
		} 
	  
    }

</script>
</rapid:override>
<%@ include file="../template/base.jsp"  %>