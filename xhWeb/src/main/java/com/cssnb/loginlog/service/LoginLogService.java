package com.cssnb.loginlog.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cssnb.loginlog.dao.LoginLogDao;

@Service
public class LoginLogService {
      @Resource
      private LoginLogDao loginLogDao;
      
      public void insertLogionLog(Map map){
    	  
    	  loginLogDao.insertLoginLog(map);
      }
}
