package com.cssnb.monitor.controller;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cssnb.monitor.service.UService;
import com.cssnb.util.SystemLog;

@Controller
public class UController {
   
	 @Autowired
	 private UService uService;
	 @RequestMapping("testAOP")
	 @SystemLog(operationType="add操作:",operationName="添加用户")  
	 public void testAOP(String userName,String password){        
	 uService.add(userName, password);
	 }
	 @Test
	 public void testAOP1(){
		 //启动Spring容器        
		//启动Spring容器        
			ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
			//获取service或controller组件
			UController uController = (UController) ctx.getBean("userController");
			uController.testAOP("zhangsan", "123456");
			}
}
