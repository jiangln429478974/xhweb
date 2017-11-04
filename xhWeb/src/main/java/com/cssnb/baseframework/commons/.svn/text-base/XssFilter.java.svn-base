package com.cssnb.baseframework.commons;

import java.io.IOException;  
import java.util.Map;

import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.HttpServletRequest;  
  
import org.apache.commons.lang3.StringUtils;  
  
  
/** 
 * XSS过滤器 
 * 用于过滤XSS 
 * @author William 
 * @since 2014-11-21 
 */  
public class XssFilter implements Filter {  
      
    /**  
    * 需要排除的页面  
    */    
    private String excludedPages;    
        
    private String[] excludedPageArray;   
      
    @SuppressWarnings("unused")  
    private FilterConfig filterConfig;  
  
    public void destroy() {  
        this.filterConfig = null;  
    }  
      
    public void doFilter(ServletRequest request, ServletResponse response,  
            FilterChain chain) throws IOException, ServletException {  
          
        boolean isExcludedPage = false;  
          
        HttpServletRequest request2 = (HttpServletRequest) request;  
        String ctx_path = request2.getContextPath();  
        String request_uri = request2.getRequestURI();  
        String action = request_uri.substring(ctx_path.length());  
          
        //判断是否在过滤url之外   
        for (String page : excludedPageArray) {  
//            if (page.equals(action)) { 
        	if (action.indexOf(page)>-1) { 
                isExcludedPage = true;   
                break;  
            }  
        }  
          
        if (isExcludedPage) {  
            chain.doFilter(request, response);  
        } else {  
        	Map<String,String[]> request_map = request2.getParameterMap();
            chain.doFilter(new RequestWrapper(request2,request_map), response);  
        }  
          
    }

      
    /** 
     * 自定义过滤规则 
     */  
    public void init(FilterConfig filterConfig) throws ServletException {  
        this.filterConfig = filterConfig;  
        excludedPages = filterConfig.getInitParameter("excludedPages");    
        if (StringUtils.isNotEmpty(excludedPages)) {  
            excludedPageArray = excludedPages.replaceAll("[\\s]", "").split(",");  
        }  
    }  
      
      
}  
