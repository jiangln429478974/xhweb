package com.cssnb.monitor.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cssnb.monitor.dao.ExceptionDao;

@Service
public class ExceptionService {
   @Resource
   private ExceptionDao exceptionDao;
   
   public void insertException(Map map){
	   
	   exceptionDao.insertException(map);
   }
}
