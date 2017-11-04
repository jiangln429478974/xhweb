package com.cssnb.monitor.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cssnb.monitor.dao.MonitorDao;

@Service
public class MonitorService {
       @Resource
       private MonitorDao monitorDao;
       /**
        * 日至监控写入
        * @param map
        * @throws Exception
        */
       public  void insertLog(Map map)throws Exception{
    	   
    	   monitorDao.insertMonitor(map);
       }
}
