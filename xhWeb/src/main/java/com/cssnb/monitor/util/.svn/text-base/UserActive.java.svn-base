package com.cssnb.monitor.util;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.druid.support.monitor.MonitorClient;
import com.alibaba.druid.support.monitor.MonitorContext;
import com.cssnb.monitor.dao.MonitorDao;
import com.cssnb.monitor.service.MonitorService;
import com.cssnb.util.ParameterMap;
import com.google.common.util.concurrent.Monitor;
import com.sun.corba.se.spi.monitoring.MonitoringConstants;
@SuppressWarnings({ "unchecked", "rawtypes" })
public class UserActive implements MethodBeforeAdvice {
	   @Autowired
	    private MonitorDao monitorDao;
	    private HttpServletRequest request;
	    private String url, actionUrl, paramStr = "";
	@Override
	public void before(Method arg0, Object[] arg1, Object o)
			throws Throwable {
		// TODO Auto-generated method stub
        /**
         * 操作前开始检控
         */
		 request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String username = SecurityUtils.getSubject().getPrincipal().toString();
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
        monitorMap.put("USERNAME", username);
        monitorMap.put("OPERATINGDATE", new Date());
        monitorMap.put("CLASSNAME", o.getClass().toString().replace("class ", ""));
        monitorMap.put("METHODNAME", arg0.getName());
        monitorMap.put("IP", request.getRemoteAddr());
        monitorMap.put("URL",url);
        monitorMap.put("CS", paramStr);
        monitorDao.insertMonitor(monitorMap);
        
	}
	 public void beforeService(){
	        if(request != null){
	            url = request.getServletPath() + (request.getQueryString() != null ? "?" + request.getQueryString() : "");
	            url = url.length() > 500 ? url.substring(0, 500) : url;
	            if(this.actionUrl.equals(url)){
	                String username = SecurityUtils.getSubject().getPrincipal().toString();
	            }
	        }
	    }
}
