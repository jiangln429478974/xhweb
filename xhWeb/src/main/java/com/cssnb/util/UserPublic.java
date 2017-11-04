package com.cssnb.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

public class UserPublic{
	public static String login(){
		Subject subject = SecurityUtils.getSubject();
		String userName =  (String) subject.getPrincipal();
		return userName;
	}
}
