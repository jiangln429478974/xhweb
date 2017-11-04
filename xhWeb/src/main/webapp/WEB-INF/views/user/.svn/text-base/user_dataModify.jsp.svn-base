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
                       	用户资料修改
                    </div>
<!--                     <div class="tools"> -->
<!-- 								<a class="collapse" href="" data-original-title="" title=""> -->
<!-- 								</a> -->
<!--                     </div> -->
                </div>
                    <div class="portlet-body form">
               		 <br/>
                        <form class="form-horizontal" id="userForm" method="post">
                            <input type="hidden" name="ID" value="${map.ID}">
                            <div class="form-group">
                                <label class="col-lg-3 control-label">用户名：</label>
                                <div class="col-lg-3">
                                	<input type="hidden" name="YHM" id = "YHM" value="${map.YHM}">
                                    <input type="text"  placeholder="用户名" value="${map.YHM}" class="form-control" disabled="disabled">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">姓名：</label>
                                <div class="col-lg-3">
                                    <input type="text" name="XM" id="XM" placeholder="姓名" value="${map.XM}" class="form-control">
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                             <div class="form-group">
                                <label class="col-lg-3 control-label">新密码：</label>
                                <div class="col-lg-3">
                                    <input type="password" name="MM" id="MM" placeholder="新密码" class="form-control" value="${map.MM }">
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">新密码确认：</label>
                                <div class="col-lg-3">
                                    <input type="password" id="MMYZ" name="MMYZ" placeholder="新密码确认" class="form-control" value="${map.MM }">
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                            
                              <div class="form-group">
                                <label class="col-lg-3 control-label">部门：</label>
                                <div class="col-lg-3">
                                	<input type="text" class="form-control" id="BMID" value="${map.BMMC }" disabled="disabled"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">角色：</label>
                                <div class="col-lg-9">
                                	<label class="col-lg-9 control-label" style="text-align: left;">
                                	${map.JSM }
                                	</label>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-lg-3 control-label">状态：</label>
                                <div class="col-lg-9">
                                	<input type="hidden" name="ZT" value="${map.ZT }"/>
                                	<label class="col-lg-2 control-label" style="text-align: left;">
	                              		 <c:if test="${map.ZT==1 }">启用</c:if>
	                              		 <c:if test="${map.ZT==2 }">停用</c:if>
                              		 </label>
                                </div>
                            </div>
                        
                            <div class="form-group">
                                <label class="col-lg-3 control-label">手机号码：</label>
                                <div class="col-lg-3">
                                    <input type="text" name="JSSJHM" placeholder="手机号码" value="${map.JSSJHM}" class="form-control">
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">电子邮箱：</label>
                                <div class="col-lg-3">
                                    <input type="text" name="DJYX" placeholder="电子邮箱" value="${map.DJYX}" class="form-control">
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                           
                           
                           
                           <div class="form-actions"> 
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn blue" type="submit"><i class="fa fa-check"></i> 提  交</button>
											<a href="${ctx}/index"><button class="btn blue" type="button"><i class="fa fa-reply"></i> 返  回</button></a>
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
  
    //以下为官方示例
    $().ready(function () {
    	//修改表单提交
 
    	$("#userForm").validate({
            submitHandler: function(form){
            	layer.confirm('是否修改？', {
        		    btn: ['确定','取消'], 
        		    shade: false 
        		}, function(){
	                $("#userForm").ajaxSubmit({
	                    url:'${ctx}/users/modifyUserData',
	                    dataType:'json',
	                    type:'post',
	                    success:function(data){
	                        var code = data.code;
	                       
	                        var  XM =  $("#XM").val();
	                    	  XM = encodeURI(XM); 
	                        var  YHM =  $("#YHM").val();
	                        var  MM2 =  $("#MM").val();
	                        MM = escape(MM2) ;
	                        var  BMMC =  $("#BMID").val();
	                        BMMC = encodeURI(BMMC); 
 
	                        if(code == 0){
	                            layer.msg('用户信息修改成功');
	                            //window.location.href = '${ctx}/users/getInit';
	                            window.location.href = 'http://10.19.13.245/jcms/interface/ldap/receive.jsp?state=C&result=T&loginuser='+YHM+'&loginpass='+MM+'&domainname='+BMMC+'&alldomainname= '+BMMC+'&modifyuser=T&ndlogin=0&t_name='+XM;
	                            window.location.href = '${ctx}/';
	                            //form.reset();
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
            	YHM:{required:true,maxlength:10},
            	XM:{required:true},
            	MM:{required:true,rangelength:[8,20],equalTo:"#MMYZ",regex:true },
            	MMYZ:{required:true,rangelength:[8,20],equalTo:"#MM" ,regex:true},
            	JSSJHM: { required: true,digits:true,maxlength:11 },
                DJYX: { required: true,email:true }
            },
            messages: {
            	YHM:{required:"<span style='color:red'>请输入用户名</span>"},
            	XM:{required:"<span style='color:red'>请输入姓名</span>"},
            	MM:{required:"<span style='color:red'>请输入新密码</span>",rangelength:"<span style='color:red'>请输入长度在8-20位的密码</span>",equalTo:"<span style='color:red'>两次输入的密码不相同</span>"},
            	MMYZ:{required:"<span style='color:red'>请确认新密码</span>",rangelength:"<span style='color:red'>请输入长度在8-20位的密码</span>",equalTo:"<span style='color:red'>两次输入的密码不相同</span>"},
            	JSSJHM: { required: "<span style='color:red'>请输入您的手机号</span>",maxlength:"<span style='color:red'>请输入正确手机号码</span>" },
            	DJYX: { required: "<span style='color:red'>请输入电子邮箱</span>" }
            }
        });
    	
    	jQuery.validator.addMethod("regex",function(str, element){  //扩展方法示例:　　　　　　　　　　　  
    			/* var regExp1 =/^(?=.*[0-9].*)(?=.*[A-Z].*)(?=.*[a-z].*).{8,20}$/; //
    			var regExp2 =/(?=.*[a-z])(?=.*\d)(?=.*[#@!~%^&*])[a-z\d#@!~%^&*]/i; //   ~!@#$%^&*
    			var flag= 0;
    		    if(regExp1.test(value)){
    			 flag=flag+1;
    			}  
		   		 if(regExp2.test(value)){
		   			 flag=flag+1;
		   		 }  
    			 if(flag==2){ 
    				return true;
    			}else{ 
    				return false;
    			}  */
    			
    			
    			var rC = {  lW:'[a-z]',  uW:'[A-Z]',  nW:'[0-9]',  sW:'[\\u0020-\\u002F\\u003A-\\u0040\\u005B-\\u0060\\u007B-\\u007E]'  };
    			
    			var tR = {  l:Reg(str, rC.lW),  u:Reg(str, rC.uW), n:Reg(str, rC.nW), s:Reg(str, rC.sW)  };
    			
    			function Reg(str, rStr){ 
    		        var reg = new RegExp(rStr); 
    		        if(reg.test(str)) return true; 
    		        else return false; 
    		    }
    			
    			if((tR.l && tR.u && tR.n) || (tR.l && tR.u && tR.s) || (tR.s && tR.u && tR.n) || (tR.s && tR.l && tR.n)){ 
    	           // document.title = '密码符合要求'; 
    	            return true; 
    	        }else{ 
    	           // document.title = '您的密码必须含有“小写字母”、“大写字母”、“数字”、“特殊符号”中的任意三种'; 
    	            return false; 
    	        }
    			
    			//alert(regExp1.test(value))
    			//return  regExp1.test(value);         //value  被验证的input传入的值  
    	       },"<span style='color:red'>您的密码必须含有“小写字母”、“大写字母”、“数字”、“特殊符号”中的任意三种</span>");  


    
    });

</script>
</rapid:override> 
<c:if test='${sessionScope.loginname!="hzh_fgw" }'>
<%@ include file="../template/base.jsp"  %>
</c:if>
<c:if test='${sessionScope.loginname=="hzh_fgw" }'>
<%@ include file="../template/basenomenu.jsp"  %>
</c:if>
