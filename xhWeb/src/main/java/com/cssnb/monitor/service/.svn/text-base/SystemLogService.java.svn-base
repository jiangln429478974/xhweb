package com.cssnb.monitor.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cssnb.monitor.dao.SystemLogMapper;

@Service
public class SystemLogService {
   @Resource
   private SystemLogMapper systemLogMapper;
   
   public void insert(Map map)throws Exception{
	   
	   systemLogMapper.insert(map);
   }
}
