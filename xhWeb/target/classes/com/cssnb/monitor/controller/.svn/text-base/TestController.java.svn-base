package com.cssnb.monitor.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.annotation.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cssnb.baseframework.core.util.ParameterUtil;
import com.cssnb.monitor.service.TestService;
import com.cssnb.monitor.util.MethodLog;
import com.cssnb.monitor.util.SystemControllerLog;
import com.cssnb.monitor.util.SystemServiceLog;
import com.cssnb.util.SystemLog;

@Controller
@RequestMapping("test")
public class TestController {
	@Resource
	private TestService testService;
    /**
     * 返回添加页面
     * @return
     */
	@SystemLog(operationType="forword操作:",operationName="跳转到insert页面")
	@RequestMapping(method=RequestMethod.GET,value = "insert")
	public ModelAndView Property(){
		return new ModelAndView("cs/insert");
	}
	@RequestMapping(method=RequestMethod.POST,value="save")
	@MethodLog(operationType="add操作:",operationName="添加学生信息")  
	@ResponseBody
	public Object insert(WebRequest request){
		Map<String, Object> webMap = ParameterUtil.getFilterMap(request);
		Map<String, Object> paramsMap =new  HashMap<String, Object>();
		
		try {
			testService.insert(webMap);
			paramsMap.put("success", "保存成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			paramsMap.put("success", "保存失败！");
		}
		
		return paramsMap;
	}
	
}
