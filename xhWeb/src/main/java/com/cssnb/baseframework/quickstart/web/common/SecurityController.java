/**
 * 
 */
package com.cssnb.baseframework.quickstart.web.common;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException; 
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.cert.CertificateException; 
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.PropertyResourceBundle;
import java.util.Random;
import org.apache.commons.codec.binary.Base64; 
import javax.annotation.Resource; 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.alibaba.fastjson.JSONObject;
import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.util.ParameterUtil; 
import com.cssnb.baseframework.quickstart.shiro.MyFormAuthentication;
/*import com.cssnb.ca.entity.CAUser;*/ 
import com.cssnb.users.service.UsersService; 
import com.cssnb.util.SystemLog;
import com.cssnb.util.UUIDGenerator;
import com.cssnb.util.UserPublic;
import com.infosec.NetSignServer; 
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.beans.factory.annotation.Autowired;
 

/**
 * SecurityController负责页面登录、登出
 * 
 * @author xuning
 *
 */
@Controller
public class SecurityController {
	private static Logger logger = LoggerFactory.getLogger(SecurityController.class);
	@Resource
	private UsersService usersService;
	
	@Autowired
	private RestTemplate rt;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String tologin(HttpServletRequest request) {
	 
		
		Subject currentUser = SecurityUtils.getSubject();
		if(currentUser != null)
			currentUser.logout();
		return "login";
	}
	@RequestMapping(value = "/nbzr", method = RequestMethod.GET)
	public String tologin2(HttpServletRequest request) {
		
		
		
		Subject currentUser = SecurityUtils.getSubject();
		if(currentUser != null)
			currentUser.logout();
		return "nbzr";
	}
	
	@SystemLog(operationType="forward",operationName="进入信用动态列表页") 
    @RequestMapping(value = "/head",method = RequestMethod.GET)
    public String gethead(HttpServletRequest request){
    	return "head/head";
    }
	
	@SystemLog(operationType="forward",operationName="进入申请指南页面") 
    @RequestMapping(value = "/shenqing",method = RequestMethod.GET)
    public String getshenqing(HttpServletRequest request){
    	return "shenqing/shenqing";
    }
	
