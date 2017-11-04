package com.cssnb.index.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.WebRequest;

import com.cssnb.baseframework.core.util.ParameterUtil;
import com.cssnb.initpage.service.InitpageService;
import com.cssnb.users.service.UsersService;
import com.cssnb.util.SystemLog;
import com.cssnb.util.UserPublic;

@Controller
@RequestMapping("/index")
public class indexController {
	@Autowired
	public InitpageService initpageService;
	 
   
		@SystemLog(operationType="forward",operationName="") 
	    @RequestMapping("/go")
	    public String getGztblist(HttpServletRequest request){
	    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
	    	 
	    	return "/index";
	    }
	 
}
