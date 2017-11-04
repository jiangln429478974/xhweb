package com.cssnb.util;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.eclipse.jetty.security.LoginService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


import com.alibaba.fastjson.JSON;
import com.cssnb.loginlog.service.LoginLogService;
import com.cssnb.monitor.service.SystemLogService;

/**
 * @author 袁爽
 * @version 创建时间：2015年10月30日 16:38:29
 * @desc 切点类 
 */
@Aspect
@Component
public class SystemLogAspect {
   @Resource
  private SystemLogService systemLogService;
  
   @Resource
   private LoginLogService loginLogService;
   private static  final Logger logger = LoggerFactory.getLogger(SystemLogAspect.class);
   private String url, actionUrl, paramStr = "";
   //配置Controller切入点
   @Pointcut("execution(* com.cssnb..controller..*.*(..) )")
   private void controllerAspect(){
	   System.out.println("配置controller切入点");
   }
   @Pointcut("execution(* com.cssnb.baseframework.quickstart.web.common.SecurityController.*(..))")
   private void loginAspect(){
	   System.out.println("配置login切入点");
   }
   
   @Pointcut("execution(* com.cssnb..service..*.*(..) )")
   private void showRunningTime(){
   }
   
   //显示service的方法运行时间
   @Around("showRunningTime()")
   public Object showRunningTimearound(JoinPoint joinPoint){
//	   System.out.println("==========开始执行controller环绕通知===============");
	   long start = System.currentTimeMillis();
	   Object obj = null;
	   try {
		obj=((ProceedingJoinPoint) joinPoint).proceed();
		long end = System.currentTimeMillis();
		if(logger.isInfoEnabled()){
			logger.info("around " + joinPoint + "\tUse time : " + (end - start) + " ms!");
		}
//		 System.out.println("==========结束执行controller环绕通知===============");
		 
	} catch (Throwable e) {
		// TODO Auto-generated catch block
		 long end = System.currentTimeMillis();
		 logger.info(e.getMessage());
		 if(logger.isInfoEnabled()){
			 logger.info("around " + joinPoint + "\tUse time : " + (end - start) + " ms with exception : " + e.getMessage());
		 }
	}
	   return obj;
   }
   
   
//   @Before("controllerAspect()")
//   public void doBefore(JoinPoint joinPoint){
//	   System.out.println("==========执行controller前置通知===============");
//	   if(logger.isInfoEnabled()){
//		   logger.info("before " + joinPoint);
//	   }
//   }
//   @Before("loginAspect()")
//   public void doLoginBefore(JoinPoint joinPoint){
//	   System.out.println("==========执行controller前置通知===============");
//	   if(logger.isInfoEnabled()){
//		   logger.info("before " + joinPoint);
//	   }
//   }
   
   
 //配置controller环绕通知,使用在方法aspect()上注册的切入点
   @Around("controllerAspect()")
   public Object around(JoinPoint joinPoint){
//	   System.out.println("==========开始执行controller环绕通知===============");
	   long start = System.currentTimeMillis();
	   Object obj = null;
	   try {
		obj=((ProceedingJoinPoint) joinPoint).proceed();
		long end = System.currentTimeMillis();
		if(logger.isInfoEnabled()){
			logger.info("around " + joinPoint + "\tUse time : " + (end - start) + " ms!");
		}
//		 System.out.println("==========结束执行controller环绕通知===============");
		 
	} catch (Throwable e) {
		// TODO Auto-generated catch block
		 logger.info(e.getMessage());
		 e.printStackTrace();
		 long end = System.currentTimeMillis();
		 if(logger.isInfoEnabled()){
			 logger.info("around " + joinPoint + "\tUse time : " + (end - start) + " ms with exception : " + e.getMessage());
		 }
	}
	   return obj;
   }
 //配置controller环绕通知,使用在方法aspect()上注册的切入点
   @Around("loginAspect()")
   public Object aroundLogin(JoinPoint joinPoint){
//	   System.out.println("==========开始执行controller环绕通知===============");
	   long start = System.currentTimeMillis();
	   Object obj = null;
	   try {
		obj=((ProceedingJoinPoint) joinPoint).proceed();
		long end = System.currentTimeMillis();
		if(logger.isInfoEnabled()){
			logger.info("around " + joinPoint + "\tUse time : " + (end - start) + " ms!");
		}
//		 System.out.println("==========结束执行controller环绕通知===============");
		 
	} catch (Throwable e) {
		 logger.info(e.getMessage());
		// TODO Auto-generated catch block
		 long end = System.currentTimeMillis();
		 if(logger.isInfoEnabled()){
			 logger.info("around " + joinPoint + "\tUse time : " + (end - start) + " ms with exception : " + e.getMessage());
		 }
	}
	   return obj;
   }
   /**
    * 后置通知 用于拦截Controller层记录用户的操作 
    */
   @SuppressWarnings("unchecked")
   @After("controllerAspect()")
   public void after(JoinPoint joinPoint){
	   HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
	   Subject subject = SecurityUtils.getSubject();
	   String userName =  (String) subject.getPrincipal();
	   if(userName!=null){
		  
		try { 
			String targetName = joinPoint.getTarget().getClass().getName();  
		   String methodName = joinPoint.getSignature().getName();  
		   Object[] arguments = joinPoint.getArgs();  
		   Class 	targetClass = Class.forName(targetName);
		   Method[] methods = targetClass.getMethods();
		   String operationType = "";
		   String operationName = "";
		   for (Method method : methods) {  
		        if (method.getName().equals(methodName)) {  
		               Class[] clazzs = method.getParameterTypes();  
		                if (clazzs.length == arguments.length) {  
//		                	operationType = method.getAnnotation(SystemLog.class).operationType();
//		                    operationName = method.getAnnotation(SystemLog.class).operationName();
		                    break;  
		                }  
		        }  
		   } 

			 Map monitorMap = new HashMap();
		        url = "";
		        paramStr = "";
		        // 求访问的参数
		        Map pMap = ParameterMap.getParameterMap(request.getParameterMap());
		        if(pMap != null){
		            paramStr = pMap.toString();
		            paramStr = paramStr.substring(1, paramStr.length() - 1);
		            if(paramStr.length() > 1000){
		                paramStr = paramStr.substring(0, 1000);
		            }
		        }
		        url = request.getServletPath() + (request.getQueryString() != null ? "?" + request.getQueryString() : "");
		        url = url.length() > 500 ? url.substring(0, 500) : url;
		        this.actionUrl = url;
		        try {
		        	    monitorMap.put("UUID",  UUIDGenerator.getUUID());
		        	    monitorMap.put("DESCRIPTION", operationName);
				        monitorMap.put("METHOD", (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+"."+operationType);
				        monitorMap.put("LOGTYPE", 0l);
				        String aIP=getIP4(request);//获取请求访问的公网IP地址
				        monitorMap.put("REQUESTIP", aIP);
				        monitorMap.put("EXCEPTIONCODE", null);
				        monitorMap.put("EXCEPTIONDETAIL", null);
				        monitorMap.put("PARAMS", paramStr);
				        monitorMap.put("CREATEBY", userName);
				        monitorMap.put("CREATEDATE", new Date());
				        monitorMap.put("URL", url);
				        systemLogService.insert(monitorMap);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					 logger.error("==前置通知异常==");    
			         e.printStackTrace();
				}
	        
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		   
		   
	   }
   }
   
   @Autowired  
   private  HttpServletRequest request; 
   /**
    * 后置通知 用于拦截Controller层记录用户的操作 
    */
   @SuppressWarnings("unchecked")
   @After("loginAspect()")
   public void afterLogin(JoinPoint joinPoint){
//	   HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
	   
//	   ActionContext ac = ActionContext.getContext();
//	   HttpServletRequest request =HttpServletRequest)ac.get(ServletActionContext.HTTP_REQUEST);
//	   HttpServletRequest request = ServletActionContext.getRequest();
	   Subject subject = SecurityUtils.getSubject();
	   String userName =  (String) subject.getPrincipal();
	   if(userName!=null){
		  
			/*String targetName = joinPoint.getTarget().getClass().getName();  
		   String methodName = joinPoint.getSignature().getName();  
		   Object[] arguments = joinPoint.getArgs();  
		   Class 	targetClass = Class.forName(targetName);
		   Method[] methods = targetClass.getMethods();
		   String operationType = "";
		   String operationName = "";
		   for (Method method : methods) {  
		        if (method.getName().equals(methodName)) {  
		               Class[] clazzs = method.getParameterTypes();  
		                if (clazzs.length == arguments.length) {  
		                	operationType = method.getAnnotation(SystemLog.class).operationType();
		                    operationName = method.getAnnotation(SystemLog.class).operationName();
		                    break;  
		                }  
		        }  
		   } 
*/
			 Map paramsMap = new HashMap();
		        url = "";
		        paramStr = "";
		        // 求访问的参数
		        try {
		        Map pMap = ParameterMap.getParameterMap(request.getParameterMap());
		        if(pMap != null){
		            paramStr = pMap.toString();
		            paramStr = paramStr.substring(1, paramStr.length() - 1);
		            if(paramStr.length() > 1000){
		                paramStr = paramStr.substring(0, 1000);
		            }
		        }
		        url = request.getServletPath() + (request.getQueryString() != null ? "?" + request.getQueryString() : "");
		        url = url.length() > 500 ? url.substring(0, 500) : url;
		        this.actionUrl = url;
		                paramsMap.put("UUID", UUIDGenerator.getUUID());
		    	        paramsMap.put("USERNAME", SecurityUtils.getSubject().getPrincipal().toString());
		    	        paramsMap.put("LOGDATE", new Date());
		    	        paramsMap.put("CLASSNAME", joinPoint.getTarget().getClass().getName());
		    	        paramsMap.put("METHODNAME", joinPoint.getSignature().getName() + "()");
		    	        
		    	        String aIP=getIP4(request);
		    	        paramsMap.put("IP", aIP);
		    	        //paramsMap.put("IP", request.getRemoteAddr());
		    	        paramsMap.put("URL",url);
		    	        paramsMap.put("CS", paramStr);
				        loginLogService.insertLogionLog(paramsMap);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					 logger.error("==前置通知异常==");    
			         e.printStackTrace();
				}
	        
		   
	   }
   }
   
  /* 获取IP地址代码*/
   public static String getIP4(HttpServletRequest request){   
		String ip = request.getHeader("x-forwarded-for");       
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {     
			ip = request.getHeader("Proxy-Client-IP");         }      
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {     
			ip = request.getHeader("WL-Proxy-Client-IP");         }    
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {         
			ip = request.getRemoteAddr();
			}
		System.out.println(ip);
		return ip;
		
	}

//    //配置后置返回通知,使用在方法aspect()上注册的切入点
//   @AfterReturning("controllerAspect()")
//   public void afterReturn(JoinPoint joinPoint){
//	   System.out.println("=====执行controller后置返回通知=====");  
//	   if(logger.isInfoEnabled()){
//		   logger.info("afterReturn " + joinPoint);
//	   }
//   }
   /**
    * 异常通知 用于拦截记录异常日志 （暂时不用）
    * @param joinPoint
    * @param e
    */
//   @SuppressWarnings("unchecked")
//   @AfterThrowing(pointcut = "controllerAspect()", throwing="e")
//   public  void doAfterThrowing(JoinPoint joinPoint, Throwable e) {
//	   HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
//	   Subject subject = SecurityUtils.getSubject();
//		String userName =  (String) subject.getPrincipal();
//	   if(userName!=null){
//		   String params = "";  
//            if (joinPoint.getArgs() !=  null && joinPoint.getArgs().length > 0) {  
//		    for ( int i = 0; i < joinPoint.getArgs().length; i++) {  
//		        params += JSON.toJSONString(joinPoint.getArgs()[i]) + ";";  
//		      }  
//		    }  
//           
//            Map monitorMap = new HashMap();
//			try {
//				 String targetName = joinPoint.getTarget().getClass().getName();  
//		            String methodName = joinPoint.getSignature().getName();  
//		            Object[] arguments = joinPoint.getArgs();  
//		            Class targetClass = Class.forName(targetName);
//		            Method[] methods = targetClass.getMethods();
//		            String operationType = "";
//		            String operationName = "";
//		            for (Method method : methods) {  
//		            if (method.getName().equals(methodName)) {  
//		            Class[] clazzs = method.getParameterTypes();  
//		            if (clazzs.length == arguments.length) {  
//		            operationType = method.getAnnotation(SystemLog.class).operationType();
//		            operationName = method.getAnnotation(SystemLog.class).operationName();
//		            break;  
//		                  }
//		               }
//		            }
////		            ========控制台输出=========  
//		            System.out.println("=====异常通知开始=====");  
//		            System.out.println("异常代码:" + e.getClass().getName());  
//		            System.out.println("异常信息:" + e.getMessage());  
//		            System.out.println("异常方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+"."+operationType);  
//		            System.out.println("方法描述:" + operationName);  
//		            System.out.println("请求人:" + userName);  
//		            System.out.println("请求IP:" + request.getRemoteAddr());  
//		            System.out.println("请求参数:" + params);
//		            monitorMap.put("UUID",  UUIDGenerator.getUUID());
//	        	    monitorMap.put("DESCRIPTION", operationName);
//			        monitorMap.put("METHOD", (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+"."+operationType);
//			        monitorMap.put("LOGTYPE", 1l);
//			        monitorMap.put("REQUESTIP", request.getRemoteAddr());
//			        monitorMap.put("EXCEPTIONCODE", e.getClass().getName());
//			        monitorMap.put("EXCEPTIONDETAIL", e.getMessage());
//			        monitorMap.put("PARAMS", paramStr);
//			        monitorMap.put("CREATEBY", userName);
//			        monitorMap.put("CREATEDATE", new Date());
//			        monitorMap.put("URL", url);
//			        systemLogService.insert(monitorMap);
//			        System.out.println("=====异常通知结束=====");
//			} catch (Exception ex) {
//				// TODO Auto-generated catch block
//				 //记录本地异常日志  
//				logger.error("==异常通知异常==");  
//				logger.error(ex.getMessage());
//			}
////			 ==========记录本地异常日志==========  
//			 logger.error("异常方法:{}异常代码:{}异常信息:{}参数:{}"+joinPoint.getTarget().getClass().getName() + joinPoint.getSignature().getName());  
//           
//	   }
//	   }
   }