package com.cssnb.monitor.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cssnb.monitor.controller.UController;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//启动Spring容器        
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		//获取service或controller组件
		UController uController = (UController) ctx.getBean("userController");
		uController.testAOP("zhangsan", "123456");
		}

}