	@RequestMapping(value = "/logout")
	@ResponseBody
	public Map<String,Object> logout(HttpServletRequest request) {
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			Subject currentUser = SecurityUtils.getSubject();
			currentUser.logout();
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			logger.error("退出失败！",e);
		}
		return result;
	}
	
	@RequestMapping(value = "/relogin", method = RequestMethod.GET)
	public String relogin() {
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		logger.info("relogin!");
		return "redirect:login";
	}

    @RequestMapping(value = "/loginPass3", method = RequestMethod.POST)
    public Object login3(HttpServletRequest request,HttpServletResponse response,Model model) throws KeyStoreException, NoSuchProviderException, NoSuchAlgorithmException, CertificateException, IOException {
 
    	Subject subject = SecurityUtils.getSubject();//取得当前登录人
    	MyFormAuthentication myFormAuthentication = new MyFormAuthentication();
    	Map<String,Object> paraMap = ParameterUtil.getFilterMap(request);
    	String pass = request.getParameter("password");//密码
    	String name = request.getParameter("username");//
    	
    	
	     String ca =   (String)paraMap.get("passport"); 
	    
	    
   	 try{
  		 if(ca.trim()!=""){
  			List yh =  usersService.getCa(ca);
  			if(yh.size()!=0){
  			Map yhxx = (Map)yh.get(0);
  			if(name.trim()!=""){
  				if(pass.trim()!=""){
  					String userName = usersService.getUserName(name);
  					if(userName!=null){
          				String userPass = usersService.vilidate(userName);
          				if(name.equals(userName) && pass.equals(userPass)&&yhxx.get("CABZF").toString().equals(ca)&&yhxx.get("YHM").toString().equals(userName)&&yhxx.get("MM").toString().equals(userPass)){
          					//subject.login(myFormAuthentication.createToken2(request, response));
          					subject.login(myFormAuthentication.createToken(request, response,yhxx));
          					Map param = new HashMap();
          					String username =  UserPublic.login();
          					param.put("YHM", username);
          					List<HashMap<String, Object>> userList = usersService.getUserList(param);//获取登陆用户
          				//	request.setAttribute("BMID", userList.get(0).get("BMID").toString());
          				}else{
          					String message = "用户名和密码不正确，请重新输入。";
          					model.addAttribute("msg", message);
          					System.out.println(model);
          					return "/login";
          				}
  					}else{
       				   String message ="无此用户。";
       				   model.addAttribute("message", message);
       				   System.out.println(model);
       				   return "/login";
  					}
  					}
  				}
  			}else{
  	  			String message ="无此CA用户。";
 			   model.addAttribute("message", message);
 			   System.out.println(model);
 			   return "/login";
   		 }
  		 }
  		 }catch (Exception e) {
		 			e.printStackTrace();
		 			model.addAttribute(MyFormAuthentication.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, e.getMessage());
		 			return "/login";
		}
       return "redirect:/index";
    }
    
    
    
	
    @RequestMapping(value = "/loginPass", method = RequestMethod.POST)
    public Object login(HttpServletRequest request,HttpServletResponse response,Model model) {
    	Subject subject = SecurityUtils.getSubject();//取得当前登录人
    	String pass = request.getParameter("password");
    	
    	String name = request.getParameter("username");
    	
    	MyFormAuthentication myFormAuthentication = new MyFormAuthentication();
    	try {
    		if(name.trim()!=""){
        		if(pass.trim()!=""){
        			String userName = usersService.getUserName(name);
        			if(userName!=null){
        				String zt = usersService.zt(userName);
        				if(zt.equals("1")){
        					String userPass = usersService.vilidate(userName);
            				if(name.equals(userName) && pass.equals(userPass)){
            					
            					Map yhxxMap = new HashMap();
            					yhxxMap.put("YHM", userName);
            					List yh =  usersService.getUserList(yhxxMap);
            		  			if(yh.size()!=0){
	            		  			Map yhxx = (Map)yh.get(0);
	            		  			///subject.login(myFormAuthentication.createToken(request, response,yhxx));
            		  			}
            					Map param = new HashMap();
              					String username =  UserPublic.login();
              					param.put("YHM", username);
              					List<HashMap<String, Object>> userList = usersService.getUserList(param);//获取登陆用户
              					HttpServletRequest requests = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
              					//requests.getSession().setAttribute("BMID", userList.get(0).get("BMID").toString());
              					requests.getSession().setAttribute("S_CABZF", "N");
              					requests.getSession().setAttribute("loginname",  name);
              					requests.getSession().setAttribute("SY_TC","1");//首页_弹出  首页弹出层判断 登录进来的是1 弹出层上 点过确定的是2
              					
              					
              			    	if("3".equals(userList.get(0).get("ISXYB"))){
              			    		//当用户为县市区部门用户是需要跳转到手机短信验证码页面
              			    		requests.getSession().setAttribute("TEL", userList.get(0).get("JSSJHM"));
              			    		return "/loginMsg";
              			    	}
              			    	
            				}else{
            					String message = "用户名和密码不正确，请重新输入。";
            					model.addAttribute("msg", message);
            					return "/login";
            				}
        				}else{
        					String message ="用户已停用。";
         				   model.addAttribute("message", message);
         				   return "/login";
        				}
        			}else{
        				   String message ="无此用户。";
        				   model.addAttribute("message", message);
        				   return "/login";
        			}
        		}
        	}			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute(MyFormAuthentication.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, e.getMessage());
			return "/login";
		}
       return "redirect:/index";
    }
    @RequestMapping(value = "/nbzrLogin", method = RequestMethod.POST)
    public Object login2(HttpServletRequest request,HttpServletResponse response,Model model) {
    	Subject subject = SecurityUtils.getSubject();//取得当前登录人
    	String pass = request.getParameter("password");
    	
    	String name = request.getParameter("username");
    	
    	MyFormAuthentication myFormAuthentication = new MyFormAuthentication();
    	try {
    		if(name.trim()!=""){
        		if(pass.trim()!=""){
        			String userName = usersService.getUserName(name);
        			if(userName!=null){
        				String userPass = usersService.vilidate(userName);
        				if(name.equals(userName) && pass.equals(userPass)){
        					//subject.login(myFormAuthentication.createToken2(request, response));
        					Map yhxxMap = new HashMap();
        					yhxxMap.put("YHM", userName);
        					List yh =  usersService.getUserList(yhxxMap);
        		  			if(yh.size()!=0){
            		  			Map yhxx = (Map)yh.get(0);
            		  			//subject.login(myFormAuthentication.createToken(request, response,yhxx));
            		  			 return "redirect:/index";
        		  			}
        					
        					Map param = new HashMap();
          					String username =  UserPublic.login();
          					param.put("YHM", username);
          					List<HashMap<String, Object>> userList = usersService.getUserList(param);//获取登陆用户
          					HttpServletRequest requests = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
          					//requests.getSession().setAttribute("BMID", userList.get(0).get("BMID").toString());
//          					requests.getSession().setAttribute("SY_TC","1");//首页_弹出  首页弹出层判断 登录进来的是1 弹出层上 点过确定的是2
//          					requests.getSession().setAttribute("S_Y", "1") ; 
//          					requests.getSession().setAttribute("ISCA", "N") ; 
//          			    	requests.getSession().setAttribute("S_CABZF",userList.get(0).get("CABZF").toString());
          			    
          			    		
        				}else{
        					String message = "用户名和密码不正确，请重新输入。";
        					model.addAttribute("msg", message);
        					return "/nbzr";
        				}
        			}else{
        				   String message ="无此用户。";
        				   model.addAttribute("message", message);
        				   return "/nbzr";
        			}
        		}
        	}			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute(MyFormAuthentication.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, e.getMessage());
			//return "/nbzr";
			 return "redirect:/index";
		}
       return "redirect:/index";
    } 
    
    
    
    @SystemLog(operationType="select",operationName="根据信息事项主键id和信息事项内容id获取各自对象") 
	@RequestMapping("/testca")
	@ResponseBody
 
	public  Map  testca(JqgridPage jqgridPage,WebRequest request){
		Map<String, Object> paraMap = ParameterUtil.getFilterMap(request);
		String username =  UserPublic.login();
    	paraMap.put("YHM", username);
		List<HashMap<String, Object>> userList = usersService.getUserList(paraMap);//获取登陆用户
	    String ca =   (String)paraMap.get("passport");
	    if(userList.get(0).get("CABZF").toString().equals(ca)){
	    	paraMap.put("SFYX", "Y");
	    	paraMap.put("CABZF", ca);
	    	HttpServletRequest requests = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
	    	requests.getSession().setAttribute("S_Y", "1") ;
	    	requests.getSession().setAttribute("S_CABZF",ca);
//	    	requests.getSession().getAttribute("S_Y")
	    }else{
	    	paraMap.put("SFYX", "N");
	    }
		/*int i = yyclService.updateYybz(param); 
		if (i>0){
			param.put("yybz", "1");
		}else{
			param.put("yybz", "0");
		}*/
		return paraMap;
	}
   
    
     

    public static void main(String[] args) throws  Exception {
     	String txtCert ="MIIDyTCCA2ygAwIBAgIIdMEAKQAATGMwDAYIKoEcz1UBg3UFADBSMQswCQYDVQQGEwJDTjEvMC0GA1UECgwmWmhlamlhbmcgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkxEjAQBgNVBAMMCVpKQ0EgT0NBMTAeFw0xNjA3MTkwODMwMDFaFw0xODA3MTkwNzE0NDJaMHkxCzAJBgNVBAYTAkNOMQ8wDQYDVQQIDAbmtZnmsZ8xDzANBgNVBAcMBuWugeazojEVMBMGA1UECgwM5Y2V5L2N5ZCN56ewMSEwHwYDVQQLDBjlroHms6LnlLXlrZDmlL/liqHlpJbnvZExDjAMBgNVBAMMBUNO6aG5MFkwEwYHKoZIzj0CAQYIKoEcz1UBgi0DQgAEqNLKPdgf5BSvfDa22OchP9XfHITc2LQ34tWR2XEgmRqtQHvfR1Jc68pmaHvomtWW0fqkQqETMyw2ZbOu6CNNEqOCAgEwggH9MAwGA1UdEwQFMAMBAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMAsGA1UdDwQEAwIAwDARBglghkgBhvhCAQEEBAMCAIAwHgYIKoEc0BQEAQEEEjIyMDMwMTE5ODYwNzE5MDAxNjAfBgNVHSMEGDAWgBSn07EkkCAdPbRU7ks3KFKRrixqIjCBqAYDVR0fBIGgMIGdMIGaoIGXoIGUhoGRbGRhcDovL2xkYXAuempjYS5jb20uY24vQ049WkpDQSBPQ0ExLENOPVpKQ0EgT0NBMSwgT1U9Q1JMRGlzdHJpYnV0ZVBvaW50cywgbz16amNhP2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Q/YmFzZT9vYmplY3RjbGFzcz1jUkxEaXN0cmlidXRpb25Qb2ludDCBogYIKwYBBQUHAQEEgZUwgZIwgY8GCCsGAQUFBzAChoGCbGRhcDovL2xkYXAuempjYS5jb20uY24vQ049WkpDQSBPQ0ExLENOPVpKQ0EgT0NBMSwgT1U9Y0FDZXJ0aWZpY2F0ZXMsIG89empjYT9jQUNlcnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTAdBgNVHQ4EFgQU8hPn7KXBRy6p8zEYgqf2OLta8tswDAYIKoEcz1UBg3UFAANJADBGAiEAzqJ4hLcf9wtXjdD19BJNWkPuISXqwqXYUwfmyKXNoQUCIQCbg0kHBmHoi9v4+4tXZIQAW0ZXuWm2tbHq0GRo33Y/Wg==";//证书 
	   	String txtSignedData ="MEUEIQCBHI9QbCT3Di6jiz283wcpoN5YjTuv88RUmCON+sOhLgQgZsINSgJVrOu98tC6P81pOdAG3t0RK5pJ0FqbvzL6UGI=";//签名结果 
	   	String  zs_yw = "123456"; //证书原文  
 	 
  			
   
    	
  	 
   }
  
    
  
 	
 	  
}
